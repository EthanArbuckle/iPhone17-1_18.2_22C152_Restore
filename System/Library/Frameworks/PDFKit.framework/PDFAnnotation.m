@interface PDFAnnotation
+ (BOOL)annotationPageLayerEffectIsFlipped;
+ (NSString)nameForLineStyle:(PDFLineStyle)style;
+ (PDFLineStyle)lineStyleFromName:(NSString *)name;
+ (double)detectedFormFieldDefaultFontSize;
+ (id)PDFAnnotationKeysForRedactionDiscoverability;
+ (id)PDFAnnotationKeysWithStringValues;
+ (id)PDFFormFieldBackgroundColor;
+ (id)PDFKitAnnotationKeys;
+ (id)PDFKitAnnotationUndoManagerDisplayNames;
+ (id)PDFKitAppearanceDictionaryArray;
+ (id)PDFKitBorderStyleArray;
+ (id)PDFKitFieldTypeArray;
+ (id)PDFKitHighlightingModeArray;
+ (id)PDFKitSubtypeArray;
+ (id)PDFMarkupColors;
+ (id)PDFMarkupStyleLabels;
+ (id)PDFTextBorderColorForMarkupStyle:(unint64_t)a3;
+ (id)PDFTextBorderColors;
+ (id)PDFTextColorForMarkupStyle:(unint64_t)a3;
+ (id)PDFTextColors;
+ (id)PresentableStringForAnnotationKey:(id)a3;
+ (id)SubtypeForPDFMarkupStyle:(unint64_t)a3;
+ (id)createDetectedTextFieldWithBounds:(CGRect)a3 font:(id)a4 textContentType:(id)a5 page:(id)a6;
+ (id)createWithPKDrawing:(id)a3 bounds:(CGRect)a4;
+ (id)detectedFormFieldDefaultFontName;
+ (id)getProperNameStringFromString:(id)a3;
+ (id)newPDFAnnotationFromAKAnnotation:(id)a3;
+ (int64_t)MarkupTypeForMarkupStyle:(unint64_t)a3;
+ (void)setAnnotationPageLayerEffectIsFlipped:(BOOL)a3;
- ($109F14CB9CD3811A6C59613AC76ACC48)_calculatePDFAnnotationLayerOutsetForAction:(int)a3;
- (BOOL)_BOOLValueForAnnotationFlag:(unint64_t)a3 withDefaultValue:(BOOL)a4;
- (BOOL)_BOOLValueForWidgetFieldFlag:(unint64_t)a3;
- (BOOL)_annotationAllowsCommenting:(id)a3;
- (BOOL)_isTextMarkupRedaction;
- (BOOL)_isValidAnnotationKey:(id)a3;
- (BOOL)_setArray:(id)a3 forAnnotationKey:(id)a4;
- (BOOL)_setDictionary:(id)a3 forAnnotationKey:(id)a4;
- (BOOL)_setInteger:(id)a3 forAnnotationKey:(id)a4;
- (BOOL)_setString:(id)a3 forAnnotationKey:(id)a4;
- (BOOL)_setVarious:(id)a3 forAnnotationKey:(id)a4;
- (BOOL)_shouldReadAppearanceStreams;
- (BOOL)addDestinationToDictionaryRef:(__CFDictionary *)a3;
- (BOOL)allowsToggleToOff;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)contentsLocked;
- (BOOL)handledByPDFKit;
- (BOOL)handledByPDFKitCheckAKEnabled:(BOOL)a3;
- (BOOL)hasAppearanceStream;
- (BOOL)hasComb;
- (BOOL)inFormFillingMode;
- (BOOL)intersectsWithRedactionPath;
- (BOOL)isActivatableTextField;
- (BOOL)isAppearanceStreamEmpty;
- (BOOL)isAutofillNewContextStart;
- (BOOL)isDetectedCheckbox;
- (BOOL)isDetectedSignature;
- (BOOL)isFormField;
- (BOOL)isFullyConstructed;
- (BOOL)isHidden;
- (BOOL)isHighlighted;
- (BOOL)isInvisible;
- (BOOL)isListChoice;
- (BOOL)isLocked;
- (BOOL)isMarkupAnnotation;
- (BOOL)isMarkupAnnotationSubtype;
- (BOOL)isMultiline;
- (BOOL)isNoteAnnotation;
- (BOOL)isOpen;
- (BOOL)isPasswordField;
- (BOOL)isReadOnly;
- (BOOL)isReadOnlyAnnotation;
- (BOOL)isRedaction;
- (BOOL)isSelected;
- (BOOL)isSignature;
- (BOOL)isSynthesizedFormField;
- (BOOL)isTextMarkupOrNoteAnnotation;
- (BOOL)isTextWidget;
- (BOOL)isTransparent;
- (BOOL)isWidgetOrMarkupAnnotation;
- (BOOL)noteContainsPoint:(CGPoint)a3;
- (BOOL)pointerIsOverAnnotation;
- (BOOL)popupDrawsCloseWidget;
- (BOOL)popupDrawsText;
- (BOOL)radiosInUnison;
- (BOOL)savesAppearanceStream;
- (BOOL)setBoolean:(BOOL)value forAnnotationKey:(PDFAnnotationKey)key;
- (BOOL)setRect:(CGRect)value forAnnotationKey:(PDFAnnotationKey)key;
- (BOOL)setValue:(id)value forAnnotationKey:(PDFAnnotationKey)key;
- (BOOL)shouldBurnIn;
- (BOOL)shouldComb;
- (BOOL)shouldDisplay;
- (BOOL)shouldExport;
- (BOOL)shouldNotRotate;
- (BOOL)shouldNotZoom;
- (BOOL)shouldPrint;
- (BOOL)shouldReportAnalytics;
- (BOOL)shouldToggleNoView;
- (BOOL)suppressAppearanceStreamText;
- (CGDisplayList)cachedAppearance:(int)a3;
- (CGPDFAnnotation)CGPDFAnnotation;
- (CGPDFDictionary)popupDictionary;
- (CGPDFDictionary)sourceDictionary;
- (CGPDFForm)appearance:(int)a3;
- (CGPath)cgPathArray;
- (CGPath)quadPointsPath;
- (CGPoint)_pointOutsetFrom:(CGPoint)a3 startPoint1:(CGPoint)a4 startPoint2:(CGPoint)a5 lineWidth:(double)a6;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (CGRect)_drawingRectForLineStyle:(int64_t)a3 from:(CGPoint)a4 to:(CGPoint)a5 borderWidth:(double)a6;
- (CGRect)bounds;
- (CGRect)extendedBoundsForAction:(int)a3;
- (CGRect)noteBounds;
- (CRNormalizedQuad)boundingQuad;
- (Class)annotationSubclassForPopup;
- (NSArray)choices;
- (NSArray)paths;
- (NSArray)quadrilateralPoints;
- (NSArray)values;
- (NSDate)modificationDate;
- (NSDictionary)annotationKeyValues;
- (NSInteger)maximumLength;
- (NSString)caption;
- (NSString)contents;
- (NSString)description;
- (NSString)fieldName;
- (NSString)fieldValue;
- (NSString)stampName;
- (NSString)toolTip;
- (NSString)type;
- (NSString)userName;
- (NSString)widgetDefaultStringValue;
- (NSString)widgetFieldType;
- (NSString)widgetStringValue;
- (NSTextAlignment)alignment;
- (NSURL)URL;
- (PDFAction)action;
- (PDFAnnotation)init;
- (PDFAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4;
- (PDFAnnotation)initWithBounds:(CGRect)bounds forType:(PDFAnnotationSubtype)annotationType withProperties:(NSDictionary *)properties;
- (PDFAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4;
- (PDFAnnotation)initWithCoder:(id)a3;
- (PDFAnnotation)initWithDictionary:(NSDictionary *)dictionary forPage:(PDFPage *)page;
- (PDFAnnotation)popup;
- (PDFBorder)border;
- (PDFDestination)destination;
- (PDFLineStyle)endLineStyle;
- (PDFLineStyle)startLineStyle;
- (PDFMarkupType)markupType;
- (PDFPage)page;
- (PDFTextAnnotationIconType)iconType;
- (PDFWidgetCellState)buttonWidgetState;
- (PDFWidgetControlType)widgetControlType;
- (UIColor)backgroundColor;
- (UIColor)color;
- (UIColor)fontColor;
- (UIColor)interiorColor;
- (UIFont)font;
- (__CFDictionary)commonCreateDictionaryRef;
- (__CFDictionary)dictionaryRef;
- (__CFDictionary)dictionaryRefExcludingParentOrPopup;
- (__CFDictionary)gcCreateAttributesForFont:(id)a3 color:(id)a4;
- (double)pointSizeFromAppearanceTokens:(id)a3;
- (double)scaleFactor;
- (double)suggestedLineHeight;
- (id)_PDFMarkupColorForColor:(id)a3;
- (id)_PDFTextColorForColor:(id)a3;
- (id)_accessibilityTypeString;
- (id)_createArrayForCGRect:(CGRect)a3;
- (id)_createArrayForColor:(id)a3;
- (id)_getFullFieldNameFromDictionary:(CGPDFDictionary *)a3;
- (id)_selectionForMarkupAnnotation;
- (id)_textForValue:(id)a3;
- (id)accessibilityNode;
- (id)akAnnotation;
- (id)akAnnotationAdaptor;
- (id)autoFillTextContentType;
- (id)colorFromAppearanceTokens:(id)a3;
- (id)control;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createAKAnnotation;
- (id)createAttributedStringForTextWidget;
- (id)createDefaultAppearanceStringWithFont:(id)a3 fontColor:(id)a4;
- (id)debugQuickLookObject;
- (id)displayName;
- (id)fontNameFromAppearanceTokens:(id)a3;
- (id)formData;
- (id)getAKTextView;
- (id)getColorFromAppearanceNSString:(id)a3;
- (id)getColorFromAppearanceString:(CGPDFString *)a3;
- (id)getFontFromAppearanceNSString:(id)a3;
- (id)getFontFromAppearanceString:(CGPDFString *)a3;
- (id)getPDFKeyMappingDictionary;
- (id)indexSetForQuadPoints;
- (id)initCommonWithBounds:(CGRect)a3;
- (id)interactiveBackgroundColor;
- (id)labelText;
- (id)mouseDownAction;
- (id)parent;
- (id)pathLock;
- (id)pdfAnnotationUUID;
- (id)replaceTextWidgetWithString:(id)a3;
- (id)scaledFontForTextWidget;
- (id)textMarkupString;
- (id)tokenizeAppearanceString:(id)a3;
- (id)uiControl;
- (id)valueForAnnotationKey:(PDFAnnotationKey)key;
- (id)valueForCGPDFObject:(CGPDFObject *)a3 visitedSet:(__CFSet *)a4 isInternalObject:(BOOL *)a5;
- (id)widgetOnStateString;
- (int64_t)priority;
- (unint64_t)autofillEntryType;
- (unint64_t)fieldSource;
- (unint64_t)fieldType;
- (unint64_t)flags;
- (unint64_t)formContentType;
- (unint64_t)layoutDirection;
- (unint64_t)markupStyle;
- (unint64_t)maxCharacterCount;
- (unint64_t)textContentType;
- (void)_addAKAnnotationToDictionary:(__CFDictionary *)a3;
- (void)_addUnknownPropertiesToDictionaryRef:(__CFDictionary *)a3;
- (void)_didRemoveValueForAnnotationKey:(id)a3;
- (void)_didSetValue:(id)a3 forAnnotationKey:(id)a4;
- (void)_drawAnnotationWithBox:(int64_t)a3 inContext:(CGContext *)a4;
- (void)_generateFormFieldName;
- (void)_printDictionary:(id)a3 atDepth:(int)a4;
- (void)_releaseDictionaryRef;
- (void)_restorePropertiesAfterSetBounds;
- (void)_sanitizeValue:(id)a3 forKey:(id)a4;
- (void)_savePropertiesBeforeSetBounds;
- (void)_setBoolValue:(BOOL)a3 forAnnotationFlag:(unint64_t)a4;
- (void)_setBoolValue:(BOOL)a3 forWidgetFieldFlag:(unint64_t)a4;
- (void)addActionToDictionaryRef:(__CFDictionary *)a3;
- (void)addAdditionalActionsToDictionaryRef:(__CFDictionary *)a3;
- (void)addAlternateFieldNameToDictionaryRef:(__CFDictionary *)a3;
- (void)addAppearanceCharacteristicsToDictionaryRef:(__CFDictionary *)a3;
- (void)addAppearanceForKey:(__CFString *)a3 toDictionaryRef:(__CFDictionary *)a4;
- (void)addBezierPath:(UIBezierPath *)path;
- (void)addBorderStyleToDictionaryRef:(__CFDictionary *)a3;
- (void)addBorderToDictionaryRef:(__CFDictionary *)a3;
- (void)addColor:(id)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5;
- (void)addContentsToDictionaryRef:(__CFDictionary *)a3;
- (void)addControl;
- (void)addDefaultAppearanceDictionaryRef:(__CFDictionary *)a3;
- (void)addDefaultFieldValueToDictionaryRef:(__CFDictionary *)a3;
- (void)addFieldFlagsToDictionaryRef:(__CFDictionary *)a3;
- (void)addFieldNameToDictionaryRef:(__CFDictionary *)a3;
- (void)addFieldTypeToDictionaryRef:(__CFDictionary *)a3;
- (void)addFieldValueToDictionaryRef:(__CFDictionary *)a3;
- (void)addFlagsToDictionaryRef:(__CFDictionary *)a3;
- (void)addHighlightingModeToDictionaryRef:(__CFDictionary *)a3;
- (void)addInkListToDictionaryRef:(__CFDictionary *)a3;
- (void)addLineEndingStylesToDictionaryRef:(__CFDictionary *)a3;
- (void)addLineToDictionaryRef:(__CFDictionary *)a3;
- (void)addMaxLenToDictionaryRef:(__CFDictionary *)a3;
- (void)addModificationDateToDictionaryRef:(__CFDictionary *)a3;
- (void)addNameToDictionaryRef:(__CFDictionary *)a3;
- (void)addNormalAndDownAppearanceToDictionaryRef:(__CFDictionary *)a3;
- (void)addNormalAndDownAppearanceWithStateToDictionaryRef:(__CFDictionary *)a3;
- (void)addNormalAppearanceToDictionaryRef:(__CFDictionary *)a3;
- (void)addNormalAppearanceWithStateToDictionaryRef:(__CFDictionary *)a3;
- (void)addOpenToDictionaryRef:(__CFDictionary *)a3;
- (void)addOptionsToDictionaryRef:(__CFDictionary *)a3;
- (void)addPageReferenceToDictionaryRef:(__CFDictionary *)a3;
- (void)addPopupToDictionaryRef:(__CFDictionary *)a3;
- (void)addQuadPointsToDictionaryRef:(__CFDictionary *)a3;
- (void)addQuaddingToDictionaryRef:(__CFDictionary *)a3;
- (void)addRect:(CGRect)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5;
- (void)addTextLabelToDictionaryRef:(__CFDictionary *)a3;
- (void)addToPageView;
- (void)cacheAppearances;
- (void)clearFormData;
- (void)commonInit;
- (void)dealloc;
- (void)decodeUnknownAnnotationProperties;
- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5;
- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7;
- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7 suppressTextRendering:(BOOL)a8;
- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 scaleProportional:(BOOL)a6;
- (void)drawCachedAppearance:(CGDisplayList *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)getAppearancesFromDictionary:(CGPDFDictionary *)a3 ofType:(int)a4;
- (void)highlightRedaction:(BOOL)a3;
- (void)postAnnotationsChangedNotification;
- (void)printDictionaryKeyValues;
- (void)releaseCGPathArray;
- (void)removeAKAnnotationAdaptor;
- (void)removeAllAppearanceStreams;
- (void)removeBezierPath:(UIBezierPath *)path;
- (void)removeFromPageView;
- (void)removeValueForAnnotationKey:(PDFAnnotationKey)key;
- (void)secondaryInit;
- (void)setAccessibilityNode:(id)a3;
- (void)setAction:(PDFAction *)action;
- (void)setAlignment:(NSTextAlignment)alignment;
- (void)setAllowsToggleToOff:(BOOL)allowsToggleToOff;
- (void)setAppearance:(CGPDFForm *)a3 forType:(int)a4;
- (void)setAutoFillTextContentType:(id)a3;
- (void)setAutofillEntryType:(unint64_t)a3;
- (void)setAutofillNewContextStart:(BOOL)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBorder:(PDFBorder *)border;
- (void)setBounds:(CGRect)bounds;
- (void)setBoundsWithUndo:(CGRect)a3;
- (void)setButtonWidgetState:(PDFWidgetCellState)buttonWidgetState;
- (void)setButtonWidgetStateString:(NSString *)buttonWidgetStateString;
- (void)setCGPDFAnnotation:(CGPDFAnnotation *)a3;
- (void)setCGPathArray:(CGPath *)a3;
- (void)setCaption:(NSString *)caption;
- (void)setChoices:(NSArray *)choices;
- (void)setColor:(UIColor *)color;
- (void)setComb:(BOOL)comb;
- (void)setContents:(NSString *)contents;
- (void)setContents:(id)a3 withUndo:(BOOL)a4;
- (void)setContentsLocked:(BOOL)a3;
- (void)setControl:(id)a3;
- (void)setDestination:(PDFDestination *)destination;
- (void)setDictionaryRef:(__CFDictionary *)a3;
- (void)setEndLineStyle:(PDFLineStyle)endLineStyle;
- (void)setEndPoint:(CGPoint)endPoint;
- (void)setFieldName:(NSString *)fieldName;
- (void)setFont:(UIFont *)font;
- (void)setFontColor:(UIColor *)fontColor;
- (void)setForExport:(BOOL)a3;
- (void)setFormContentType:(unint64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setIconType:(PDFTextAnnotationIconType)iconType;
- (void)setInteriorColor:(UIColor *)interiorColor;
- (void)setInvisible:(BOOL)a3;
- (void)setIsDetectedCheckbox:(BOOL)a3;
- (void)setIsDetectedSignature:(BOOL)a3;
- (void)setIsFullyConstructed:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setIsSignature:(BOOL)a3;
- (void)setIsTransparent:(BOOL)a3;
- (void)setLabelText:(id)a3;
- (void)setListChoice:(BOOL)listChoice;
- (void)setLocked:(BOOL)a3;
- (void)setMarkupType:(PDFMarkupType)markupType;
- (void)setMaximumLength:(NSInteger)maximumLength;
- (void)setModificationDate:(NSDate *)modificationDate;
- (void)setMouseDownAction:(id)a3;
- (void)setMultiline:(BOOL)multiline;
- (void)setOpen:(BOOL)open;
- (void)setPDFAnnotationDictionary:(id)a3;
- (void)setPDFAnnotationUUID:(id)a3;
- (void)setPage:(PDFPage *)page;
- (void)setParent:(id)a3;
- (void)setPointerIsOverAnnotation:(BOOL)a3;
- (void)setPopup:(PDFAnnotation *)popup;
- (void)setPopupDrawsCloseWidget:(BOOL)a3;
- (void)setPopupDrawsText:(BOOL)a3;
- (void)setPopupInternal:(id)a3 scanPage:(BOOL)a4;
- (void)setQuadPointsForIndexSet:(id)a3 withUndo:(BOOL)a4;
- (void)setQuadrilateralPoints:(NSArray *)quadrilateralPoints;
- (void)setRadiosInUnison:(BOOL)radiosInUnison;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setReadOnlyAnnotation:(BOOL)a3;
- (void)setSavesAppearanceStream:(BOOL)a3;
- (void)setScaleFactor:(double)a3;
- (void)setShouldBurnIn:(BOOL)a3;
- (void)setShouldDisplay:(BOOL)shouldDisplay;
- (void)setShouldHideInteractiveBackgroundColor:(BOOL)a3;
- (void)setShouldNotRotate:(BOOL)a3;
- (void)setShouldNotZoom:(BOOL)a3;
- (void)setShouldPrint:(BOOL)shouldPrint;
- (void)setShouldReportAnalytics:(BOOL)a3;
- (void)setShouldToggleNoView:(BOOL)a3;
- (void)setStampName:(NSString *)stampName;
- (void)setStartLineStyle:(PDFLineStyle)startLineStyle;
- (void)setStartPoint:(CGPoint)startPoint;
- (void)setSuggestedLineHeight:(double)a3;
- (void)setTextContentType:(unint64_t)a3;
- (void)setType:(NSString *)type;
- (void)setURL:(NSURL *)URL;
- (void)setUserName:(NSString *)userName;
- (void)setValues:(NSArray *)values;
- (void)setWidgetControlType:(PDFWidgetControlType)widgetControlType;
- (void)setWidgetDefaultStringValue:(NSString *)widgetDefaultStringValue;
- (void)setWidgetFieldType:(NSString *)widgetFieldType;
- (void)setWidgetOnStateString:(id)a3;
- (void)setWidgetStringValue:(NSString *)widgetStringValue;
- (void)setupAKAnnotationAdaptorIfNecessary;
- (void)updateAnnotationEffect;
- (void)updateFormData;
@end

@implementation PDFAnnotation

- (PDFAnnotation)init
{
  return (PDFAnnotation *)-[PDFAnnotation initCommonWithBounds:](self, "initCommonWithBounds:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (id)initCommonWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PDFAnnotation;
  v7 = [(PDFAnnotation *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(PDFAnnotation *)v7 commonInit];
    -[PDFAnnotation setBounds:](v8, "setBounds:", x, y, width, height);
    [(PDFAnnotation *)v8 secondaryInit];
    v8->_isFullyConstructed = 1;
  }
  return v8;
}

- (PDFAnnotation)initWithBounds:(CGRect)bounds forType:(PDFAnnotationSubtype)annotationType withProperties:(NSDictionary *)properties
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v11 = annotationType;
  v12 = properties;
  v32.receiver = self;
  v32.super_class = (Class)PDFAnnotation;
  v13 = [(PDFAnnotation *)&v32 init];
  v14 = v13;
  if (!v13)
  {
LABEL_18:
    v24 = v14;
    goto LABEL_25;
  }
  [(PDFAnnotation *)v13 commonInit];
  if (v11)
  {
    [(PDFAnnotation *)v14 setRect:@"/Rect", x, y, width, height forAnnotationKey];
    [(PDFAnnotation *)v14 setValue:v11 forAnnotationKey:@"/Subtype"];
    [(PDFAnnotation *)v14 secondaryInit];
    if (v12)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v15 = v12;
      uint64_t v16 = [(NSDictionary *)v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v26 = v12;
        v27 = v11;
        v18 = 0;
        uint64_t v19 = *(void *)v29;
        while (2)
        {
          uint64_t v20 = 0;
          v21 = v18;
          do
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v15);
            }
            v22 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
            v18 = [(NSDictionary *)v15 objectForKey:v22];

            BOOL v23 = [(PDFAnnotation *)v14 setValue:v18 forAnnotationKey:v22];
            if ([v22 isEqualToString:@"/Subtype"])
            {
              if (!v23) {
                goto LABEL_22;
              }
            }
            else if ((([v22 isEqualToString:@"/Rect"] ^ 1 | v23) & 1) == 0)
            {
LABEL_22:
              if (v14->_loggingEnabled) {
                NSLog(&cfstr_ErrorCannotCre_0.isa, v22);
              }

              v24 = 0;
              v12 = v26;
              v11 = v27;
              goto LABEL_25;
            }
            ++v20;
            v21 = v18;
          }
          while (v17 != v20);
          uint64_t v17 = [(NSDictionary *)v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v17) {
            continue;
          }
          break;
        }

        v12 = v26;
        v11 = v27;
      }
    }
    v14->_isFullyConstructed = 1;
    goto LABEL_18;
  }
  if (v14->_loggingEnabled) {
    NSLog(&cfstr_ErrorCannotCre.isa);
  }
  v24 = 0;
LABEL_25:

  return v24;
}

- (PDFAnnotation)initWithDictionary:(NSDictionary *)dictionary forPage:(PDFPage *)page
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v6 = dictionary;
  v7 = page;
  v29.receiver = self;
  v29.super_class = (Class)PDFAnnotation;
  v8 = [(PDFAnnotation *)&v29 init];
  v9 = v8;
  if (v8)
  {
    [(PDFAnnotation *)v8 commonInit];
    objc_super v10 = [(NSDictionary *)v6 objectForKey:@"/Subtype"];

    if (v10)
    {
      v11 = [(NSDictionary *)v6 objectForKey:@"/Rect"];

      if (v11)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v12 = v6;
        uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          BOOL v23 = v7;
          v24 = v6;
          v15 = 0;
          uint64_t v16 = *(void *)v26;
          while (2)
          {
            uint64_t v17 = 0;
            v18 = v15;
            do
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v12);
              }
              uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
              v15 = [(NSDictionary *)v12 objectForKey:v19];

              BOOL v20 = [(PDFAnnotation *)v9 setValue:v15 forAnnotationKey:v19];
              if ([v19 isEqualToString:@"/Subtype"])
              {
                if (!v20) {
                  goto LABEL_22;
                }
              }
              else if ((([v19 isEqualToString:@"/Rect"] ^ 1 | v20) & 1) == 0)
              {
LABEL_22:
                if (v9->_loggingEnabled) {
                  NSLog(&cfstr_ErrorCannotCre_0.isa, v19);
                }

                v21 = 0;
                v7 = v23;
                v6 = v24;
                goto LABEL_28;
              }
              ++v17;
              v18 = v15;
            }
            while (v14 != v17);
            uint64_t v14 = [(NSDictionary *)v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
            if (v14) {
              continue;
            }
            break;
          }

          v7 = v23;
          v6 = v24;
        }

        objc_storeWeak((id *)&v9->_page, v7);
        [(PDFAnnotation *)v9 setValue:v7 forAnnotationKey:@"/P"];
        if (v7) {
          [(PDFPage *)v7 addAnnotation:v9];
        }
        v9->_isFullyConstructed = 1;
        goto LABEL_19;
      }
      if (v9->_loggingEnabled) {
        NSLog(&cfstr_ErrorCannotCre_2.isa);
      }
    }
    else if (v9->_loggingEnabled)
    {
      NSLog(&cfstr_ErrorCannotCre_1.isa);
    }
    v21 = 0;
    goto LABEL_28;
  }
LABEL_19:
  v21 = v9;
LABEL_28:

  return v21;
}

- (void)commonInit
{
  self->_sourceDictionardouble y = 0;
  self->_dictionaryRef = 0;
  objc_storeWeak((id *)&self->_page, 0);
  v3 = [MEMORY[0x263F08C38] UUID];
  pdfAnnotationUUID = self->_pdfAnnotationUUID;
  self->_pdfAnnotationUUID = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  PDFAnnotationDictionardouble y = self->_PDFAnnotationDictionary;
  self->_PDFAnnotationDictionardouble y = v5;

  v7 = [(PDFAnnotation *)self getPDFKeyMappingDictionary];
  PDFAnnotationKeyMapping = self->_PDFAnnotationKeyMapping;
  self->_PDFAnnotationKeyMapping = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  internalPDFAnnotationDictionardouble y = self->_internalPDFAnnotationDictionary;
  self->_internalPDFAnnotationDictionardouble y = v9;

  akAnnotationForCopying = self->_akAnnotationForCopying;
  self->_akAnnotationForCopying = 0;

  self->_loggingEnabled = GetDefaultsWriteAnnotationLoggingEnabled();
  self->_shouldExport = 1;
  [(PDFAnnotation *)self setShouldPrint:1];
  *(_OWORD *)&self->_downAppearance = 0u;
  *(_OWORD *)&self->_rolloverOffAppearance = 0u;
  *(_OWORD *)&self->_normalAppearance = 0u;
  self->_saveAppearance = 1;
  self->_cachedAppearancesLock._os_unfair_lock_opaque = 0;
  *(_WORD *)&self->_isSelected = 0;
  quadPointsIndexSet = self->_quadPointsIndexSet;
  self->_quadPointsIndexSet = 0;

  self->_quadPointsPath = 0;
  objc_storeWeak((id *)&self->_parent, 0);
  popup = self->_popup;
  self->_popup = 0;

  self->_popupDictionardouble y = 0;
  *(_WORD *)&self->_popupDrawCloseWidget = 257;
  self->_cgPaths = 0;
  uint64_t v14 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  pathLock = self->_pathLock;
  self->_pathLock = v14;

  *(_WORD *)&self->_isSignature = 0;
  widgetOnStateString = self->_widgetOnStateString;
  self->_widgetOnStateString = (NSString *)@"Yes";

  objc_storeWeak(&self->_control, 0);
  *(_WORD *)&self->_pointerIsOverAnnotation = 0;
  self->_formContentType = 0;
  self->_autofillEntryType = 0;
  labelText = self->_labelText;
  self->_labelText = 0;
  self->_shouldReportAnalytics = 1;
  self->_suppressAppearanceStreamText = 0;

  v18 = (CGPoint *)MEMORY[0x263F00148];
  *(_WORD *)&self->_restoreLinePoints = 0;
  CGPoint v19 = *v18;
  self->_startPoint = *v18;
  self->_endPoint = v19;
  quadPoints = self->_quadPoints;
  self->_quadPoints = 0;

  self->_isTransparent = 0;
  objc_storeWeak((id *)&self->_accessibilityNode, 0);
  self->_scaleFactor = 1.0;
  *(_WORD *)&self->_isFullyConstructed = 0;
  v21 = self->_PDFAnnotationDictionary;
  objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)v21 setObject:v22 forKey:@"/Rect"];
}

- (void)secondaryInit
{
  id v35 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  [(PDFAnnotation *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = NSFullUserName();
  [(PDFAnnotation *)self setUserName:v11];

  v12 = [MEMORY[0x263EFF910] now];
  [(PDFAnnotation *)self setModificationDate:v12];

  if ([v35 isEqualToString:@"/Circle"]) {
    goto LABEL_6;
  }
  if ([v35 isEqualToString:@"/FreeText"])
  {
    uint64_t v13 = (void *)MEMORY[0x263F82760];
    [MEMORY[0x263F82760] systemFontSize];
    uint64_t v14 = objc_msgSend(v13, "systemFontOfSize:");
    [(PDFAnnotation *)self setFont:v14];

    v15 = [MEMORY[0x263F825C8] blackColor];
    [(PDFAnnotation *)self setFontColor:v15];

    uint64_t v16 = [MEMORY[0x263F825C8] yellowColor];
LABEL_4:
    uint64_t v17 = (PDFBorder *)v16;
    [(PDFAnnotation *)self setColor:v16];
LABEL_7:

    goto LABEL_8;
  }
  if ([v35 isEqualToString:@"/Ink"])
  {
LABEL_6:
    v18 = [MEMORY[0x263F825C8] blackColor];
    [(PDFAnnotation *)self setColor:v18];

    uint64_t v17 = objc_alloc_init(PDFBorder);
    [(PDFAnnotation *)self setBorder:v17];
    goto LABEL_7;
  }
  if ([v35 isEqualToString:@"/Line"])
  {
    [(PDFAnnotation *)self setStartPoint:PDFPointMake(0.5, 0.5)];
    [(PDFAnnotation *)self setEndPoint:PDFPointMake(v8 + -0.5, v10 + -0.5)];
    uint64_t v17 = (PDFBorder *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"/None", 0);
    [(PDFAnnotation *)self setValue:v17 forAnnotationKey:@"/LE"];
    CGPoint v19 = objc_alloc_init(PDFBorder);
    [(PDFAnnotation *)self setBorder:v19];
    BOOL v20 = [MEMORY[0x263F825C8] blackColor];
    [(PDFAnnotation *)self setColor:v20];
LABEL_13:

LABEL_14:
    goto LABEL_7;
  }
  if (([v35 isEqualToString:@"/Link"] & 1) == 0)
  {
    if ([(PDFAnnotation *)self isMarkupAnnotationSubtype])
    {
      uint64_t v17 = (PDFBorder *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
      v21 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", PDFPointMake(0.0, v10));
      [(PDFBorder *)v17 addObject:v21];

      id v22 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", PDFPointMake(v8, v10));
      [(PDFBorder *)v17 addObject:v22];

      BOOL v23 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", PDFPointMake(0.0, 0.0));
      [(PDFBorder *)v17 addObject:v23];

      v24 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", PDFPointMake(v8, 0.0));
      [(PDFBorder *)v17 addObject:v24];

      [(PDFAnnotation *)self setQuadrilateralPoints:v17];
      CGPoint v19 = [MEMORY[0x263F825C8] yellowColor];
      [(PDFAnnotation *)self setColor:v19];
      goto LABEL_14;
    }
    if (([v35 isEqualToString:@"/Popup"] & 1) == 0)
    {
      if ([v35 isEqualToString:@"/Square"]) {
        goto LABEL_6;
      }
      if ([v35 isEqualToString:@"/Stamp"])
      {
        uint64_t v16 = [MEMORY[0x263F825C8] blackColor];
        goto LABEL_4;
      }
      if ([v35 isEqualToString:@"/Text"])
      {
        long long v25 = [MEMORY[0x263F825C8] blackColor];
        [(PDFAnnotation *)self setColor:v25];

        id v26 = objc_alloc([(PDFAnnotation *)self annotationSubclassForPopup]);
        double v27 = PDFRectGetMaxX(v4, v6, v8) + 4.0;
        v28.n128_f64[0] = PDFRectGetMaxY(v4, v6, v8, v10) + 4.0;
        v29.n128_f64[0] = v27;
        PDFRectMake(v29, v28, 72.0, 36.0);
        uint64_t v17 = (PDFBorder *)objc_msgSend(v26, "initWithBounds:forType:withProperties:", @"/Popup", 0);
        [(PDFAnnotation *)self setPopup:v17];
        goto LABEL_7;
      }
      if ([v35 isEqualToString:@"/Widget"])
      {
        [(PDFAnnotation *)self _generateFormFieldName];
        uint64_t v17 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
        if (![(PDFBorder *)v17 isEqualToString:@"/Btn"])
        {
          if ([(PDFBorder *)v17 isEqualToString:@"/Ch"]) {
            goto LABEL_7;
          }
          if (![(PDFBorder *)v17 isEqualToString:@"/Tx"])
          {
            [(PDFBorder *)v17 isEqualToString:@"/Sig"];
            goto LABEL_7;
          }
          uint64_t v34 = (void *)MEMORY[0x263F82760];
          [MEMORY[0x263F82760] systemFontSize];
          objc_msgSend(v34, "systemFontOfSize:");
          CGPoint v19 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
          [(PDFAnnotation *)self setFont:v19];
          goto LABEL_14;
        }
        [(PDFAnnotation *)self setValue:@"Off" forAnnotationKey:@"/V"];
        [(PDFAnnotation *)self setWidgetOnStateString:@"Yes"];
        long long v30 = [MEMORY[0x263F825C8] blackColor];
        [(PDFAnnotation *)self setValue:v30 forAnnotationKey:@"/C"];

        CGPoint v19 = [[PDFAppearanceCharacteristics alloc] initWithAnnotationDictionary:0 forControlType:-1];
        uint64_t v31 = PDFColorCreateFromWhiteAlpha([(PDFAnnotation *)self setValue:v19 forAnnotationKey:@"/MK"], 0.75, 1.0);
        [(PDFAnnotation *)self setBackgroundColor:v31];

        objc_super v32 = (void *)MEMORY[0x263F82760];
        [MEMORY[0x263F82760] systemFontSize];
        v33 = objc_msgSend(v32, "systemFontOfSize:");
        [(PDFAnnotation *)self setFont:v33];

        BOOL v20 = [MEMORY[0x263F825C8] blackColor];
        [(PDFAnnotation *)self setFontColor:v20];
        goto LABEL_13;
      }
    }
  }
LABEL_8:
}

- (Class)annotationSubclassForPopup
{
  return (Class)objc_opt_class();
}

- (void)_generateFormFieldName
{
  id v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v7 isEqualToString:@"/Btn"])
  {
    double v3 = @"button%d";
    double v4 = &buttonWidgetCount;
  }
  else if ([v7 isEqualToString:@"/Ch"])
  {
    double v3 = @"choice%d";
    double v4 = &choiceWidgetCount;
  }
  else
  {
    if (![v7 isEqualToString:@"/Tx"]) {
      goto LABEL_9;
    }
    double v3 = @"text%d";
    double v4 = &textWidgetCount;
  }
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", v3, *v4);
  ++*v4;
  if (v5)
  {
    double v6 = (void *)v5;
    [(PDFAnnotation *)self setFieldName:v5];
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v3 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(PDFAnnotation *)self bounds];
  uint64_t v6 = objc_msgSend(v5, "initCommonWithBounds:");
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    double v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    double v10 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v9;

    uint64_t v11 = [(PDFAnnotation *)self getPDFKeyMappingDictionary];
    v12 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v11;

    objc_msgSend((id)v6, "setSavesAppearanceStream:", -[PDFAnnotation savesAppearanceStream](self, "savesAppearanceStream"));
    *(unsigned char *)(v6 + 8) = self->_loggingEnabled;
    *(unsigned char *)(v6 + 9) = self->_shouldExport;
    *(unsigned char *)(v6 + 145) = self->_isHighlighted;
    *(unsigned char *)(v6 + 192) = self->_popupDrawCloseWidget;
    *(unsigned char *)(v6 + 193) = self->_popupDrawText;
    id v13 = objc_alloc_init(MEMORY[0x263F08958]);
    uint64_t v14 = *(void **)(v6 + 208);
    *(void *)(v6 + 208) = v13;

    *(unsigned char *)(v6 + 216) = self->_isSignature;
    objc_storeStrong((id *)(v6 + 224), self->_widgetOnStateString);
    uint64_t v15 = [(NSMutableDictionary *)self->_internalPDFAnnotationDictionary mutableCopyWithZone:v3];
    uint64_t v16 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = v15;

    *(void *)(v6 + 256) = self->_formContentType;
    objc_storeStrong((id *)(v6 + 248), self->_autoFillTextContentType);
    *(void *)(v6 + 264) = self->_autofillEntryType;
    *(unsigned char *)(v6 + 282) = self->_shouldReportAnalytics;
    *(unsigned char *)(v6 + 284) = self->_suppressAppearanceStreamText;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obj = self->_PDFAnnotationDictionary;
    uint64_t v17 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        uint64_t v20 = 0;
        uint64_t v43 = v18;
        do
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * v20);
          id v22 = -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", v21, v43);
          if ([v22 conformsToProtocol:&unk_26C53A1B0])
          {
            BOOL v23 = self;
            v24 = *(void **)(v6 + 56);
            uint64_t v25 = v19;
            id v26 = v3;
            double v27 = (void *)[v22 copyWithZone:v3];
            __n128 v28 = v24;
            self = v23;
            [v28 setObject:v27 forKey:v21];

            double v3 = v26;
            uint64_t v19 = v25;
            uint64_t v18 = v43;
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v18);
    }

    uint64_t v29 = 0;
    do
    {
      if ([(PDFAnnotation *)self appearance:v29])
      {
        CGPDFFormGetStream();
        [(id)v6 setAppearance:CGPDFFormCreate() forType:v29];
      }
      uint64_t v29 = (v29 + 1);
    }
    while (v29 != 6);
    long long v30 = self->_popup;
    if (v30)
    {
      uint64_t v31 = v30;
      id v32 = [(PDFAnnotation *)v30 copyWithZone:v3];

      [(id)v6 setPopupInternal:v32 scanPage:0];
    }
    v33 = [(PDFAnnotation *)self border];
    if (v33)
    {
      uint64_t v34 = v33;
      id v35 = (void *)[v33 copyWithZone:v3];

      [(id)v6 setBorder:v35];
    }
    akAnnotationAdaptor = self->_akAnnotationAdaptor;
    if (akAnnotationAdaptor)
    {
      v37 = [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor akAnnotation];
      uint64_t v38 = [v37 copyWithZone:v3];

      v39 = *(void **)(v6 + 384);
      *(void *)(v6 + 384) = v38;
    }
    else
    {
      akAnnotationForCopying = self->_akAnnotationForCopying;
      if (akAnnotationForCopying)
      {
        uint64_t v41 = [(NSCopying *)akAnnotationForCopying copyWithZone:v3];
        v39 = *(void **)(v6 + 384);
        *(void *)(v6 + 384) = v41;
      }
      else
      {
        v39 = *(void **)(v6 + 384);
        *(void *)(v6 + 384) = 0;
      }
    }

    *(unsigned char *)(v6 + 368) = 1;
  }
  return (id)v6;
}

- (PDFAnnotation)initWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    self = [(PDFAnnotation *)self init];
    if (self)
    {
      uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"PDFAnnotDictionary"];
      [(PDFAnnotation *)self setPDFAnnotationDictionary:v6];

      -[PDFAnnotation setSavesAppearanceStream:](self, "setSavesAppearanceStream:", [v5 decodeBoolForKey:@"PDFAnnotBaseSaveAppearance"]);
      -[PDFAnnotation setForExport:](self, "setForExport:", [v5 decodeBoolForKey:@"PDFAnnotBaseExport"]);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263F08170];
    id v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"%@ - only keyed coders are supported by %@", v9, objc_opt_class() format];
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  PDFAnnotationDictionardouble y = self->_PDFAnnotationDictionary;
  id v5 = a3;
  [v5 encodeObject:PDFAnnotationDictionary forKey:@"PDFAnnotDictionary"];
  objc_msgSend(v5, "encodeBool:forKey:", -[PDFAnnotation savesAppearanceStream](self, "savesAppearanceStream"), @"PDFAnnotBaseSaveAppearance");
  [v5 encodeBool:self->_shouldExport forKey:@"PDFAnnotBaseExport"];
}

- (void)dealloc
{
  [(PDFAnnotation *)self removeAKAnnotationAdaptor];
  [(PDFAnnotation *)self _releaseDictionaryRef];
  if (self->_normalAppearance) {
    CGPDFFormRelease();
  }
  if (self->_rolloverAppearance) {
    CGPDFFormRelease();
  }
  if (self->_downAppearance) {
    CGPDFFormRelease();
  }
  if (self->_normalOffAppearance) {
    CGPDFFormRelease();
  }
  if (self->_rolloverOffAppearance) {
    CGPDFFormRelease();
  }
  if (self->_downOffAppearance) {
    CGPDFFormRelease();
  }
  quadPointsPath = self->_quadPointsPath;
  if (quadPointsPath) {
    CGPathRelease(quadPointsPath);
  }
  if (self->_cgPaths) {
    [(PDFAnnotation *)self releaseCGPathArray];
  }
  cgAnnotation = self->_cgAnnotation;
  if (cgAnnotation) {
    CFRelease(cgAnnotation);
  }
  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotation;
  [(PDFAnnotation *)&v5 dealloc];
}

- (void)_releaseDictionaryRef
{
  dictionaryRef = self->_dictionaryRef;
  if (dictionaryRef)
  {
    CFDictionaryRemoveValue(dictionaryRef, @"/Parent");
    CFDictionaryRemoveValue(self->_dictionaryRef, @"/Popup");
    double v4 = self->_dictionaryRef;
    CFRelease(v4);
  }
}

- (void)setupAKAnnotationAdaptorIfNecessary
{
  if (GetDefaultsWriteAKEnabled() && !self->_akAnnotationAdaptor)
  {
    BOOL isFullyConstructed = self->_isFullyConstructed;
    self->_BOOL isFullyConstructed = 0;
    akAnnotationForCopying = self->_akAnnotationForCopying;
    double v10 = akAnnotationForCopying;
    if (akAnnotationForCopying)
    {
      objc_super v5 = [[PDFAKAnnotationAdaptor alloc] initWithPDFAnnotation:self andAKAnnotation:akAnnotationForCopying];
      akAnnotationAdaptor = self->_akAnnotationAdaptor;
      self->_akAnnotationAdaptor = v5;

      uint64_t v7 = self->_akAnnotationForCopying;
      self->_akAnnotationForCopying = 0;
    }
    else
    {
      id v8 = 0;
      id v9 = +[PDFAKAnnotationAdaptor annotationAdaptorWithPDFAnnotation:self andCGPDFAnnotation:[(PDFAnnotation *)self CGPDFAnnotation] andPDFDictionary:[(PDFAnnotation *)self sourceDictionary]];
      uint64_t v7 = self->_akAnnotationAdaptor;
      self->_akAnnotationAdaptor = v9;
    }

    self->_BOOL isFullyConstructed = isFullyConstructed;
  }
}

- (void)removeAKAnnotationAdaptor
{
  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor)
  {
    [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor teardown];
    double v4 = self->_akAnnotationAdaptor;
    self->_akAnnotationAdaptor = 0;
  }
}

- (PDFPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (PDFPage *)WeakRetained;
}

- (void)setPage:(PDFPage *)page
{
  double v4 = page;
  objc_storeWeak((id *)&self->_page, v4);
  if (v4) {
    [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/P"];
  }
  else {
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/P"];
  }
}

- (NSString)type
{
  v2 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/Subtype"];
  double v3 = [v2 substringFromIndex:1];

  return (NSString *)v3;
}

- (void)setType:(NSString *)type
{
  id v4 = (id)[(NSString *)type copy];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/Subtype"];
}

- (CGRect)bounds
{
  v2 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/Rect"];
  [v2 PDFKitPDFRectValue];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  if ([(PDFAnnotation *)self _annotationAllowsCommenting:@"setBounds:"])
  {
    [(PDFAnnotation *)self _savePropertiesBeforeSetBounds];
    objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", x, y, width, height);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v8 forKey:@"/Rect"];
    [(PDFAnnotation *)self _restorePropertiesAfterSetBounds];
    [(PDFAnnotation *)self _didSetValue:v8 forAnnotationKey:@"/Rect"];
    [(PDFAnnotation *)self updateAnnotationEffect];
  }
}

- (void)setBoundsWithUndo:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PDFAnnotation *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  -[PDFAnnotation setBounds:](self, "setBounds:", x, y, width, height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  id v26 = [WeakRetained view];

  if (v26)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = PDFKitLocalizedString(@"Change of %@ %@");
    uint64_t v19 = [(PDFAnnotation *)self displayName];
    uint64_t v20 = +[PDFAnnotation PresentableStringForAnnotationKey:@"/Rect"];
    uint64_t v21 = objc_msgSend(v17, "stringWithFormat:", v18, v19, v20);

    id v22 = [v26 undoManager];
    BOOL v23 = [v22 prepareWithInvocationTarget:self];
    objc_msgSend(v23, "setBoundsWithUndo:", v9, v11, v13, v15);

    v24 = [v26 undoManager];
    uint64_t v25 = PDFKitLocalizedString(v21);
    [v24 setActionName:v25];
  }
}

- (void)_savePropertiesBeforeSetBounds
{
  double v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/L"];
  self->_restoreLinePoints = v3 != 0;

  double v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/QuadPoints"];
  self->_restoreQuadPoints = v4 != 0;

  if (self->_restoreLinePoints)
  {
    [(PDFAnnotation *)self startPoint];
    self->_startPoint.double x = v5;
    self->_startPoint.double y = v6;
    [(PDFAnnotation *)self endPoint];
    self->_endPoint.double x = v7;
    self->_endPoint.double y = v8;
  }
  if (self->_restoreQuadPoints)
  {
    double v9 = [(PDFAnnotation *)self quadrilateralPoints];
    quadPoints = self->_quadPoints;
    self->_quadPoints = v9;
    MEMORY[0x270F9A758](v9, quadPoints);
  }
}

- (void)_restorePropertiesAfterSetBounds
{
  if (self->_restoreLinePoints)
  {
    -[PDFAnnotation setStartPoint:](self, "setStartPoint:", self->_startPoint.x, self->_startPoint.y);
    -[PDFAnnotation setEndPoint:](self, "setEndPoint:", self->_endPoint.x, self->_endPoint.y);
  }
  if (self->_restoreQuadPoints)
  {
    quadPoints = self->_quadPoints;
    [(PDFAnnotation *)self setQuadrilateralPoints:quadPoints];
  }
}

- (NSDate)modificationDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/M"];
}

- (void)setModificationDate:(NSDate *)modificationDate
{
  if (modificationDate)
  {
    id v4 = (id)[(NSDate *)modificationDate copy];
    [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/M"];
  }
  else
  {
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/M"];
  }
}

- (NSString)userName
{
  double v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  char v4 = [v3 isEqualToString:@"/Widget"];

  if (v4)
  {
    CGFloat v5 = 0;
  }
  else
  {
    CGFloat v5 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/T"];
  }

  return (NSString *)v5;
}

- (void)setUserName:(NSString *)userName
{
  CGFloat v5 = userName;
  if ([(PDFAnnotation *)self isMarkupAnnotation])
  {
    if (v5)
    {
      char v4 = (void *)[(NSString *)v5 copy];
      [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/T"];
    }
    else
    {
      [(PDFAnnotation *)self removeValueForAnnotationKey:@"/T"];
    }
  }
}

- (PDFAnnotation)popup
{
  return self->_popup;
}

- (void)setPopup:(PDFAnnotation *)popup
{
}

- (BOOL)isSignature
{
  return self->_isSignature;
}

- (void)setIsSignature:(BOOL)a3
{
  self->_isSignature = a3;
}

- (BOOL)shouldBurnIn
{
  return self->_shouldBurnIn;
}

- (void)setShouldBurnIn:(BOOL)a3
{
  self->_shouldBurnIn = a3;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      char v4 = [WeakRetained document];
      [v4 setDocumentHasBurnInAnnotations:1];

      id WeakRetained = v5;
    }
  }
}

- (id)control
{
  id WeakRetained = objc_loadWeakRetained(&self->_control);

  return WeakRetained;
}

- (id)uiControl
{
  id WeakRetained = objc_loadWeakRetained(&self->_control);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [WeakRetained textView];
  }
  else
  {
    id v3 = WeakRetained;
  }
  char v4 = v3;

  return v4;
}

- (void)setControl:(id)a3
{
  objc_storeWeak(&self->_control, a3);

  [(PDFAnnotation *)self updateAnnotationEffect];
}

- (BOOL)pointerIsOverAnnotation
{
  return self->_pointerIsOverAnnotation;
}

- (void)setPointerIsOverAnnotation:(BOOL)a3
{
  if (self->_pointerIsOverAnnotation != a3)
  {
    self->_pointerIsOverAnnotation = a3;
    [(PDFAnnotation *)self updateAnnotationEffect];
  }
}

- (BOOL)shouldComb
{
  id v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  char v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v3 isEqualToString:@"/Widget"]
    && [v4 isEqualToString:@"/Tx"]
    && [(PDFAnnotation *)self hasComb])
  {
    id v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MaxLen"];
    if (v5 && ![(PDFAnnotation *)self isMultiline]) {
      BOOL v6 = ![(PDFAnnotation *)self isPasswordField];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)inFormFillingMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained view], (char v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    char v6 = [v4 isInFormFillingMode];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)interactiveBackgroundColor
{
  if (self->_shouldHideInteractiveBackgroundColor) {
    goto LABEL_2;
  }
  if ([(PDFAnnotation *)self inFormFillingMode]
    || [(PDFAnnotation *)self pointerIsOverAnnotation]
    && [(PDFAnnotation *)self isTextWidget])
  {
    v2 = +[PDFAnnotation PDFFormFieldBackgroundColor];
    goto LABEL_5;
  }
  if (!GetDefaultsWriteColorWidgetBackgrounds()
    || ([(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"/Widget"],
        v5,
        !v6))
  {
LABEL_2:
    v2 = 0;
    goto LABEL_5;
  }
  CGFloat v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v7 isEqualToString:@"/Btn"])
  {
    PDFWidgetControlType v8 = [(PDFAnnotation *)self widgetControlType];
    if (v8)
    {
      if (v8 == kPDFWidgetRadioButtonControl)
      {
        double v9 = [MEMORY[0x263F825C8] redColor];
      }
      else
      {
        if (v8 == kPDFWidgetCheckBoxControl) {
          [MEMORY[0x263F825C8] greenColor];
        }
        else {
        double v9 = [MEMORY[0x263F825C8] orangeColor];
        }
      }
    }
    else
    {
      double v9 = [MEMORY[0x263F825C8] purpleColor];
    }
    goto LABEL_27;
  }
  if ([v7 isEqualToString:@"/Ch"])
  {
    double v9 = [MEMORY[0x263F825C8] yellowColor];
LABEL_27:
    double v10 = v9;
    v2 = [v9 colorWithAlphaComponent:0.2];

    goto LABEL_28;
  }
  if (![v7 isEqualToString:@"/Tx"])
  {
    if (![v7 isEqualToString:@"/Sig"])
    {
      v2 = 0;
      goto LABEL_28;
    }
    double v9 = [MEMORY[0x263F825C8] cyanColor];
    goto LABEL_27;
  }
  v2 = +[PDFAnnotation PDFFormFieldBackgroundColor];
LABEL_28:

LABEL_5:

  return v2;
}

- (void)setShouldHideInteractiveBackgroundColor:(BOOL)a3
{
  self->_shouldHideInteractiveBackgroundColor = a3;
}

- (unint64_t)markupStyle
{
  switch([(PDFAnnotation *)self markupType])
  {
    case kPDFMarkupTypeHighlight:
      id v3 = [(PDFAnnotation *)self color];
      char v4 = +[PDFAnnotation PDFMarkupColors];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __28__PDFAnnotation_markupStyle__block_invoke;
      v8[3] = &unk_264203AF0;
      id v9 = v3;
      id v5 = v3;
      unint64_t v6 = [v4 indexOfObjectPassingTest:v8];

      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v6 = 0;
      }

      break;
    case kPDFMarkupTypeStrikeOut:
      unint64_t v6 = 6;
      break;
    case kPDFMarkupTypeUnderline:
      unint64_t v6 = 5;
      break;
    case kPDFMarkupTypeRedact:
      unint64_t v6 = 7;
      break;
    default:
      unint64_t v6 = 8;
      break;
  }
  return v6;
}

BOOL __28__PDFAnnotation_markupStyle__block_invoke(uint64_t a1, void *a2)
{
  return PDFColorComponentsAreEqual(*(void **)(a1 + 32), a2);
}

- (CGRect)noteBounds
{
  id v3 = [(PDFAnnotation *)self popup];

  if (v3)
  {
    [(PDFAnnotation *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
    char v13 = [v12 isEqualToString:@"/Text"];

    if ((v13 & 1) == 0)
    {
      double v14 = PDFRectGetMaxX(v5, v7, v9) + 4.0;
      v15.n128_f64[0] = PDFRectGetMaxY(v5, v7, v9, v11) + 4.0;
      v16.n128_f64[0] = v14;
      double v5 = PDFRectMake(v16, v15, 15.0, 15.0);
      double v7 = v17;
      double v9 = v18;
      double v11 = v19;
    }
  }
  else
  {
    double v5 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v20 = v5;
  double v21 = v7;
  double v22 = v9;
  double v23 = v11;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)noteContainsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PDFAnnotation *)self noteBounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return PDFRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (id)indexSetForQuadPoints
{
  quadPointsIndexSet = self->_quadPointsIndexSet;
  if (quadPointsIndexSet)
  {
    id v3 = quadPointsIndexSet;
  }
  else
  {
    location = &self->_quadPointsIndexSet;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    v54 = [WeakRetained string];
    double v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/QuadPoints"];
    id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
    if ((unint64_t)[v6 count] >= 4)
    {
      unint64_t v8 = 0;
      uint64_t v9 = 3;
      id v53 = v7;
      do
      {
        CGFloat v10 = objc_msgSend(v6, "objectAtIndex:", v9 - 3, location);
        [v10 PDFKitPDFPointValue];
        double v12 = v11;
        double v14 = v13;

        __n128 v15 = [v6 objectAtIndex:v9 - 1];
        [v15 PDFKitPDFPointValue];
        double v17 = v16;
        double v19 = v18;

        double v20 = PDFPointMake((v12 + v17) * 0.5, (v14 + v19) * 0.5);
        double v22 = v21;
        double v23 = [v6 objectAtIndex:v9 - 2];
        [v23 PDFKitPDFPointValue];
        double v25 = v24;
        double v27 = v26;

        __n128 v28 = [v6 objectAtIndex:v9];
        [v28 PDFKitPDFPointValue];
        double v30 = v29;
        double v32 = v31;

        double v33 = PDFPointMake((v25 + v30) * 0.5, (v27 + v32) * 0.5);
        id v35 = objc_msgSend(WeakRetained, "selectionFromPoint:toPoint:type:", 0, v20, v22, v33, v34);
        uint64_t v36 = [v35 rangeAtIndex:0 onPage:WeakRetained];
        uint64_t v38 = v37;
        uint64_t v39 = [v7 lastIndex];
        v57 = v35;
        if ([v7 lastIndex] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v40 = v39 + 1;
          uint64_t v41 = v36 - (v39 + 1);
          if (v38 && v41 >= 1)
          {
            v55 = objc_msgSend(v54, "substringWithRange:", objc_msgSend(v7, "lastIndex") + 1, v41);
            [MEMORY[0x263F08708] whitespaceCharacterSet];
            uint64_t v43 = v56 = v8;
            [v55 stringByTrimmingCharactersInSet:v43];
            long long v45 = v44 = WeakRetained;
            long long v46 = v6;
            uint64_t v47 = [v45 length];

            id WeakRetained = v44;
            BOOL v48 = v47 == 0;
            double v6 = v46;
            id v7 = v53;
            if (v48)
            {
              uint64_t v36 = v40;
              uint64_t v49 = v41;
            }
            else
            {
              uint64_t v49 = 0;
            }
            v38 += v49;
            unint64_t v8 = v56;
          }
        }
        objc_msgSend(v7, "addIndexesInRange:", v36, v38);

        ++v8;
        v9 += 4;
      }
      while (v8 < (unint64_t)[v6 count] >> 2);
    }
    if (objc_msgSend(v7, "count", location)) {
      objc_storeStrong(locationa, v7);
    }
    id v3 = (NSIndexSet *)*locationa;
  }

  return v3;
}

- (void)setQuadPointsForIndexSet:(id)a3 withUndo:(BOOL)a4
{
  id v5 = a3;
  uint64_t v40 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  double v6 = [MEMORY[0x263EFF980] array];
  if ([v5 rangeCount])
  {
    unint64_t v7 = 0;
    uint64_t v41 = v5;
    do
    {
      uint64_t v8 = [v5 rangeAtIndex:v7];
      uint64_t v43 = objc_msgSend(WeakRetained, "selectionForRange:", v8, v9);
      if (v43)
      {
        CFArrayRef v10 = (const __CFArray *)[v43 cgSelections];
        CFIndex Count = CFArrayGetCount(v10);
        if (Count >= 1)
        {
          CFIndex v12 = Count;
          for (CFIndex i = 0; i != v12; ++i)
          {
            CFArrayGetValueAtIndex(v10, i);
            uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
            if (NumberOfRectsAndTransforms >= 1)
            {
              uint64_t v15 = NumberOfRectsAndTransforms;
              for (uint64_t j = 0; j != v15; ++j)
              {
                long long v49 = 0u;
                *(_OWORD *)uint64_t v50 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v46 = 0u;
                if ((CGPDFSelectionGetRectAndTransform() & 1) == 0)
                {
                  double v17 = (*((double *)&v49 + 1) + v50[1]) * *(double *)&v47;
                  double v18 = (*((double *)&v49 + 1) + v50[1]) * *((double *)&v47 + 1);
                  double v19 = *(double *)&v48 + v17 + *(double *)&v46 * (*(double *)&v49 + v50[0]);
                  double v20 = *((double *)&v48 + 1) + v18 + *((double *)&v46 + 1) * (*(double *)&v49 + v50[0]);
                  double v21 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", *(double *)&v48 + v17 + *(double *)&v46 * *(double *)&v49, *((double *)&v48 + 1) + v18 + *((double *)&v46 + 1) * *(double *)&v49);
                  [v6 addObject:v21];

                  double v22 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", v19, v20);
                  [v6 addObject:v22];

                  double v23 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", *(double *)&v48 + *(double *)&v47 * *((double *)&v49 + 1) + *(double *)&v46 * *(double *)&v49, *((double *)&v48 + 1)+ *((double *)&v47 + 1) * *((double *)&v49 + 1)+ *((double *)&v46 + 1) * *(double *)&v49);
                  [v6 addObject:v23];

                  double v24 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", *(double *)&v48+ *(double *)&v47 * *((double *)&v49 + 1)+ *(double *)&v46 * (*(double *)&v49 + v50[0]), *((double *)&v48 + 1)+ *((double *)&v47 + 1) * *((double *)&v49 + 1)+ *((double *)&v46 + 1) * (*(double *)&v49 + v50[0]));
                  [v6 addObject:v24];
                }
              }
            }
          }
        }
      }

      ++v7;
      id v5 = v41;
    }
    while (v7 < [v41 rangeCount]);
  }
  double v25 = v40->_quadPointsIndexSet;
  double v45 = 0.0;
  *(void *)&long long v46 = 0;
  *(void *)&long long v49 = 0;
  double v44 = 0.0;
  PDFPointsGetMinMaxValues(v6, (double *)&v46, (double *)&v49, &v45, &v44);
  v26.n128_u64[0] = v46;
  v27.n128_u64[0] = v49;
  [(PDFAnnotation *)v40 setBounds:PDFRectMake(v26, v27, v45 - *(double *)&v46, v44 - *(double *)&v49)];
  objc_storeStrong((id *)&v40->_quadPointsIndexSet, a3);
  [(PDFAnnotation *)v40 setValue:v6 forAnnotationKey:@"/QuadPoints"];
  __n128 v28 = [WeakRetained view];
  if (v28 && a4)
  {
    double v29 = NSString;
    double v30 = PDFKitLocalizedString(@"Change of %@ %@");
    double v31 = [(PDFAnnotation *)v40 displayName];
    double v32 = +[PDFAnnotation PresentableStringForAnnotationKey:@"/QuadPoints"];
    double v33 = objc_msgSend(v29, "stringWithFormat:", v30, v31, v32);

    double v34 = [v28 undoManager];
    id v35 = [v34 prepareWithInvocationTarget:v40];
    [v35 setQuadPointsForIndexSet:v25 withUndo:1];

    uint64_t v36 = [v28 undoManager];
    uint64_t v37 = PDFKitLocalizedString(v33);
    [v36 setActionName:v37];
  }
}

- (CGPath)quadPointsPath
{
  return self->_quadPointsPath;
}

- (BOOL)isTextMarkupOrNoteAnnotation
{
  if ([(PDFAnnotation *)self isTextMarkupAnnotation]) {
    return 1;
  }

  return [(PDFAnnotation *)self isNoteAnnotation];
}

- (BOOL)isNoteAnnotation
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  char v3 = [v2 isEqualToString:@"/Text"];

  return v3;
}

- (id)displayName
{
  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor)
  {
    double v4 = [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor akAnnotation];
    id v5 = [(__CFString *)v4 displayName];
    goto LABEL_24;
  }
  double v4 = [(PDFAnnotation *)self type];
  if ([(__CFString *)v4 isEqualToString:@"StrikeOut"])
  {

    double v4 = @"Strikethrough";
  }
  if ([(__CFString *)v4 isEqualToString:@"Text"])
  {

    double v4 = @"Note";
  }
  double v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  unint64_t v7 = v6;
  if (v6)
  {
    if ([v6 isEqualToString:@"/Btn"])
    {
      PDFWidgetControlType v8 = [(PDFAnnotation *)self widgetControlType];
      uint64_t v9 = @"Button";
      if (v8 == kPDFWidgetCheckBoxControl) {
        uint64_t v9 = @"Checkbox";
      }
      if (v8 == kPDFWidgetRadioButtonControl) {
        CFArrayRef v10 = @"Radio Button";
      }
      else {
        CFArrayRef v10 = v9;
      }
      goto LABEL_22;
    }
    if ([v7 isEqualToString:@"/Ch"])
    {
      BOOL v11 = [(PDFAnnotation *)self isListChoice];
      CFIndex v12 = @"Combo Box";
      if (v11) {
        CFIndex v12 = @"List Box";
      }
      CFArrayRef v10 = v12;
      goto LABEL_22;
    }
    if ([v7 isEqualToString:@"/Tx"])
    {
      CFArrayRef v10 = @"Text Field";
LABEL_22:

      double v4 = v10;
      goto LABEL_23;
    }
    if ([v7 isEqualToString:@"/Sig"])
    {
      CFArrayRef v10 = @"Signature";
      goto LABEL_22;
    }
  }
LABEL_23:
  id v5 = PDFKitLocalizedString(v4);

LABEL_24:

  return v5;
}

- (id)textMarkupString
{
  v2 = [(PDFAnnotation *)self _selectionForMarkupAnnotation];
  char v3 = v2;
  if (v2)
  {
    double v4 = [v2 string];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_selectionForMarkupAnnotation
{
  if ([(PDFAnnotation *)self isMarkupAnnotationSubtype])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    double v4 = [(PDFAnnotation *)self indexSetForQuadPoints];
    if ([v4 rangeCount])
    {
      unint64_t v5 = 0;
      id v6 = 0;
      do
      {
        uint64_t v7 = [v4 rangeAtIndex:v5];
        uint64_t v9 = objc_msgSend(WeakRetained, "selectionForRange:", v7, v8);
        CFArrayRef v10 = v9;
        if (v6) {
          [v6 addSelection:v9];
        }
        else {
          id v6 = v9;
        }

        ++v5;
      }
      while (v5 < [v4 rangeCount]);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)accessibilityNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityNode);

  return WeakRetained;
}

- (void)setAccessibilityNode:(id)a3
{
}

- (double)scaleFactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v5 = [WeakRetained view];
    if (v5)
    {
      double BackingScaleFactor = PDFScreenGetBackingScaleFactor();
      [v5 scaleFactor];
      double v8 = BackingScaleFactor * v7;
      if (v8 > 0.0 && vabdd_f64(self->_scaleFactor, v8) > 0.00000011920929) {
        self->_double scaleFactor = v8;
      }
    }
  }
  double scaleFactor = self->_scaleFactor;

  return scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  if (vabdd_f64(self->_scaleFactor, a3) > 0.00000011920929)
  {
    self->_double scaleFactor = a3;
    [(PDFAnnotation *)self updateAnnotationEffect];
  }
}

- (BOOL)isFullyConstructed
{
  return self->_isFullyConstructed;
}

- (void)setIsFullyConstructed:(BOOL)a3
{
  self->_BOOL isFullyConstructed = a3;
}

- (void)_printDictionary:(id)a3 atDepth:(int)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (a4 >= 1)
  {
    int v7 = a4;
    do
    {
      [v6 appendString:@"\t"];
      --v7;
    }
    while (v7);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v8 = [v5 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (a4 + 1);
    uint64_t v12 = *(void *)v27;
    unsigned int v24 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
        uint64_t v15 = [v5 objectForKey:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          NSLog(&cfstr_String.isa, v6, v14, v15);
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v16 = [v15 description];
          NSLog(&cfstr_Nsvalue.isa, v6, v14, v16);
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v16 = [v15 description];
          NSLog(&cfstr_Nsdate.isa, v6, v14, v16);
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v17 = [v15 allKeys];
          NSLog(&cfstr_DictionaryDKey.isa, v6, v14, [v17 count]);

          [(PDFAnnotation *)self _printDictionary:v5 atDepth:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v16 = [v15 appearanceCharacteristicsKeyValues];
            double v18 = [v16 allKeys];
            NSLog(&cfstr_Pdfappearancec.isa, v6, v14, [v18 count]);
LABEL_26:

            uint64_t v11 = v24;
            goto LABEL_27;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v16 = [v15 description];
            NSLog(&cfstr_NscolorUicolor.isa, v6, v14, v16);
            goto LABEL_15;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v16 = [v15 borderKeyValues];
            double v18 = [v16 allKeys];
            NSLog(&cfstr_PdfborderDKeyV.isa, v6, v14, [v18 count]);
            goto LABEL_26;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            NSLog(&cfstr_PdfannotationC.isa, v6, v14);
            double v16 = [v15 annotationKeyValues];
LABEL_27:
            [(PDFAnnotation *)self _printDictionary:v16 atDepth:v11];
LABEL_15:

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            double v21 = (objc_class *)objc_opt_class();
            double v16 = NSStringFromClass(v21);
            NSLog(&cfstr_UnknownType.isa, v6, v14, v16);
            goto LABEL_15;
          }
          id v19 = v15;
          uint64_t v23 = [v19 count];
          double v20 = [v19 description];

          NSLog(&cfstr_NsarrayDElemen.isa, v6, v14, v23, v20);
          uint64_t v11 = v24;
        }
LABEL_16:

        ++v13;
      }
      while (v10 != v13);
      uint64_t v22 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }
}

- (void)printDictionaryKeyValues
{
  id v3 = [(PDFAnnotation *)self annotationKeyValues];
  [(PDFAnnotation *)self _printDictionary:v3 atDepth:1];
}

- (PDFBorder)border
{
  return (PDFBorder *)[(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/Border"];
}

- (void)setBorder:(PDFBorder *)border
{
  double v4 = border;
  id v5 = v4;
  if (v4)
  {
    [(PDFBorder *)v4 setAnnotation:self];
    [(PDFAnnotation *)self setValue:v5 forAnnotationKey:@"/Border"];
  }
  else
  {
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/Border"];
  }
}

- (UIColor)color
{
  return (UIColor *)[(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/C"];
}

- (void)setColor:(UIColor *)color
{
  if (color)
  {
    double v4 = color;
    [(PDFAnnotation *)self removeAllAppearanceStreams];
    id v5 = (void *)[(UIColor *)v4 copy];

    id v9 = v5;
    if (CGColorGetPattern((CGColorRef)[v9 CGColor]))
    {
      NSLog(&cfstr_PdfkitSetfontc.isa);
      uint64_t v6 = [MEMORY[0x263F825C8] clearColor];

      id v7 = (id)v6;
    }
    else
    {
      id v7 = v9;
    }
    id v10 = v7;
    [(PDFAnnotation *)self setValue:v7 forAnnotationKey:@"/C"];
    popup = self->_popup;
    if (popup) {
      [(PDFAnnotation *)popup setColor:v10];
    }
  }
}

- (PDFAction)action
{
  id v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/A"];
  if (!v3)
  {
    double v4 = [(PDFAnnotation *)self destination];
    uint64_t v5 = [(PDFAnnotation *)self URL];
    uint64_t v6 = (void *)v5;
    if (v4)
    {
      id v7 = [[PDFActionGoTo alloc] initWithDestination:v4];
    }
    else
    {
      if (!v5)
      {
        id v3 = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v7 = [[PDFActionURL alloc] initWithURL:v5];
    }
    id v3 = v7;
    if (v7) {
      [(PDFAnnotation *)self setValue:v7 forAnnotationKey:@"/A"];
    }
    goto LABEL_9;
  }
LABEL_10:

  return (PDFAction *)v3;
}

- (void)setAction:(PDFAction *)action
{
}

- (NSString)contents
{
  return (NSString *)[(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:@"/Contents"];
}

- (void)setContents:(NSString *)contents
{
  if (contents)
  {
    id v4 = (id)[(NSString *)contents copy];
    [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/Contents"];
  }
  else
  {
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/Contents"];
  }
}

- (void)setContents:(id)a3 withUndo:(BOOL)a4
{
  BOOL v4 = a4;
  id v38 = a3;
  id v6 = [(PDFAnnotation *)self contents];
  if (v6 == v38)
  {
    id v6 = v38;
  }
  else if (([v38 isEqualToString:v6] & 1) == 0)
  {
    [(PDFAnnotation *)self setContents:v38];
    if (v38)
    {
      id v7 = [(PDFAnnotation *)self popup];

      if (!v7)
      {
        [(PDFAnnotation *)self bounds];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        id v16 = objc_alloc([(PDFAnnotation *)self annotationSubclassForPopup]);
        double v17 = PDFRectGetMaxX(v9, v11, v13) + 4.0;
        v18.n128_f64[0] = PDFRectGetMaxY(v9, v11, v13, v15) + 4.0;
        v19.n128_f64[0] = v17;
        double v20 = objc_msgSend(v16, "initWithBounds:forType:withProperties:", @"/Popup", 0, PDFRectMake(v19, v18, 72.0, 36.0));
        [(PDFAnnotation *)self setPopup:v20];
      }
    }
    else
    {
      [(PDFAnnotation *)self setPopup:0];
    }
    if ([v38 isEqualToString:&stru_26C516768]) {
      double v21 = 0;
    }
    else {
      double v21 = v38;
    }
    unint64_t v22 = v21;

    if ([v6 isEqualToString:&stru_26C516768]) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = v6;
    }
    unint64_t v24 = v23;

    id v6 = 0;
    id v38 = 0;
    if (v22 | v24)
    {
      id v38 = (id)v22;
      id v6 = (id)v24;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
      long long v26 = [WeakRetained view];
      long long v27 = v26;
      if (v26 && v4 && [v26 allowsUndo])
      {
        long long v28 = NSString;
        long long v29 = PDFKitLocalizedString(@"Change of %@ %@");
        double v30 = [(PDFAnnotation *)self displayName];
        uint64_t v31 = +[PDFAnnotation PresentableStringForAnnotationKey:@"/Contents"];
        double v32 = objc_msgSend(v28, "stringWithFormat:", v29, v30, v31);

        double v33 = [v27 undoManager];
        double v34 = [v33 prepareWithInvocationTarget:self];
        [v34 setContents:v6 withUndo:1];

        id v35 = [v27 undoManager];
        uint64_t v36 = PDFKitLocalizedString(v32);
        [v35 setActionName:v36];

        uint64_t v37 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
        if (!v38 && [v37 isEqualToString:@"/Text"]) {
          [WeakRetained removeAnnotation:self withUndo:1];
        }
      }
    }
  }
}

- (NSString)toolTip
{
  id v3 = [(PDFAnnotation *)self contents];

  if (v3)
  {
    BOOL v4 = [(PDFAnnotation *)self contents];
  }
  else
  {
    uint64_t v5 = [(PDFAnnotation *)self action];

    if (v5)
    {
      id v6 = [(PDFAnnotation *)self action];
      BOOL v4 = [v6 toolTip];
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (BOOL)hasAppearanceStream
{
  return self->_normalAppearance != 0;
}

- (void)removeAllAppearanceStreams
{
}

- (BOOL)_annotationAllowsCommenting:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  id v6 = [WeakRetained document];
  id v7 = v6;
  BOOL v8 = 1;
  if (WeakRetained && v6 && self->_isFullyConstructed)
  {
    char v9 = [v6 allowsCommenting];
    int v10 = [v7 allowsFormFieldEntry];
    double v11 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
    int v12 = [v11 isEqualToString:@"/Widget"];

    uint64_t v13 = [v7 permissionsStatus];
    double v14 = @"user";
    if (v13 == 2) {
      double v14 = @"owner";
    }
    double v15 = v14;
    id v16 = v15;
    if (v9 & 1) != 0 || (v12)
    {
      if ((v10 | v12 ^ 1))
      {
        BOOL v8 = 1;
LABEL_13:

        goto LABEL_14;
      }
      NSLog(&cfstr_Pdfannotations_0.isa, v15);
    }
    else
    {
      NSLog(&cfstr_Pdfannotations.isa, v4, v15);
    }
    BOOL v8 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v8;
}

- (BOOL)_isValidAnnotationKey:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 47)
  {
    if ([v4 length] == 1)
    {
      BOOL v5 = 1;
    }
    else
    {
      if (_isValidAnnotationKey__onceToken != -1) {
        dispatch_once(&_isValidAnnotationKey__onceToken, &__block_literal_global_1);
      }
      id v7 = [v4 substringFromIndex:1];
      [v7 rangeOfCharacterFromSet:_isValidAnnotationKey__invalidCharacters];
      BOOL v5 = v8 == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __39__PDFAnnotation__isValidAnnotationKey___block_invoke()
{
  v0 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)_isValidAnnotationKey__invalidCharacters;
  _isValidAnnotationKey__invalidCharacters = v1;

  id v3 = (void *)_isValidAnnotationKey__invalidCharacters;

  return [v3 addCharactersInString:@"()<>[]{}/%"];
}

- (BOOL)setValue:(id)value forAnnotationKey:(PDFAnnotationKey)key
{
  id v6 = value;
  id v7 = key;
  if ([(PDFAnnotation *)self _annotationAllowsCommenting:@"setValue:forAnnotationKey:"])
  {
    uint64_t v8 = +[PDFAnnotation getProperNameStringFromString:v7];
    if ([(PDFAnnotation *)self _isValidAnnotationKey:v8])
    {
      if (v6)
      {
        char v9 = [(PDFAnnotation *)self valueForAnnotationKey:v7];
        int v10 = [(NSDictionary *)self->_PDFAnnotationKeyMapping objectForKey:v8];
        double v11 = v10;
        if (v10)
        {
          switch([v10 integerValue])
          {
            case 0:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [(PDFAnnotation *)self _setArray:v6 forAnnotationKey:v8])
              {
                goto LABEL_25;
              }
              [NSString stringWithFormat:@"Error: Key %@ requires an array value.", v8];
              goto LABEL_43;
            case 1:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v13 = 0;
                  goto LABEL_44;
                }
              }
              BOOL v14 = -[PDFAnnotation setBoolean:forAnnotationKey:](self, "setBoolean:forAnnotationKey:", [v6 BOOLValue], v8);
LABEL_46:
              BOOL v12 = v14;
              uint64_t v13 = 0;
              break;
            case 2:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [(PDFAnnotation *)self _setDictionary:v6 forAnnotationKey:v8])
              {
                goto LABEL_25;
              }
              [NSString stringWithFormat:@"Error: Key %@ requires a dictionary value.", v8];
              goto LABEL_43;
            case 3:
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                if ([(PDFAnnotation *)self _setInteger:v6 forAnnotationKey:v8]) {
                  goto LABEL_25;
                }
              }
              [NSString stringWithFormat:@"Error: Key %@ requires an integer value.", v8];
              goto LABEL_43;
            case 4:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v6 PDFKitPDFRectValue];
                if (-[PDFAnnotation setRect:forAnnotationKey:](self, "setRect:forAnnotationKey:", v8)) {
                  goto LABEL_25;
                }
              }
              [NSString stringWithFormat:@"Error: Key %@ requires an NSValue of either rectValue or CGRectValue.", v8];
              goto LABEL_43;
            case 5:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [(PDFAnnotation *)self _setString:v6 forAnnotationKey:v8])
              {
                goto LABEL_25;
              }
              [NSString stringWithFormat:@"Error: Key %@ requires a string value.", v8];
              goto LABEL_43;
            case 6:
              BOOL v14 = [(PDFAnnotation *)self _setVarious:v6 forAnnotationKey:v8];
              goto LABEL_46;
            default:
              [NSString stringWithFormat:@"Error: Could not resolve type for known key %@.", v8];
              goto LABEL_43;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_24;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
LABEL_24:
            [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v6 forKey:v8];
LABEL_25:
            uint64_t v13 = 0;
            BOOL v12 = 1;
          }
          else
          {
            [NSString stringWithFormat:@"Error: Invalid value for annotation key: %@", v8];
            uint64_t v13 = LABEL_43:;
LABEL_44:
            BOOL v12 = 0;
          }
        }
        [(PDFAnnotation *)self updateAnnotationEffect];
        [(PDFAnnotation *)self presentRedactionDiscoverabilityAlertWithOldValue:v9 forAnnotationKey:v8];
        BOOL loggingEnabled = self->_loggingEnabled;
        if (!self->_loggingEnabled && v13)
        {
          if (setValue_forAnnotationKey__onceToken != -1) {
            dispatch_once(&setValue_forAnnotationKey__onceToken, &__block_literal_global_424);
          }
          BOOL loggingEnabled = self->_loggingEnabled;
        }
        if (loggingEnabled && v13) {
          NSLog(&stru_26C516968.isa, v13);
        }
      }
      else
      {
        [(PDFAnnotation *)self removeValueForAnnotationKey:v8];
        BOOL v12 = 1;
      }
    }
    else
    {
      NSLog(&cfstr_ErrorKeyIsInva.isa, v7);
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __43__PDFAnnotation_setValue_forAnnotationKey___block_invoke()
{
}

- (BOOL)setBoolean:(BOOL)value forAnnotationKey:(PDFAnnotationKey)key
{
  BOOL v4 = value;
  id v6 = key;
  if ([(PDFAnnotation *)self _annotationAllowsCommenting:@"setBoolean:forAnnotationKey:"])
  {
    id v7 = +[PDFAnnotation getProperNameStringFromString:v6];
    if ([(PDFAnnotation *)self _isValidAnnotationKey:v7])
    {
      uint64_t v8 = [(NSDictionary *)self->_PDFAnnotationKeyMapping objectForKey:v7];
      char v9 = v8;
      if (v8 && [v8 integerValue] != 1)
      {
        if (self->_loggingEnabled) {
          NSLog(&cfstr_ErrorDoesNotTa.isa, v7);
        }
        BOOL v11 = 0;
      }
      else
      {
        int v10 = [NSNumber numberWithBool:v4];
        [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v10 forKey:v7];
        [(PDFAnnotation *)self _didSetValue:v10 forAnnotationKey:v7];

        BOOL v11 = 1;
      }
    }
    else
    {
      NSLog(&cfstr_ErrorIsNotAVal.isa, v6);
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)setRect:(CGRect)value forAnnotationKey:(PDFAnnotationKey)key
{
  double height = value.size.height;
  double width = value.size.width;
  double y = value.origin.y;
  double x = value.origin.x;
  char v9 = key;
  if ([(PDFAnnotation *)self _annotationAllowsCommenting:@"setRect:forAnnotationKey:"])
  {
    int v10 = +[PDFAnnotation getProperNameStringFromString:v9];
    if ([(PDFAnnotation *)self _isValidAnnotationKey:v10])
    {
      BOOL v11 = [(NSDictionary *)self->_PDFAnnotationKeyMapping objectForKey:v10];
      BOOL v12 = v11;
      if (v11 && [v11 integerValue] != 4)
      {
        if (self->_loggingEnabled) {
          NSLog(&cfstr_ErrorDoesNotTa_0.isa, v10);
        }
        BOOL v14 = 0;
      }
      else
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", x, y, width, height);
        if ([v10 isEqualToString:@"/Rect"]) {
          -[PDFAnnotation setBounds:](self, "setBounds:", x, y, width, height);
        }
        else {
          [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v13 forKey:v10];
        }
        [(PDFAnnotation *)self _didSetValue:v13 forAnnotationKey:v10];

        BOOL v14 = 1;
      }
    }
    else
    {
      NSLog(&cfstr_ErrorKeyIsInva.isa, v9);
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_setString:(id)a3 forAnnotationKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v7 isEqualToString:@"/FT"])
  {
    char v9 = +[PDFAnnotation getProperNameStringFromString:v8];

    uint64_t v10 = +[PDFAnnotation PDFKitFieldTypeArray];
LABEL_5:
    BOOL v11 = (void *)v10;
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"/H"])
  {
    char v9 = +[PDFAnnotation getProperNameStringFromString:v8];

    uint64_t v10 = +[PDFAnnotation PDFKitHighlightingModeArray];
    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"/Contents"] && self->_isFullyConstructed)
  {
    BOOL v14 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
    double v15 = [(PDFAnnotation *)self popup];
    if ([v14 isEqualToString:@"/FreeText"])
    {
      [(PDFAnnotation *)self removeAllAppearanceStreams];
    }
    else if (v15 && [v15 isOpen])
    {
      [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v8 forKey:v7];
      [v15 removeAllAppearanceStreams];
      [v15 updateAnnotationEffect];
    }
  }
  else if ([v7 isEqualToString:@"/Subtype"])
  {
    char v9 = +[PDFAnnotation getProperNameStringFromString:v8];

    BOOL v11 = 0;
    goto LABEL_6;
  }
  BOOL v11 = 0;
  char v9 = v8;
LABEL_6:
  if ([v7 isEqualToString:@"/V"]) {
    [(PDFAnnotation *)self setWidgetStringValue:v9];
  }
  if (v11 && ![v11 containsObject:v9])
  {
    BOOL v12 = 0;
  }
  else
  {
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v9 forKey:v7];
    [(PDFAnnotation *)self _didSetValue:v9 forAnnotationKey:v7];
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_setArray:(id)a3 forAnnotationKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 count];
  id v10 = v8;
  if ([v7 isEqualToString:@"/InkList"])
  {
LABEL_2:
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v10 forKey:v7];
    [(PDFAnnotation *)self _didSetValue:v10 forAnnotationKey:v7];
    BOOL v11 = 1;
    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"/L"])
  {
    if (v9 != 4) {
      goto LABEL_46;
    }
    char v12 = 1;
    int v13 = 4;
    do
    {
      BOOL v14 = [v8 objectAtIndex:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        char v12 = 0;
      }
      --v13;
    }
    while (v13);
    id v10 = v8;
    if ((v12 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_2;
  }
  if ([v7 isEqualToString:@"/LE"])
  {
    if (v9 != 2) {
      goto LABEL_46;
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v16 = 0;
    char v17 = 1;
    char v18 = 1;
    while (1)
    {
      char v19 = v17;
      double v20 = [v8 objectAtIndex:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", [v20 integerValue]);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          char v18 = 0;
          goto LABEL_20;
        }
        uint64_t v21 = +[PDFAnnotation getProperNameStringFromString:v20];
      }
      unint64_t v22 = (void *)v21;
      [v10 addObject:v21];

LABEL_20:
      char v17 = 0;
      uint64_t v16 = 1;
      if ((v19 & 1) == 0)
      {
        if (v18)
        {

          goto LABEL_2;
        }
LABEL_45:

        goto LABEL_46;
      }
    }
  }
  if (![v7 isEqualToString:@"/Opt"])
  {
    id v10 = v8;
    if ([v7 isEqualToString:@"/QuadPoints"])
    {
      quadPointsPath = self->_quadPointsPath;
      if (quadPointsPath) {
        CGPathRelease(quadPointsPath);
      }
      self->_quadPointsPath = CGPathCreateMutable();
      id v10 = v8;
      if ((unint64_t)[v8 count] >= 4)
      {
        unint64_t v35 = 3;
        do
        {
          uint64_t v36 = [v8 objectAtIndex:v35 - 3];
          [v36 PDFKitPDFPointValue];
          CGFloat v38 = v37;
          CGFloat v40 = v39;

          uint64_t v41 = [v8 objectAtIndex:v35 - 2];
          [v41 PDFKitPDFPointValue];
          CGFloat v43 = v42;
          CGFloat v45 = v44;

          long long v46 = [v8 objectAtIndex:v35 - 1];
          [v46 PDFKitPDFPointValue];
          CGFloat v48 = v47;
          CGFloat v50 = v49;

          v51 = [v8 objectAtIndex:v35];
          [v51 PDFKitPDFPointValue];
          CGFloat v53 = v52;
          CGFloat v55 = v54;

          CGPathMoveToPoint(self->_quadPointsPath, 0, v38, v40);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v43, v45);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v53, v55);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v48, v50);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v38, v40);
          CGPathCloseSubpath(self->_quadPointsPath);
          v35 += 4;
        }
        while (v35 < [v8 count]);
        id v10 = v8;
      }
    }
    goto LABEL_2;
  }
  id v10 = v8;
  if (!v9) {
    goto LABEL_2;
  }
  uint64_t v23 = 0;
  uint64_t v24 = v9 - 1;
  char v25 = 1;
  unint64_t v26 = 0x263F08000uLL;
  uint64_t v57 = v9 - 1;
  do
  {
    id v10 = [v8 objectAtIndex:v23];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_45;
      }
      id v27 = v10;
      if ([v27 count] == 2)
      {
        long long v28 = [v27 objectAtIndex:0];
        objc_opt_class();
        char v58 = objc_opt_isKindOfClass();

        long long v29 = [v27 objectAtIndex:1];
        objc_opt_class();
        unint64_t v30 = v26;
        char v31 = objc_opt_isKindOfClass();

        uint64_t v24 = v57;
        char v32 = v31 & v58;
        unint64_t v26 = v30;
        if ((v32 & 1) == 0) {
          char v25 = 0;
        }
      }
      else
      {
        char v25 = 0;
      }
    }
    if ((v25 & 1) == 0) {
      break;
    }
  }
  while (v24 != v23++);
  id v10 = v8;
  if (v25) {
    goto LABEL_2;
  }
LABEL_46:
  if (self->_loggingEnabled) {
    NSLog(&cfstr_ErrorImproperV.isa, v7);
  }
  BOOL v11 = 0;
  id v10 = v8;
LABEL_49:

  return v11;
}

- (BOOL)_setDictionary:(id)a3 forAnnotationKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (([v7 isEqualToString:@"/AP"] & 1) != 0
    || [v7 isEqualToString:@"/MK"])
  {
    uint64_t v9 = +[PDFAnnotation PDFKitAppearanceDictionaryArray];
  }
  else
  {
    if (![v7 isEqualToString:@"/BS"])
    {
      id v10 = 0;
      goto LABEL_23;
    }
    uint64_t v9 = +[PDFAnnotation PDFKitBorderStyleArray];
  }
  id v10 = (void *)v9;
  if (!v9)
  {
LABEL_23:
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v8 forKey:v7];
    [(PDFAnnotation *)self _didSetValue:v8 forAnnotationKey:v7];
    BOOL v18 = 1;
    goto LABEL_24;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v12)
  {

    goto LABEL_23;
  }
  uint64_t v13 = v12;
  double v20 = self;
  uint64_t v14 = *(void *)v22;
  char v15 = 1;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      char v17 = +[PDFAnnotation getProperNameStringFromString:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      if (![v10 containsObject:v17]) {
        char v15 = 0;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v13);

  if (v15)
  {
    self = v20;
    goto LABEL_23;
  }
  if (v20->_loggingEnabled) {
    NSLog(&cfstr_ErrorImproperV.isa, v7);
  }
  BOOL v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)_setInteger:(id)a3 forAnnotationKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ((!strcmp((const char *)[v8 objCType], "i")
     || !strcmp((const char *)[v8 objCType], "q"))
    && (![v7 isEqualToString:@"/Q"]
     || (unint64_t)[v8 integerValue] <= 2))
  {
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v8 forKey:v7];
    [(PDFAnnotation *)self _didSetValue:v8 forAnnotationKey:v7];
    BOOL v9 = 1;
  }
  else
  {
    if (self->_loggingEnabled) {
      NSLog(&cfstr_ErrorImproperV.isa, v7);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_setVarious:(id)a3 forAnnotationKey:(id)a4
{
  id v6 = (PDFAnnotation *)a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"/A"] & 1) != 0
    || [v7 isEqualToString:@"/AA"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
LABEL_5:
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"/Border"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PDFAnnotation *)v6 setAnnotation:self];
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_4;
      }
      id v6 = v6;
      uint64_t v19 = [(PDFAnnotation *)v6 count];
      if ((unint64_t)(v19 - 3) > 1) {
        goto LABEL_44;
      }
      uint64_t v40 = v19;
      uint64_t v20 = 0;
      char v41 = 1;
      do
      {
        id v21 = [(PDFAnnotation *)v6 objectAtIndex:v20];
        if (!strcmp((const char *)[v21 objCType], "i"))
        {
        }
        else
        {
          id v22 = [(PDFAnnotation *)v6 objectAtIndex:v20];
          int v23 = strcmp((const char *)[v22 objCType], "q");

          if (v23) {
            char v41 = 0;
          }
        }
        ++v20;
      }
      while (v20 != 3);
      if (v40 != 4)
      {
        char v24 = v41;
        goto LABEL_93;
      }
      char v24 = v41;
      if ((v41 & 1) == 0)
      {
LABEL_93:

        char isKindOfClass = v24 & 1;
        goto LABEL_6;
      }
      char v25 = [(PDFAnnotation *)v6 objectAtIndex:3];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = [(PDFAnnotation *)v6 objectAtIndex:3];
        unint64_t v27 = [v26 count];

        if (v27 > 2)
        {
LABEL_44:
          char v24 = 0;
          goto LABEL_93;
        }
        char v25 = [(PDFAnnotation *)v6 objectAtIndex:3];
        uint64_t v33 = [v25 count];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = [v25 objectAtIndex:0];
          if (IsObcCEquivalent((void *)v35, "i"))
          {
            if ((v35 & 0x8000000000000000) == 0)
            {
LABEL_76:
              if (((v35 == 0) & (v34 == 1) & v41) != 0) {
                char v37 = 0;
              }
              else {
                char v37 = v41;
              }
              if (v34 != 2 || (v37 & 1) == 0) {
                goto LABEL_91;
              }
              uint64_t v38 = [v25 objectAtIndex:1];
              if (IsObcCEquivalent((void *)v38, "i"))
              {
                if ((v38 & 0x8000000000000000) == 0) {
                  goto LABEL_87;
                }
              }
              else
              {
                BOOL v39 = IsObcCEquivalent((void *)v38, "q");
                if ((v38 & 0x8000000000000000) == 0 || !v39)
                {
LABEL_87:
                  if (((v35 == 0) & v41) != 0) {
                    char v37 = 0;
                  }
                  else {
                    char v37 = v41;
                  }

LABEL_91:
                  char v24 = v37;
                  goto LABEL_92;
                }
              }
              char v41 = 0;
              goto LABEL_87;
            }
          }
          else
          {
            BOOL v36 = IsObcCEquivalent((void *)v35, "q");
            if ((v35 & 0x8000000000000000) == 0 || !v36) {
              goto LABEL_76;
            }
          }
          char v41 = 0;
          goto LABEL_76;
        }
        char v24 = v41;
      }
      else
      {
        char v24 = 0;
      }
LABEL_92:

      goto LABEL_93;
    }
LABEL_55:
    char isKindOfClass = 0;
    goto LABEL_56;
  }
  if ([v7 isEqualToString:@"/Dest"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    goto LABEL_5;
  }
  if (([v7 isEqualToString:@"/C"] & 1) != 0
    || [v7 isEqualToString:@"/IC"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    BOOL v9 = v6;
    uint64_t v10 = [(PDFAnnotation *)v9 count];
    uint64_t v11 = v10;
    if ((unint64_t)(v10 - 3) >= 2)
    {
      if (!v10) {
        goto LABEL_49;
      }
      if (v10 != 1)
      {
LABEL_31:
        char isKindOfClass = 0;
        id v6 = v9;
LABEL_50:

        goto LABEL_6;
      }
    }
    uint64_t v12 = 0;
    char v13 = 1;
    do
    {
      uint64_t v14 = [(PDFAnnotation *)v9 objectAtIndex:v12];
      char v15 = [(PDFAnnotation *)v9 objectAtIndex:v12];
      objc_opt_class();
      char v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0
        || ([v14 floatValue], v17 < 0.0)
        || ([v14 floatValue], v18 > 1.0))
      {
        char v13 = 0;
      }

      ++v12;
    }
    while (v11 != v12);
    if ((v13 & 1) == 0) {
      goto LABEL_31;
    }
LABEL_49:
    PDFColorCreateFromNSArray(v9);
    id v6 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();

    char isKindOfClass = 1;
    goto LABEL_50;
  }
  if ([v7 isEqualToString:@"/M"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"/P"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_55;
      }
    }
    uint64_t v28 = [MEMORY[0x263EFF9D0] null];
LABEL_62:
    unint64_t v30 = (PDFAnnotation *)v28;

    char isKindOfClass = 1;
    id v6 = v30;
    goto LABEL_6;
  }
  if (![v7 isEqualToString:@"/Parent"])
  {
    if ([v7 isEqualToString:@"/Popup"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        popup = self->_popup;
        self->_popup = v6;
        char v32 = v6;

        id v6 = [(PDFAnnotation *)v32 pdfAnnotationUUID];
      }
    }
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeWeak((id *)&self->_parent, v6);
    uint64_t v28 = [(PDFAnnotation *)v6 pdfAnnotationUUID];
    goto LABEL_62;
  }
LABEL_4:
  char isKindOfClass = 1;
LABEL_6:
  if ((isKindOfClass & 1) != 0 && v6)
  {
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary setObject:v6 forKey:v7];
    [(PDFAnnotation *)self _didSetValue:v6 forAnnotationKey:v7];
    char isKindOfClass = 1;
    goto LABEL_58;
  }
LABEL_56:
  if (self->_loggingEnabled) {
    NSLog(&cfstr_ErrorImproperV.isa, v7);
  }
LABEL_58:

  return isKindOfClass & 1;
}

- (NSDictionary)annotationKeyValues
{
  v2 = self;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary allKeys];
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    BOOL v9 = @"/Parent";
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = sel_copyWithZone_;
      uint64_t v22 = v7;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        if (([v12 isEqualToString:v9] & 1) == 0)
        {
          char v13 = [(NSMutableDictionary *)v2->_PDFAnnotationDictionary objectForKey:v12];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v14 = v8;
            char v15 = v11;
            char v16 = v9;
            id v17 = v5;
            float v18 = v4;
            uint64_t v19 = v2;
            uint64_t v20 = [v13 copyWithZone:0];

            char v13 = (void *)v20;
            v2 = v19;
            BOOL v4 = v18;
            id v5 = v17;
            BOOL v9 = v16;
            uint64_t v11 = v15;
            uint64_t v8 = v14;
            uint64_t v7 = v22;
          }
          [v4 setObject:v13 forKey:v12];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  return (NSDictionary *)v4;
}

- (id)valueForAnnotationKey:(PDFAnnotationKey)key
{
  if (key)
  {
    BOOL v4 = +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:");
    if ([v4 isEqualToString:@"/Parent"])
    {
      id WeakRetained = (PDFAnnotation *)objc_loadWeakRetained((id *)&self->_parent);
    }
    else if ([v4 isEqualToString:@"/Popup"])
    {
      id WeakRetained = self->_popup;
    }
    else
    {
      id WeakRetained = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:v4];
    }
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v7 = WeakRetained;
    }
    else if (self->_loggingEnabled)
    {
      NSLog(&cfstr_ErrorNoValueCu.isa, v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeValueForAnnotationKey:(PDFAnnotationKey)key
{
  uint64_t v8 = key;
  BOOL v4 = +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:");
  if (![(PDFAnnotation *)self _isValidAnnotationKey:v4])
  {
    NSLog(&cfstr_ErrorKeyIsInva.isa, v8);
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"/AP"])
  {
    [(PDFAnnotation *)self setAppearance:0 forType:0];
    [(PDFAnnotation *)self setAppearance:0 forType:1];
    [(PDFAnnotation *)self setAppearance:0 forType:2];
    [(PDFAnnotation *)self setAppearance:0 forType:3];
    [(PDFAnnotation *)self setAppearance:0 forType:4];
    [(PDFAnnotation *)self setAppearance:0 forType:5];
  }
  if ([v4 isEqualToString:@"/Border"])
  {
    id v5 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:v4];
    [v5 setAnnotation:0];
  }
  if (v4)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:v4];
    if (v6)
    {
    }
    else
    {
      uint64_t v7 = [(NSMutableDictionary *)self->_internalPDFAnnotationDictionary objectForKey:v4];

      if (!v7) {
        goto LABEL_12;
      }
    }
    [(NSMutableDictionary *)self->_PDFAnnotationDictionary removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_internalPDFAnnotationDictionary removeObjectForKey:v4];
    [(PDFAnnotation *)self _didRemoveValueForAnnotationKey:v4];
    [(PDFAnnotation *)self updateAnnotationEffect];
  }
LABEL_12:
}

- (void)_didSetValue:(id)a3 forAnnotationKey:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (WeakRetained && ([v7 isEqualToString:@"/P"] & 1) == 0 && self->_isFullyConstructed) {
    [WeakRetained changedAnnotation:self];
  }
  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor) {
    [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor didSetValue:v6 forAnnotationKey:v7];
  }
  [(PDFAnnotation *)self postAnnotationsChangedNotification];
  uint64_t v10 = [WeakRetained view];
  int v11 = [v10 allowsMarkupAnnotationEditing];

  if (v11)
  {
    uint64_t v12 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
    if ([v12 isEqualToString:@"/Widget"]
      && [v7 isEqualToString:@"/V"]
      && [(PDFAnnotation *)self isFullyConstructed])
    {
      [(PDFAnnotation *)self updateFormData];
    }
    if ([(PDFAnnotation *)self isFullyConstructed])
    {
      char v13 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v14 = [WeakRetained view];
      v16[0] = @"annotation";
      v16[1] = @"key";
      v17[0] = self;
      v17[1] = v7;
      char v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      [v13 postNotificationName:@"PDFAnnotationPropertiesChangedNotificationNotification" object:v14 userInfo:v15];
    }
  }
}

- (void)_didRemoveValueForAnnotationKey:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (WeakRetained && ([v4 isEqualToString:@"/P"] & 1) == 0 && self->_isFullyConstructed) {
    [WeakRetained changedAnnotation:self];
  }
  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor) {
    [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor didRemoveValueForAnnotationKey:v4];
  }
  id v7 = [WeakRetained view];
  int v8 = [v7 allowsMarkupAnnotationEditing];

  if (v8)
  {
    BOOL v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = [WeakRetained view];
    v12[0] = @"annotation";
    v12[1] = @"key";
    v13[0] = self;
    v13[1] = v4;
    int v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v9 postNotificationName:@"PDFAnnotationPropertiesChangedNotificationNotification" object:v10 userInfo:v11];
  }
}

- (id)getPDFKeyMappingDictionary
{
  if (getPDFKeyMappingDictionary_onceToken != -1) {
    dispatch_once(&getPDFKeyMappingDictionary_onceToken, &__block_literal_global_465);
  }
  v2 = (void *)getPDFKeyMappingDictionary_kPDFKeyMappingDictionary;

  return v2;
}

void __43__PDFAnnotation_getPDFKeyMappingDictionary__block_invoke()
{
  v45[42] = *MEMORY[0x263EF8340];
  v44[0] = @"/A";
  CGFloat v43 = [NSNumber numberWithInteger:6];
  v45[0] = v43;
  v44[1] = @"/AC";
  double v42 = [NSNumber numberWithInteger:5];
  v45[1] = v42;
  v44[2] = @"/AA";
  char v41 = [NSNumber numberWithInteger:6];
  v45[2] = v41;
  v44[3] = @"/AP";
  uint64_t v40 = [NSNumber numberWithInteger:2];
  v45[3] = v40;
  v44[4] = @"/AS";
  BOOL v39 = [NSNumber numberWithInteger:5];
  v45[4] = v39;
  v44[5] = @"/BC";
  uint64_t v38 = [NSNumber numberWithInteger:6];
  v45[5] = v38;
  v44[6] = @"/BG";
  char v37 = [NSNumber numberWithInteger:6];
  v45[6] = v37;
  v44[7] = @"/Border";
  BOOL v36 = [NSNumber numberWithInteger:6];
  v45[7] = v36;
  v44[8] = @"/BS";
  uint64_t v35 = [NSNumber numberWithInteger:2];
  v45[8] = v35;
  v44[9] = @"/C";
  uint64_t v34 = [NSNumber numberWithInteger:6];
  v45[9] = v34;
  v44[10] = @"/CA";
  uint64_t v33 = [NSNumber numberWithInteger:5];
  v45[10] = v33;
  v44[11] = @"/Contents";
  char v32 = [NSNumber numberWithInteger:5];
  v45[11] = v32;
  v44[12] = @"/DA";
  char v31 = [NSNumber numberWithInteger:5];
  v45[12] = v31;
  v44[13] = @"/Dest";
  unint64_t v30 = [NSNumber numberWithInteger:6];
  v45[13] = v30;
  v44[14] = @"/DV";
  long long v29 = [NSNumber numberWithInteger:6];
  v45[14] = v29;
  v44[15] = @"/F";
  uint64_t v28 = [NSNumber numberWithInteger:3];
  v45[15] = v28;
  v44[16] = @"/Ff";
  unint64_t v27 = [NSNumber numberWithInteger:3];
  v45[16] = v27;
  v44[17] = @"/FT";
  long long v26 = [NSNumber numberWithInteger:5];
  v45[17] = v26;
  v44[18] = @"/H";
  long long v25 = [NSNumber numberWithInteger:5];
  v45[18] = v25;
  v44[19] = @"/IC";
  long long v24 = [NSNumber numberWithInteger:6];
  v45[19] = v24;
  v44[20] = @"/Inklist";
  long long v23 = [NSNumber numberWithInteger:0];
  v45[20] = v23;
  v44[21] = @"/L";
  uint64_t v22 = [NSNumber numberWithInteger:0];
  v45[21] = v22;
  v44[22] = @"/LE";
  id v21 = [NSNumber numberWithInteger:0];
  v45[22] = v21;
  v44[23] = @"/M";
  uint64_t v20 = [NSNumber numberWithInteger:6];
  v45[23] = v20;
  v44[24] = @"/MaxLen";
  uint64_t v19 = [NSNumber numberWithInteger:3];
  v45[24] = v19;
  v44[25] = @"/MK";
  float v18 = [NSNumber numberWithInteger:6];
  v45[25] = v18;
  v44[26] = @"/Name";
  id v17 = [NSNumber numberWithInteger:5];
  v45[26] = v17;
  v44[27] = @"/Open";
  char v16 = [NSNumber numberWithInteger:1];
  v45[27] = v16;
  v44[28] = @"/Opt";
  char v15 = [NSNumber numberWithInteger:0];
  v45[28] = v15;
  v44[29] = @"/P";
  uint64_t v14 = [NSNumber numberWithInteger:6];
  v45[29] = v14;
  v44[30] = @"/Parent";
  char v13 = [NSNumber numberWithInteger:6];
  v45[30] = v13;
  v44[31] = @"/Popup";
  uint64_t v12 = [NSNumber numberWithInteger:6];
  v45[31] = v12;
  v44[32] = @"/Q";
  v0 = [NSNumber numberWithInteger:3];
  v45[32] = v0;
  v44[33] = @"/QuadPoints";
  uint64_t v1 = [NSNumber numberWithInteger:0];
  v45[33] = v1;
  v44[34] = @"/R";
  v2 = [NSNumber numberWithInteger:3];
  v45[34] = v2;
  v44[35] = @"/RC";
  id v3 = [NSNumber numberWithInteger:5];
  v45[35] = v3;
  v44[36] = @"/Rect";
  id v4 = [NSNumber numberWithInteger:4];
  v45[36] = v4;
  v44[37] = @"/Subtype";
  id v5 = [NSNumber numberWithInteger:5];
  v45[37] = v5;
  v44[38] = @"/Type";
  id v6 = [NSNumber numberWithInteger:5];
  v45[38] = v6;
  v44[39] = @"/T";
  id v7 = [NSNumber numberWithInteger:5];
  v45[39] = v7;
  v44[40] = @"/TU";
  int v8 = [NSNumber numberWithInteger:5];
  v45[40] = v8;
  v44[41] = @"/V";
  BOOL v9 = [NSNumber numberWithInteger:6];
  v45[41] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:42];
  int v11 = (void *)getPDFKeyMappingDictionary_kPDFKeyMappingDictionary;
  getPDFKeyMappingDictionary_kPDFKeyMappingDictionardouble y = v10;
}

+ (id)getProperNameStringFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ![v3 hasPrefix:@"/"])
  {
    id v5 = [@"/" stringByAppendingString:v4];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (__CFDictionary)dictionaryRef
{
  if (!self->_dictionaryRef)
  {
    id v3 = [(PDFAnnotation *)self commonCreateDictionaryRef];
    if (v3)
    {
      id v4 = v3;
      [(PDFAnnotation *)self _addAKAnnotationToDictionary:v3];
      [(PDFAnnotation *)self setDictionaryRef:v4];
      CFRelease(v4);
    }
  }
  return self->_dictionaryRef;
}

- (__CFDictionary)dictionaryRefExcludingParentOrPopup
{
  v2 = [(PDFAnnotation *)self dictionaryRef];
  id v3 = v2;
  if (v2)
  {
    CFDictionaryRemoveValue(v2, @"/Parent");
    CFDictionaryRemoveValue(v3, @"/Popup");
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"/AAPL:AKExtras");
    if (Value)
    {
      CFDictionaryRef v5 = Value;
      CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"/AAPL:AKPDFAnnotationDictionary");
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        if (CFDictionaryGetValue(v6, @"/Parent") || CFDictionaryGetValue(v7, @"/Popup"))
        {
          CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          MutableCopdouble y = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v5);
          if (MutableCopy)
          {
            uint64_t v10 = MutableCopy;
            int v11 = CFDictionaryCreateMutableCopy(v8, 0, v7);
            if (v11)
            {
              uint64_t v12 = v11;
              CFDictionaryRemoveValue(v11, @"/Parent");
              CFDictionaryRemoveValue(v12, @"/Popup");
              CFDictionarySetValue(v10, @"/AAPL:AKPDFAnnotationDictionary", v12);
              CFRelease(v12);
            }
            CFDictionarySetValue(v3, @"/AAPL:AKExtras", v10);
            CFRelease(v10);
          }
        }
      }
    }
  }
  return v3;
}

- (void)_addAKAnnotationToDictionary:(__CFDictionary *)a3
{
  CFDictionaryRef v5 = [(PDFAnnotation *)self akAnnotation];
  if (v5 || (CFDictionaryRef v5 = self->_akAnnotationForCopying) != 0)
  {
    CFDictionaryRef v6 = v5;
    +[PDFAKAnnotationSerializationHelper addAKAnnotation:v5 toAnnotationDictionary:a3];
  }
}

- (CGPDFAnnotation)CGPDFAnnotation
{
  return self->_cgAnnotation;
}

- (void)setCGPDFAnnotation:(CGPDFAnnotation *)a3
{
  cgAnnotation = self->_cgAnnotation;
  if (cgAnnotation != a3)
  {
    if (cgAnnotation) {
      CFRelease(cgAnnotation);
    }
    self->_cgAnnotation = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  CFDictionaryRef v5 = [WeakRetained view];
  if (([v5 isUpdatingSelectionMarkups] & 1) == 0)
  {
    self->_isSelected = v3;
    if (GetDefaultsWriteAKEnabled())
    {
      CFDictionaryRef v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
      if ([(PDFAnnotation *)self isMarkupAnnotationSubtype])
      {
        uint64_t v7 = [v5 activeMarkupStyle];
        [v5 setActiveMarkupStyle:8];
        if (v3)
        {
          CFAllocatorRef v8 = [(PDFAnnotation *)self _selectionForMarkupAnnotation];
          if (v8)
          {
            BOOL v9 = [v5 currentSelection];
            [v8 addSelection:v9];
            [v5 setCurrentSelection:v8];
          }
        }
        else
        {
          [v5 setCurrentSelection:0];
        }
        [v5 setActiveMarkupStyle:v7];
      }
      else
      {
        if ([v6 isEqualToString:@"/Link"]) {
          BOOL v10 = !v3;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          if (self->_akAnnotationAdaptor)
          {
            int v11 = [WeakRetained akPageAdaptor];
            uint64_t v12 = [v11 akPageModelController];

            if (v3)
            {
              char v13 = [(PDFAKAnnotationAdaptor *)self->_akAnnotationAdaptor akAnnotation];
              [v12 selectAnnotation:v13 byExtendingSelection:1];
            }
            else
            {
              char v13 = [MEMORY[0x263F088D0] indexSet];
              [v12 selectAnnotationsAtIndexes:v13 byExtendingSelection:0];
            }
          }
        }
        else
        {
          uint64_t v14 = [v5 document];
          uint64_t v15 = [v14 indexForPage:WeakRetained];

          char v16 = [v5 pageViewForPageAtIndex:v15];
          id v17 = [v16 pageLayer];
          id v18 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:self withLayer:v17 forType:0];
        }
      }
    }
    [(PDFAnnotation *)self updateAnnotationEffect];
  }
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setPopupInternal:(id)a3 scanPage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (PDFAnnotation *)a3;
  p_popup = &self->_popup;
  if (self->_popup != v7)
  {
    uint64_t v20 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&self->_popup, a3);
      [(PDFAnnotation *)self->_popup setParent:self];
      [(PDFAnnotation *)self setValue:v20 forAnnotationKey:@"/Popup"];
      [(PDFAnnotation *)self->_popup setValue:self forAnnotationKey:@"/Parent"];
      if (!v4) {
        goto LABEL_17;
      }
      BOOL v9 = [(PDFAnnotation *)self page];
      if (!v9) {
        goto LABEL_17;
      }
      BOOL v10 = v9;
      int v11 = [v9 annotations];
      uint64_t v12 = v11;
      if (v11)
      {
        uint64_t v13 = [(PDFAnnotation *)v11 count];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = 0;
          while (1)
          {
            char v16 = [(PDFAnnotation *)v12 objectAtIndex:v15];
            id v17 = *p_popup;

            if (v16 == v17) {
              break;
            }
            if (v14 == ++v15) {
              goto LABEL_10;
            }
          }
        }
        else
        {
LABEL_10:
          [v10 addAnnotation:*p_popup];
        }
      }
    }
    else
    {
      id v18 = [(PDFAnnotation *)self page];
      BOOL v10 = v18;
      if (v18) {
        [v18 removeAnnotation:*p_popup];
      }
      [(PDFAnnotation *)self removeValueForAnnotationKey:@"/Contents"];
      popup = self->_popup;
      if (popup) {
        [(PDFAnnotation *)popup removeValueForAnnotationKey:@"/Parent"];
      }
      [(PDFAnnotation *)self removeValueForAnnotationKey:@"/Popup"];
      uint64_t v12 = self->_popup;
      self->_popup = 0;
    }

LABEL_17:
    [(PDFAnnotation *)self updateAnnotationEffect];
    uint64_t v7 = v20;
  }
}

- (PDFAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4
{
  id v6 = a4;
  long long v159 = 0u;
  long long v160 = 0u;
  CGPDFBoolean v158 = 0;
  CGPDFReal v156 = 0.0;
  CGPDFInteger v157 = 0;
  arradouble y = 0;
  CGPDFStringRef string = 0;
  CGPDFDictionaryRef value = 0;
  CGPDFDictionaryRef dict = 0;
  v151 = 0;
  if (a3)
  {
    v150.receiver = self;
    v150.super_class = (Class)PDFAnnotation;
    self = [(PDFAnnotation *)&v150 init];

    if (self)
    {
      [(PDFAnnotation *)self commonInit];
      self->_BOOL isFullyConstructed = 0;
      self->_sourceDictionardouble y = a3;
      if (CGPDFDictionaryGetRect())
      {
        double v7 = PDFRectFromCGRect(*(double *)&v159, *((double *)&v159 + 1), *(double *)&v160, *((double *)&v160 + 1));
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        -[PDFAnnotation setRect:forAnnotationKey:](self, "setRect:forAnnotationKey:", @"/Rect");
        if (!CGPDFDictionaryGetDictionary(a3, "Parent", &value)) {
          CGPDFDictionaryRef value = 0;
        }
        if (CGPDFDictionaryGetName(a3, "Subtype", (const char **)&v151))
        {
          id v14 = [NSString alloc];
          uint64_t v15 = (void *)[v14 initWithUTF8String:v151];
          char v16 = +[PDFAnnotation getProperNameStringFromString:v15];

          [(PDFAnnotation *)self setValue:v16 forAnnotationKey:@"/Subtype"];
          if (objc_msgSend(v16, "isEqualToString:")
            && (CGPDFDictionaryGetName(a3, "FT", (const char **)&v151)
             || value && CGPDFDictionaryGetName(value, "FT", (const char **)&v151)))
          {
            id v17 = [NSString alloc];
            id v18 = (void *)[v17 initWithUTF8String:v151];
            uint64_t v19 = +[PDFAnnotation getProperNameStringFromString:v18];

            [(PDFAnnotation *)self setValue:v19 forAnnotationKey:@"/FT"];
          }
          else
          {
            uint64_t v19 = 0;
          }
          objc_storeWeak((id *)&self->_page, v6);
          id v21 = [v6 document];
          if (CGPDFDictionaryGetDictionary(a3, "A", &dict))
          {
            uint64_t v22 = +[PDFAction actionWithActionDictionary:dict forDocument:v21 forPage:v6];
            long long v23 = v22;
            if (v22)
            {
              long long v24 = [v22 type];

              if (v24) {
                [(PDFAnnotation *)self setValue:v23 forAnnotationKey:@"/A"];
              }
            }
          }
          else
          {
            long long v23 = 0;
          }
          if (!CGPDFDictionaryGetDictionary(a3, "AA", &dict))
          {
            v142 = 0;
LABEL_37:
            if ([(PDFAnnotation *)self _shouldReadAppearanceStreams]
              && CGPDFDictionaryGetDictionary(a3, "AP", &dict))
            {
              [(PDFAnnotation *)self getAppearancesFromDictionary:dict ofType:0];
              [(PDFAnnotation *)self getAppearancesFromDictionary:dict ofType:1];
              [(PDFAnnotation *)self getAppearancesFromDictionary:dict ofType:2];
            }
            if (CGPDFDictionaryGetArray(a3, "Border", &array) || CGPDFDictionaryGetDictionary(a3, "BS", &dict))
            {
              unint64_t v30 = [[PDFBorder alloc] initWithAnnotationDictionary:a3 forPage:v6];
              [(PDFAnnotation *)self setValue:v30 forAnnotationKey:@"/Border"];
            }
            if (CGPDFDictionaryGetArray(a3, "C", &array))
            {
              char v31 = PDFColorCreateFromCGPDFArray(array);
              if ([(PDFAnnotation *)self isMarkupAnnotationSubtype])
              {
                char v32 = [(PDFAnnotation *)self _PDFMarkupColorForColor:v31];
              }
              else
              {
                if (![v16 isEqualToString:@"/Text"])
                {
LABEL_53:
                  [(PDFAnnotation *)self setValue:v31 forAnnotationKey:@"/C"];

LABEL_54:
                  if (CGPDFDictionaryGetString(a3, "Contents", &string))
                  {
                    uint64_t v34 = (__CFString *)CGPDFStringCopyTextString(string);
                    [(PDFAnnotation *)self setValue:v34 forAnnotationKey:@"/Contents"];
                  }
                  if (CGPDFDictionaryGetInteger(a3, "F", &v157))
                  {
                    uint64_t v35 = [NSNumber numberWithLong:v157];
                    [(PDFAnnotation *)self setValue:v35 forAnnotationKey:@"/F"];
                  }
                  if (CGPDFDictionaryGetString(a3, "M", &string))
                  {
                    CFDateRef v36 = CGPDFStringCopyDate(string);
                    if (v36)
                    {
                      CFDateRef v37 = v36;
                      [(PDFAnnotation *)self setValue:v36 forAnnotationKey:@"/M"];
                    }
                  }
                  if (CGPDFDictionaryGetString(a3, "NM", &string))
                  {
                    uint64_t v38 = (__CFString *)CGPDFStringCopyTextString(string);
                    [(PDFAnnotation *)self setValue:v38 forAnnotationKey:@"/NM"];
                  }
                  if ((objc_msgSend(v16, "isEqualToString:") & 1) == 0
                    && CGPDFDictionaryGetDictionary(a3, "Popup", &dict))
                  {
                    self->_popupDictionardouble y = dict;
                  }
                  if (([v16 isEqualToString:@"/Widget"] & 1) != 0
                    || !CGPDFDictionaryGetString(a3, "T", &string))
                  {
                    [(PDFAnnotation *)self _generateFormFieldName];
                  }
                  else
                  {
                    BOOL v39 = (__CFString *)CGPDFStringCopyTextString(string);
                    [(PDFAnnotation *)self setValue:v39 forAnnotationKey:@"/T"];
                  }
                  if (CGPDFDictionaryGetString(a3, "DA", &string))
                  {
                    uint64_t v40 = [(PDFAnnotation *)self getFontFromAppearanceString:string];
                    [(PDFAnnotation *)self setFont:v40];

                    char v41 = [(PDFAnnotation *)self getColorFromAppearanceString:string];
                    [(PDFAnnotation *)self setFontColor:v41];
                  }
                  if (![v16 isEqualToString:@"/Link"])
                  {
LABEL_82:
                    if (CGPDFDictionaryGetArray(a3, "IC", &array))
                    {
                      double v44 = PDFColorCreateFromCGPDFArray(array);
                      [(PDFAnnotation *)self setValue:v44 forAnnotationKey:@"/IC"];
                    }
                    if (CGPDFDictionaryGetName(a3, "H", (const char **)&v151))
                    {
                      id v45 = [NSString alloc];
                      long long v46 = (void *)[v45 initWithUTF8String:v151];
                      double v47 = +[PDFAnnotation getProperNameStringFromString:v46];

                      [(PDFAnnotation *)self setValue:v47 forAnnotationKey:@"/H"];
                    }
                    v144 = v21;
                    v145 = v16;
                    v146 = v19;
                    v143 = v23;
                    if (CGPDFDictionaryGetArray(a3, "InkList", &array))
                    {
                      id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
                      CGPDFArrayRef v149 = 0;
                      uint64_t Count = CGPDFArrayGetCount(array);
                      if (Count)
                      {
                        for (size_t i = 0; i != Count; ++i)
                        {
                          if (CGPDFArrayGetArray(array, i, &v149))
                          {
                            v51 = v149;
                            *(double *)&CGPDFDictionaryRef v147 = 0.0;
                            v161[0] = 0.0;
                            unsigned int v52 = CGPDFArrayGetCount(v149);
                            if (v52 && (v52 & 1) == 0)
                            {
                              double v54 = [MEMORY[0x263F824C0] bezierPath];
                              if (!CGPDFArrayGetNumber(v51, 0, (CGPDFReal *)&v147)) {
                                *(double *)&CGPDFDictionaryRef v147 = 0.0;
                              }
                              if (CGPDFArrayGetNumber(v51, 1uLL, v161))
                              {
                                double v55 = v161[0];
                              }
                              else
                              {
                                v161[0] = 0.0;
                                double v55 = 0.0;
                              }
                              objc_msgSend(v54, "moveToPoint:", PDFPointMake(*(double *)&v147 - v7, v55 - v9));
                              if (v52 >= 4)
                              {
                                unsigned int v56 = v52 >> 1;
                                if (v52 >> 1 <= 2) {
                                  unsigned int v56 = 2;
                                }
                                uint64_t v57 = 2 * v56;
                                size_t v58 = 2;
                                do
                                {
                                  if (!CGPDFArrayGetNumber(v51, v58, (CGPDFReal *)&v147)) {
                                    *(double *)&CGPDFDictionaryRef v147 = 0.0;
                                  }
                                  if (CGPDFArrayGetNumber(v51, v58 + 1, v161))
                                  {
                                    double v59 = v161[0];
                                  }
                                  else
                                  {
                                    v161[0] = 0.0;
                                    double v59 = 0.0;
                                  }
                                  objc_msgSend(v54, "addLineToPoint:", PDFPointMake(*(double *)&v147 - v7, v59 - v9));
                                  v58 += 2;
                                }
                                while (v57 != v58);
                              }
                              if (v54)
                              {
                                [v48 addObject:v54];
                              }
                            }
                          }
                        }
                      }
                      [(PDFAnnotation *)self setValue:v48 forAnnotationKey:@"/InkList"];

                      id v21 = v144;
                      char v16 = v145;
                      uint64_t v19 = v146;
                      long long v23 = v143;
                    }
                    if (CGPDFDictionaryGetArray(a3, "L", &array) && CGPDFArrayGetCount(array) == 4)
                    {
                      double v60 = *MEMORY[0x263F00148];
                      double v61 = *(double *)(MEMORY[0x263F00148] + 8);
                      if (CGPDFArrayGetNumber(array, 0, &v156)) {
                        double v62 = v156;
                      }
                      else {
                        double v62 = v60;
                      }
                      if (CGPDFArrayGetNumber(array, 1uLL, &v156)) {
                        double v63 = v156;
                      }
                      else {
                        double v63 = v61;
                      }
                      if (CGPDFArrayGetNumber(array, 2uLL, &v156)) {
                        double v60 = v156;
                      }
                      if (CGPDFArrayGetNumber(array, 3uLL, &v156)) {
                        double v61 = v156;
                      }
                      id v64 = objc_alloc(MEMORY[0x263EFF8C0]);
                      v65 = [NSNumber numberWithDouble:v62];
                      v66 = [NSNumber numberWithDouble:v63];
                      v67 = [NSNumber numberWithDouble:v60];
                      v68 = [NSNumber numberWithDouble:v61];
                      v69 = objc_msgSend(v64, "initWithObjects:", v65, v66, v67, v68, 0);

                      uint64_t v19 = v146;
                      [(PDFAnnotation *)self setValue:v69 forAnnotationKey:@"/L"];
                    }
                    else if ([v16 isEqualToString:@"/Line"])
                    {
                      a3 = 0;
LABEL_287:

                      goto LABEL_13;
                    }
                    if (CGPDFDictionaryGetArray(a3, "LE", &array) && CGPDFArrayGetCount(array) == 2)
                    {
                      if (CGPDFArrayGetName(array, 0, (const char **)&v151))
                      {
                        id v70 = [NSString alloc];
                        v71 = (void *)[v70 initWithUTF8String:v151];
                        v72 = +[PDFAnnotation getProperNameStringFromString:v71];

                        PDFLineStyle v73 = +[PDFAnnotation lineStyleFromName:v72];
                      }
                      else
                      {
                        PDFLineStyle v73 = kPDFLineStyleNone;
                        v72 = 0;
                      }
                      if (CGPDFArrayGetName(array, 1uLL, (const char **)&v151))
                      {
                        id v74 = [NSString alloc];
                        v75 = (void *)[v74 initWithUTF8String:v151];
                        uint64_t v76 = +[PDFAnnotation getProperNameStringFromString:v75];

                        PDFLineStyle v77 = +[PDFAnnotation lineStyleFromName:v76];
                        v72 = (void *)v76;
                      }
                      else
                      {
                        PDFLineStyle v77 = kPDFLineStyleNone;
                      }
                      id v78 = objc_alloc(MEMORY[0x263EFF8C0]);
                      v79 = [NSNumber numberWithInteger:v73];
                      v80 = [NSNumber numberWithInteger:v77];
                      v81 = objc_msgSend(v78, "initWithObjects:", v79, v80, 0);

                      [(PDFAnnotation *)self setValue:v81 forAnnotationKey:@"/LE"];
                      uint64_t v19 = v146;
                    }
                    if (CGPDFDictionaryGetName(a3, "Name", (const char **)&v151))
                    {
                      id v82 = [NSString alloc];
                      v83 = (void *)[v82 initWithUTF8String:v151];
                      v84 = +[PDFAnnotation getProperNameStringFromString:v83];

                      [(PDFAnnotation *)self setValue:v84 forAnnotationKey:@"/Name"];
                    }
                    else if ([v16 isEqualToString:@"/Stamp"])
                    {
                      [(PDFAnnotation *)self setValue:@"/Draft" forAnnotationKey:@"/Name"];
                    }
                    if (CGPDFDictionaryGetBoolean(a3, "Open", &v158))
                    {
                      v85 = [NSNumber numberWithBool:v158 != 0];
                      [(PDFAnnotation *)self setValue:v85 forAnnotationKey:@"/Open"];
                    }
                    if (value && [v16 isEqualToString:@"/Popup"])
                    {
                      *(double *)&CGPDFDictionaryRef v147 = 0.0;
                      v161[0] = 0.0;
                      if (CGPDFDictionaryGetString(value, "Contents", &v147))
                      {
                        v86 = (__CFString *)CGPDFStringCopyTextString(v147);
                        if ([(__CFString *)v86 length]) {
                          [(PDFAnnotation *)self setContents:v86];
                        }
                      }
                      if (CGPDFDictionaryGetString(value, "M", &v147))
                      {
                        CFDateRef v87 = CGPDFStringCopyDate(v147);
                        if (v87)
                        {
                          CFDateRef v88 = v87;
                          [(PDFAnnotation *)self setModificationDate:v87];
                        }
                      }
                      if (CGPDFDictionaryGetArray(value, "C", (CGPDFArrayRef *)v161))
                      {
                        v89 = PDFColorCreateFromCGPDFArray(*(CGPDFArray **)&v161[0]);
                        [(PDFAnnotation *)self setValue:v89 forAnnotationKey:@"/C"];
                      }
                    }
                    if ([v16 isEqualToString:@"/Text"]
                      && ![(PDFAnnotation *)self popupDictionary])
                    {
                      id v90 = objc_alloc([(PDFAnnotation *)self annotationSubclassForPopup]);
                      v162.origin.double x = v7;
                      v162.origin.double y = v9;
                      v162.size.double width = v11;
                      v162.size.double height = v13;
                      CGRect v163 = PDFRectOffset(v162, 30.0, 0.0);
                      v91 = objc_msgSend(v90, "initCommonWithBounds:", v163.origin.x, v163.origin.y, v163.size.width, v163.size.height);
                      [v91 setType:@"/Popup"];
                      objc_msgSend(v91, "setOpen:", -[PDFAnnotation isOpen](self, "isOpen"));
                      [(PDFAnnotation *)self setPopupInternal:v91 scanPage:0];
                    }
                    if (CGPDFDictionaryGetInteger(a3, "Q", &v157))
                    {
                      if (v157 == 1) {
                        uint64_t v92 = 1;
                      }
                      else {
                        uint64_t v92 = 2 * (v157 == 2);
                      }
                      [(PDFAnnotation *)self setAlignment:v92];
                    }
                    if (CGPDFDictionaryGetArray(a3, "QuadPoints", &array))
                    {
                      unsigned int v93 = CGPDFArrayGetCount(array);
                      if (v93 >= 2)
                      {
                        uint64_t v94 = v93 >> 1;
                        v95 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v94];
                        size_t v96 = 0;
                        if (v94 <= 1) {
                          int v97 = 1;
                        }
                        else {
                          int v97 = v94;
                        }
                        while (1)
                        {
                          *(double *)&CGPDFDictionaryRef v147 = 0.0;
                          double v148 = 0.0;
                          if (!CGPDFArrayGetNumber(array, v96, (CGPDFReal *)&v147)) {
                            break;
                          }
                          size_t v98 = v96 + 1;
                          if (!CGPDFArrayGetNumber(array, v98, &v148)) {
                            break;
                          }
                          v99 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *(double *)&v147, v148);
                          [v95 addObject:v99];

                          size_t v96 = v98 + 1;
                          if (!--v97)
                          {
                            [(PDFAnnotation *)self setValue:v95 forAnnotationKey:@"/QuadPoints"];
                            [(PDFAnnotation *)self updateAnnotationEffect];
                            break;
                          }
                        }

                        char v16 = v145;
                        uint64_t v19 = v146;
                      }
                    }
                    if (([v16 isEqualToString:@"/Circle"] & 1) != 0
                      || ([v16 isEqualToString:@"/FreeText"] & 1) != 0
                      || ([v16 isEqualToString:@"/Line"] & 1) != 0
                      || ([v16 isEqualToString:@"/Ink"] & 1) != 0
                      || [v16 isEqualToString:@"/Square"])
                    {
                      v100 = [(PDFAnnotation *)self border];

                      if (!v100)
                      {
                        v101 = objc_alloc_init(PDFBorder);
                        [(PDFAnnotation *)self setBorder:v101];
                      }
                    }
                    if ([v16 isEqualToString:@"/Text"]) {
                      -[PDFAnnotation setBounds:](self, "setBounds:", v7, PDFRectGetMaxY(v7, v9, v11, v13) + -24.0, 24.0, 24.0);
                    }
                    if (![v16 isEqualToString:@"/Widget"]) {
                      goto LABEL_285;
                    }
                    if ([v19 isEqualToString:@"/Sig"])
                    {
                      [(PDFAnnotation *)self setIsSignature:1];
                    }
                    else if (CGPDFDictionaryGetName(value, "FT", (const char **)&v151))
                    {
                      id v102 = [NSString alloc];
                      v103 = (void *)[v102 initWithUTF8String:v151];
                      v104 = +[PDFAnnotation getProperNameStringFromString:v103];

                      if ([v104 isEqualToString:@"/Sig"]) {
                        [(PDFAnnotation *)self setIsSignature:1];
                      }
                    }
                    if ([v19 isEqualToString:@"/Tx"]) {
                      self->_suppressAppearanceStreamText = 1;
                    }
                    if (CGPDFDictionaryGetInteger(a3, "Ff", &v157)
                      || value && CGPDFDictionaryGetInteger(value, "Ff", &v157))
                    {
                      CGPDFInteger v105 = v157;
                    }
                    else
                    {
                      CGPDFInteger v105 = 0;
                    }
                    v106 = [NSNumber numberWithLong:v105];
                    [(PDFAnnotation *)self setValue:v106 forAnnotationKey:@"/Ff"];

                    uint64_t v107 = [(PDFAnnotation *)self _getFullFieldNameFromDictionary:a3];
                    if (v107) {
                      [(PDFAnnotation *)self setValue:v107 forAnnotationKey:@"/T"];
                    }
                    if (CGPDFDictionaryGetString(a3, "TU", &string)
                      || value && CGPDFDictionaryGetString(value, "TU", &string))
                    {
                      v108 = (__CFString *)CGPDFStringCopyTextString(string);
                      [(PDFAnnotation *)self setValue:v108 forAnnotationKey:@"/TU"];
                    }
                    if (CGPDFDictionaryGetName(a3, "V", (const char **)&v151)
                      || value && CGPDFDictionaryGetName(value, "V", (const char **)&v151))
                    {
                      uint64_t v109 = [NSString stringWithCString:v151 encoding:1];
                    }
                    else
                    {
                      if (!CGPDFDictionaryGetString(a3, "V", &string)
                        && (!value || !CGPDFDictionaryGetString(value, "V", &string)))
                      {
                        v111 = (void *)v107;
                        v110 = 0;
                        goto LABEL_213;
                      }
                      uint64_t v109 = (uint64_t)CGPDFStringCopyTextString(string);
                    }
                    v110 = (PDFAnnotation *)v109;
                    v111 = (void *)v107;
                    if (v109)
                    {
                      [(PDFAnnotation *)self setValue:v109 forAnnotationKey:@"/V"];
                      int v112 = 0;
                      goto LABEL_214;
                    }
LABEL_213:
                    int v112 = 1;
LABEL_214:
                    if ([v19 isEqualToString:@"/Btn"])
                    {
                      v113 = 0;
                      goto LABEL_225;
                    }
                    if (CGPDFDictionaryGetString(a3, "DV", &string)
                      || value && CGPDFDictionaryGetString(value, "DV", &string))
                    {
                      v113 = (__CFString *)CGPDFStringCopyTextString(string);
                      [(PDFAnnotation *)self setValue:v113 forAnnotationKey:@"/DV"];
                      if (!v112) {
                        goto LABEL_225;
                      }
                      [(PDFAnnotation *)self setValue:v113 forAnnotationKey:@"/V"];
                      v114 = v113;
                    }
                    else
                    {
                      if (v112)
                      {
                        v113 = 0;
                        v110 = 0;
                        goto LABEL_225;
                      }
                      [(PDFAnnotation *)self setValue:v110 forAnnotationKey:@"/DV"];
                      v114 = v110;
                    }
                    v113 = v114;
                    v110 = (PDFAnnotation *)v114;
LABEL_225:
                    v115 = v111;
                    if (CGPDFDictionaryGetInteger(a3, "MaxLen", &v157)
                      || value && CGPDFDictionaryGetInteger(value, "MaxLen", &v157))
                    {
                      v116 = [NSNumber numberWithInteger:v157];
                      [(PDFAnnotation *)self setValue:v116 forAnnotationKey:@"/MaxLen"];

                      if (v110)
                      {
                        unint64_t v117 = [(PDFAnnotation *)v110 length];
                        if (v117 > v157)
                        {
                          uint64_t v118 = -[PDFAnnotation substringToIndex:](v110, "substringToIndex:");

                          [(PDFAnnotation *)self setValue:v118 forAnnotationKey:@"/V"];
                          v110 = (PDFAnnotation *)v118;
                        }
                      }
                      if (v113)
                      {
                        unint64_t v119 = [(__CFString *)v113 length];
                        if (v119 > v157)
                        {
                          uint64_t v120 = -[__CFString substringToIndex:](v113, "substringToIndex:");

                          [(PDFAnnotation *)self setValue:v120 forAnnotationKey:@"/DV"];
                          v113 = (__CFString *)v120;
                        }
                      }
                    }
                    if (CGPDFDictionaryGetArray(a3, "Opt", &array)
                      || value && CGPDFDictionaryGetArray(value, "Opt", &array))
                    {
                      int v140 = v105;
                      v141 = v113;
                      id v121 = objc_alloc_init(MEMORY[0x263EFF980]);
                      size_t v122 = CGPDFArrayGetCount(array);
                      if (v122)
                      {
                        size_t v123 = v122;
                        size_t v124 = 0;
                        while (1)
                        {
                          *(double *)&CGPDFDictionaryRef v147 = 0.0;
                          if (CGPDFArrayGetString(array, v124, &string)) {
                            break;
                          }
                          if (!CGPDFArrayGetArray(array, v124, &v147))
                          {
                            NSLog(&cfstr_NoStringForOpt.isa);
                            goto LABEL_249;
                          }
                          if (CGPDFArrayGetCount(v147) != 2)
                          {
                            NSLog(&cfstr_IncorrectArray.isa);
                            goto LABEL_249;
                          }
                          v125 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF980]);
                          if (CGPDFArrayGetString(v147, 0, &string))
                          {
                            v126 = (__CFString *)CGPDFStringCopyTextString(string);
                            [(__CFString *)v125 addObject:v126];
                          }
                          else
                          {
                            NSLog(&cfstr_NoValueForArra.isa);
                          }
                          if (CGPDFArrayGetString(v147, 1uLL, &string))
                          {
                            v127 = (__CFString *)CGPDFStringCopyTextString(string);
                            [(__CFString *)v125 addObject:v127];
                          }
                          else
                          {
                            NSLog(&cfstr_NoTextForArray.isa);
                          }
                          uint64_t v19 = v146;
                          if ([(__CFString *)v125 count] == 2) {
                            goto LABEL_241;
                          }
LABEL_242:

LABEL_249:
                          if (v123 == ++v124) {
                            goto LABEL_257;
                          }
                        }
                        v125 = (__CFString *)CGPDFStringCopyTextString(string);
LABEL_241:
                        [v121 addObject:v125];
                        goto LABEL_242;
                      }
LABEL_257:
                      [(PDFAnnotation *)self setValue:v121 forAnnotationKey:@"/Opt"];

                      LODWORD(v105) = v140;
                      v113 = v141;
                    }
                    else if ([v19 isEqualToString:@"/Ch"])
                    {

                      a3 = 0;
LABEL_286:

                      id v21 = v144;
                      char v16 = v145;
                      long long v23 = v143;
                      goto LABEL_287;
                    }
                    if ([v19 isEqualToString:@"/Btn"])
                    {
                      if ((v105 & 0x8000) != 0)
                      {
                        uint64_t v128 = 1;
                      }
                      else if ((v105 & 0x10000) != 0)
                      {
                        [(PDFAnnotation *)self setButtonWidgetState:1];
                        uint64_t v128 = 0;
                      }
                      else
                      {
                        uint64_t v128 = 2;
                      }
                      [(PDFAnnotation *)self setWidgetControlType:v128];
                      if (CGPDFDictionaryGetName(a3, "AS", (const char **)&v151))
                      {
                        v129 = [NSString stringWithCString:v151 encoding:1];
                        v130 = [(PDFAnnotation *)self widgetOnStateString];
                        uint64_t v131 = [v129 caseInsensitiveCompare:@"Off"];
                        if ((([(PDFAnnotation *)v110 isEqualToString:v129] & 1) != 0
                           || [v130 isEqualToString:v129])
                          && v131)
                        {
                          [(PDFAnnotation *)self setButtonWidgetState:1];
                        }

                        uint64_t v19 = v146;
                      }
                    }
                    else if ([v19 isEqualToString:@"/Ch"])
                    {
                      uint64_t v128 = 4;
                    }
                    else if ([v19 isEqualToString:@"/Tx"])
                    {
                      uint64_t v128 = 3;
                    }
                    else
                    {
                      uint64_t v128 = -1;
                    }
                    if (CGPDFDictionaryGetDictionary(a3, "MK", &dict))
                    {
                      v132 = [PDFAppearanceCharacteristics alloc];
                      v133 = [(PDFAppearanceCharacteristics *)v132 initWithAnnotationDictionary:dict forControlType:v128];
                      v134 = v133;
                      if (v133)
                      {
                        v135 = [(PDFAppearanceCharacteristics *)v133 borderColor];

                        if (v135)
                        {
                          v136 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Border"];
                          if (!v136)
                          {
                            v136 = objc_alloc_init(PDFBorder);
                            [(PDFAnnotation *)self setValue:v136 forAnnotationKey:@"/Border"];
                          }
                        }
                      }
                      [(PDFAnnotation *)self setValue:v134 forAnnotationKey:@"/MK"];
                    }
LABEL_285:
                    [(PDFAnnotation *)self decodeUnknownAnnotationProperties];
                    v137 = self;
                    uint64_t v138 = [MEMORY[0x263F08C38] UUID];
                    pdfAnnotationUUID = v137->_pdfAnnotationUUID;
                    v137->_pdfAnnotationUUID = (NSUUID *)v138;

                    self->_BOOL isFullyConstructed = 1;
                    v110 = v137;
                    a3 = (CGPDFDictionary *)v110;
                    goto LABEL_286;
                  }
                  if (v23)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [(PDFAnnotation *)self setDestination:0];
                        [(PDFAnnotation *)self setAction:v23];
                      }
                      CGFloat v43 = 0;
                      goto LABEL_81;
                    }
                    double v42 = [v23 destination];
                  }
                  else
                  {
                    double v42 = [[PDFDestination alloc] initWithDictionary:a3 forDocument:v21];
                  }
                  CGFloat v43 = v42;
LABEL_81:
                  [(PDFAnnotation *)self setValue:v43 forAnnotationKey:@"/Dest"];

                  goto LABEL_82;
                }
                char v32 = [(PDFAnnotation *)self _PDFTextColorForColor:v31];
              }
              id v33 = v32;
              if (v32)
              {
                id v33 = v32;

                char v31 = v33;
              }
            }
            else
            {
              if (![(PDFAnnotation *)self isMarkupAnnotationSubtype]) {
                goto LABEL_54;
              }
              id v33 = +[PDFAnnotation PDFMarkupColors];
              char v31 = objc_msgSend(v33, "objectAtIndex:", -[PDFAnnotation markupStyle](self, "markupStyle"));
            }

            goto LABEL_53;
          }
          *(double *)&CGPDFDictionaryRef v147 = 0.0;
          if (CGPDFDictionaryGetDictionary(dict, "D", &v147))
          {
            long long v25 = +[PDFAction actionWithActionDictionary:v147 forDocument:v21 forPage:v6];
            if (v25)
            {
              long long v26 = v25;
              unint64_t v27 = [v25 type];

              if (v27) {
                [(PDFAnnotation *)self setValue:v26 forAnnotationKey:@"/AA"];
              }
              goto LABEL_36;
            }
          }
          else if (CGPDFDictionaryGetDictionary(dict, "U", &v147))
          {
            if (!v23)
            {
              uint64_t v28 = +[PDFAction actionWithActionDictionary:v147 forDocument:v21 forPage:v6];
              long long v23 = v28;
              if (v28)
              {
                long long v29 = [v28 type];

                if (v29) {
                  [(PDFAnnotation *)self setValue:v23 forAnnotationKey:@"/A"];
                }
              }
            }
          }
          else if (!CGPDFDictionaryGetDictionary(dict, "K", &v147) {
                 && !CGPDFDictionaryGetDictionary(dict, "F", &v147)
          }
                 && !CGPDFDictionaryGetDictionary(dict, "V", &v147))
          {
            CGPDFDictionaryGetDictionary(dict, "C", &v147);
          }
          long long v26 = 0;
LABEL_36:
          v142 = v26;
          goto LABEL_37;
        }
      }
    }
    a3 = 0;
  }
LABEL_13:

  return (PDFAnnotation *)a3;
}

- (PDFAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4
{
  CFDictionaryRef v5 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    double v7 = [(PDFAnnotation *)self initWithAnnotationDictionary:CGPDFAnnotationGetCGPDFDictionary() forPage:v6];

    self = v7;
    CFDictionaryRef v5 = self;
  }

  return v5;
}

- (void)decodeUnknownAnnotationProperties
{
  sourceDictionardouble y = self->_sourceDictionary;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PDFAnnotation_decodeUnknownAnnotationProperties__block_invoke;
  block[3] = &unk_264203B18;
  block[4] = self;
  CGPDFDictionaryApplyBlock(sourceDictionary, block, 0);
}

uint64_t __50__PDFAnnotation_decodeUnknownAnnotationProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFDictionaryRef v5 = [NSString stringWithUTF8String:a2];
  id v6 = +[PDFAnnotation getProperNameStringFromString:v5];

  if (v6)
  {
    double v7 = +[PDFAnnotation PDFKitAnnotationKeys];
    char v8 = [v7 containsObject:v6];

    if (a3)
    {
      if ((v8 & 1) == 0)
      {
        CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
        char v13 = 0;
        double v10 = [*(id *)(a1 + 32) valueForCGPDFObject:a3 visitedSet:Mutable isInternalObject:&v13];
        if (v10)
        {
          uint64_t v11 = 72;
          if (!v13) {
            uint64_t v11 = 56;
          }
          [*(id *)(*(void *)(a1 + 32) + v11) setObject:v10 forKey:v6];
        }
        CFRelease(Mutable);
      }
    }
  }

  return 1;
}

- (id)valueForCGPDFObject:(CGPDFObject *)a3 visitedSet:(__CFSet *)a4 isInternalObject:(BOOL *)a5
{
  id v5 = 0;
  if (a3 && a4)
  {
    if (CFSetContainsValue(a4, a3))
    {
      id v5 = 0;
      goto LABEL_13;
    }
    CFSetAddValue(a4, a3);
    char value = 0;
    double v35 = 0.0;
    uint64_t v36 = 0;
    CGPDFStringRef v33 = 0;
    uint64_t v34 = 0;
    CGPDFDictionaryRef v31 = 0;
    char v32 = 0;
    CGPDFStreamRef v30 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke;
    aBlock[3] = &__block_descriptor_40_e35___PDFAnnotationCGPDFObject_16__0_B8l;
    aBlock[4] = a3;
    double v10 = _Block_copy(aBlock);
    CGPDFObjectGetType(a3);
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeBoolean, &value))
    {
      uint64_t v11 = [NSNumber numberWithBool:value != 0];
LABEL_11:
      id v5 = (id)v11;
LABEL_12:

      goto LABEL_13;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeInteger, &v36))
    {
      uint64_t v11 = [NSNumber numberWithInteger:v36];
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeReal, &v35))
    {
      uint64_t v11 = [NSNumber numberWithDouble:v35];
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeName, &v34))
    {
      id v13 = [NSString alloc];
      id v14 = (void *)[v13 initWithUTF8String:v34];
      id v5 = +[PDFAnnotation getProperNameStringFromString:v14];

      goto LABEL_12;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeString, &v33))
    {
      uint64_t v11 = (uint64_t)CGPDFStringCopyTextString(v33);
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeStream, &v30))
    {
      Dictionardouble y = CGPDFStreamGetDictionary(v30);
      __s1 = 0;
      if (CGPDFDictionaryGetName(Dictionary, "Type", (const char **)&__s1) && !strncmp(__s1, "Data", 4uLL))
      {
        uint64_t v11 = (uint64_t)CGPDFStreamCopyData(v30, 0);
        goto LABEL_11;
      }
LABEL_31:
      uint64_t v11 = (*((void (**)(void *, BOOL *))v10 + 2))(v10, a5);
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeArray, &v32))
    {
      char v16 = [MEMORY[0x263EFF980] array];
      id v17 = v32;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_2;
      block[3] = &unk_264203B60;
      block[4] = self;
      unint64_t v27 = a4;
      id v18 = v16;
      id v26 = v18;
      CGPDFArrayApplyBlock(v17, block, 0);
      uint64_t v19 = v26;
    }
    else
    {
      if (!CGPDFObjectGetValue(a3, kCGPDFObjectTypeDictionary, &v31)) {
        goto LABEL_31;
      }
      __s1 = 0;
      if (CGPDFDictionaryGetName(v31, "Type", (const char **)&__s1) && !strncmp(__s1, "Annot", 5uLL))
      {
        id v5 = 0;
        goto LABEL_12;
      }
      uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
      id v21 = v31;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_3;
      v22[3] = &unk_264203B88;
      v22[4] = self;
      long long v24 = a4;
      id v18 = v20;
      id v23 = v18;
      CGPDFDictionaryApplyBlock(v21, v22, 0);
      uint64_t v19 = v23;
    }
    id v5 = v18;

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

PDFAnnotationCGPDFObject *__65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t CFObject = CGPDFAppenderCreateCFObject();
  if (CFObject)
  {
    BOOL v4 = (const void *)CFObject;
    id v5 = [[PDFAnnotationCGPDFObject alloc] initWithCFObject:CFObject];
    CFRelease(v4);
    *a2 = 1;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v7 = 0;
  BOOL v4 = [*(id *)(a1 + 32) valueForCGPDFObject:a3 visitedSet:*(void *)(a1 + 48) isInternalObject:&v7];
  if (v4)
  {
    if (v7)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
      if (!v5)
      {
        id v5 = [MEMORY[0x263EFF980] array];
        [*(id *)(*(void *)(a1 + 32) + 72) setObject:v5 forKey:*(void *)(a1 + 40)];
      }
      [v5 addObject:v4];
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v4];
    }
  }

  return 1;
}

uint64_t __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [NSString stringWithUTF8String:a2];
  id v6 = +[PDFAnnotation getProperNameStringFromString:v5];

  if (v6)
  {
    char v10 = 0;
    char v7 = [*(id *)(a1 + 32) valueForCGPDFObject:a3 visitedSet:*(void *)(a1 + 48) isInternalObject:&v10];
    if (v7)
    {
      if (v10)
      {
        char v8 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
        if (!v8)
        {
          char v8 = [MEMORY[0x263EFF9A0] dictionary];
          [*(id *)(*(void *)(a1 + 32) + 72) setObject:v8 forKey:*(void *)(a1 + 40)];
        }
        [v8 setObject:v7 forKey:v6];
      }
      else
      {
        [*(id *)(a1 + 40) setObject:v7 forKey:v6];
      }
    }
  }
  return 1;
}

- (id)_PDFMarkupColorForColor:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  PDFMarkupType v5 = [(PDFAnnotation *)self markupType];
  if (v5 == kPDFMarkupTypeUnderline)
  {
    char v16 = +[PDFAnnotation PDFMarkupColors];
    id v17 = [v16 objectAtIndex:5];
    BOOL v18 = PDFColorComponentsAreEqual(v4, v17);

    if (!v18) {
      goto LABEL_12;
    }
    id v13 = +[PDFAnnotation PDFMarkupColors];
    id v14 = v13;
    uint64_t v15 = 5;
  }
  else
  {
    PDFMarkupType v6 = v5;
    if (v5 != kPDFMarkupTypeStrikeOut)
    {
      if (v5 == kPDFMarkupTypeHighlight)
      {
        while (1)
        {
          char v7 = +[PDFAnnotation PDFMarkupColors];
          char v8 = [v7 objectAtIndex:v6];
          BOOL v9 = PDFColorComponentsAreEqual(v4, v8);

          if (v9) {
            break;
          }
          if (++v6 == 5) {
            goto LABEL_12;
          }
        }
        id v13 = +[PDFAnnotation PDFMarkupColors];
        id v14 = v13;
        uint64_t v15 = v6;
        goto LABEL_14;
      }
LABEL_12:
      uint64_t v19 = 0;
      goto LABEL_15;
    }
    char v10 = +[PDFAnnotation PDFMarkupColors];
    uint64_t v11 = [v10 objectAtIndex:6];
    BOOL v12 = PDFColorComponentsAreEqual(v4, v11);

    if (!v12) {
      goto LABEL_12;
    }
    id v13 = +[PDFAnnotation PDFMarkupColors];
    id v14 = v13;
    uint64_t v15 = 6;
  }
LABEL_14:
  uint64_t v19 = [v13 objectAtIndex:v15];

LABEL_15:

  return v19;
}

- (id)_PDFTextColorForColor:(id)a3
{
  id v3 = a3;
  if (v3
    && (+[PDFAnnotation PDFTextColors],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    unint64_t v6 = 0;
    while (1)
    {
      char v7 = +[PDFAnnotation PDFTextColors];
      char v8 = [v7 objectAtIndex:v6];
      BOOL v9 = PDFColorComponentsAreEqual(v3, v8);

      if (v9) {
        break;
      }
      ++v6;
      char v10 = +[PDFAnnotation PDFTextColors];
      unint64_t v11 = [v10 count];

      if (v6 >= v11) {
        goto LABEL_6;
      }
    }
    id v14 = +[PDFAnnotation PDFTextColors];
    BOOL v12 = [v14 objectAtIndex:v6];
  }
  else
  {
LABEL_6:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)pdfAnnotationUUID
{
  return self->_pdfAnnotationUUID;
}

- (void)setPDFAnnotationUUID:(id)a3
{
}

- (int64_t)priority
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v2 isEqualToString:@"/StrikeOut"])
  {
    int64_t v3 = 0;
  }
  else if ([v2 isEqualToString:@"/Underline"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"/Highlight"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"/Link"])
  {
    int64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"/Text"])
  {
    int64_t v3 = 4;
  }
  else
  {
    int64_t v3 = 5;
  }

  return v3;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_quadPointsPath)
  {
    quadPointsPath = self->_quadPointsPath;
    return CGPathContainsPoint(quadPointsPath, 0, a3, 0);
  }
  else
  {
    PDFRectToCGRect([(PDFAnnotation *)self bounds]);
    CGFloat v11 = x;
    CGFloat v12 = y;
    return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
  }
}

- (BOOL)shouldExport
{
  return self->_shouldExport;
}

- (void)setForExport:(BOOL)a3
{
  self->_shouldExport = a3;
}

- (BOOL)isMarkupAnnotation
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v3 = ([v2 isEqualToString:@"/Text"] & 1) != 0
    || ([v2 isEqualToString:@"/FreeText"] & 1) != 0
    || ([v2 isEqualToString:@"/Line"] & 1) != 0
    || ([v2 isEqualToString:@"/Square"] & 1) != 0
    || ([v2 isEqualToString:@"/Circle"] & 1) != 0
    || ([v2 isEqualToString:@"/Highlight"] & 1) != 0
    || ([v2 isEqualToString:@"/Underline"] & 1) != 0
    || ([v2 isEqualToString:@"/StrikeOut"] & 1) != 0
    || ([v2 isEqualToString:@"/Stamp"] & 1) != 0
    || [v2 isEqualToString:@"/Ink"];

  return v3;
}

- (id)mouseDownAction
{
  return [(PDFAnnotation *)self valueForAnnotationKey:@"/AA"];
}

- (void)setMouseDownAction:(id)a3
{
}

- (id)_getFullFieldNameFromDictionary:(CGPDFDictionary *)a3
{
  CGPDFDictionaryRef dict = 0;
  CGPDFStringRef value = 0;
  MutableCopCGFloat y = 0;
  if (CGPDFDictionaryGetString(a3, "T", &value))
  {
    CFStringRef v5 = CGPDFStringCopyTextString(value);
    if (v5)
    {
      CFStringRef v6 = v5;
      MutableCopCGFloat y = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v5);
      CFRelease(v6);
    }
    else
    {
      MutableCopCGFloat y = 0;
    }
  }
  if (!CGPDFDictionaryGetDictionary(a3, "Parent", &dict)) {
    goto LABEL_23;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  char v8 = dict;
  uint64_t v9 = 1;
  while (1)
  {
    unint64_t v10 = v9;
    if (!CGPDFDictionaryGetString(v8, "T", &value))
    {
      CGPDFDictionaryRef dict = 0;
      goto LABEL_23;
    }
    if (MutableCopy)
    {
      CFStringInsert(MutableCopy, 0, @".");
      CFStringRef v11 = CGPDFStringCopyTextString(value);
      if (!v11) {
        goto LABEL_14;
      }
      CFStringRef v12 = v11;
      CFStringInsert(MutableCopy, 0, v11);
      goto LABEL_13;
    }
    CFStringRef v13 = CGPDFStringCopyTextString(value);
    if (v13)
    {
      CFStringRef v12 = v13;
      MutableCopCGFloat y = CFStringCreateMutableCopy(v7, 0, v13);
LABEL_13:
      CFRelease(v12);
      goto LABEL_14;
    }
    MutableCopCGFloat y = 0;
LABEL_14:
    if (!CGPDFDictionaryGetDictionary(v8, "Parent", &dict)) {
      break;
    }
    char v8 = dict;
    if (dict)
    {
      uint64_t v9 = v10 + 1;
      if (v10 < 0x63) {
        continue;
      }
    }
    goto LABEL_21;
  }
  CGPDFDictionaryRef dict = 0;
LABEL_21:
  if (v10 >= 0x63) {
    NSLog(&cfstr_Getfullfieldna.isa);
  }
LABEL_23:
  if (MutableCopy)
  {
    id v14 = [MEMORY[0x263F089D8] stringWithString:MutableCopy];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)isWidgetOrMarkupAnnotation
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if (([v2 isEqualToString:@"/Highlight"] & 1) != 0
    || ([v2 isEqualToString:@"/StrikeOut"] & 1) != 0
    || ([v2 isEqualToString:@"/Underline"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:@"/Widget"];
  }

  return v3;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setHighlighted:(BOOL)highlighted
{
  self->_isHighlighted = highlighted;
  [(PDFAnnotation *)self updateAnnotationEffect];
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
  id v7 = a3;
  objc_storeWeak((id *)&self->_parent, v7);
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  int v5 = [v4 isEqualToString:@"/Popup"];

  if (v5)
  {
    CFStringRef v6 = [v7 color];
    [(PDFAnnotation *)self setColor:v6];
  }
}

- (BOOL)isMarkupAnnotationSubtype
{
  char v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v4 = ([v3 isEqualToString:@"/Highlight"] & 1) != 0
    || ([v3 isEqualToString:@"/StrikeOut"] & 1) != 0
    || ([v3 isEqualToString:@"/Underline"] & 1) != 0
    || [(PDFAnnotation *)self _isTextMarkupRedaction];

  return v4;
}

- (BOOL)isRedaction
{
  if ([(PDFAnnotation *)self _isTextMarkupRedaction])
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = [(PDFAKAnnotationAdaptor *)self->_akAnnotationAdaptor akAnnotation];
    AKRedactionRectAnnotationClass();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    CFStringRef v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
    LOBYTE(v4) = [v6 isEqualToString:@"/Redact"];

    char v3 = isKindOfClass | v4;
  }
  return v3 & 1;
}

- (BOOL)_isTextMarkupRedaction
{
  char v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v3 isEqualToString:@"/Redact"])
  {
    uint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/QuadPoints"];
    int v5 = v4;
    if (v4) {
      BOOL v6 = [v4 count] != 0;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isTransparent
{
  return self->_isTransparent;
}

- (void)setIsTransparent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PDFAnnotation *)self isRedaction])
  {
    self->_isTransparent = v3;
    akAnnotationAdaptor = self->_akAnnotationAdaptor;
    if (akAnnotationAdaptor)
    {
      id v6 = [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor akAnnotation];
      [v6 setIsOpaque:!v3];
    }
    else
    {
      [(PDFAnnotation *)self updateAnnotationEffect];
    }
  }
}

- (void)highlightRedaction:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PDFAnnotation *)self isRedaction])
  {
    akAnnotationAdaptor = self->_akAnnotationAdaptor;
    if (akAnnotationAdaptor)
    {
      id v6 = [(PDFAKAnnotationAdaptor *)akAnnotationAdaptor akAnnotation];
      [v6 setIsHighlighted:v3];
    }
    else
    {
      [(PDFAnnotation *)self updateAnnotationEffect];
    }
  }
}

- (BOOL)intersectsWithRedactionPath
{
  if ([(PDFAnnotation *)self isRedaction]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  int v5 = WeakRetained;
  if (self->_quadPointsPath)
  {
    char v6 = objc_msgSend(WeakRetained, "pathIntersectsWithRedactionPath:");
  }
  else
  {
    [(PDFAnnotation *)self bounds];
    char v6 = objc_msgSend(v5, "rectIntersectsWithRedactionPath:");
  }
  BOOL v3 = v6;

  return v3;
}

- (BOOL)isTextWidget
{
  BOOL v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  uint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  BOOL v5 = [v3 isEqualToString:@"/Widget"]
    && ([v4 isEqualToString:@"/Tx"] & 1) != 0;

  return v5;
}

- (BOOL)isSynthesizedFormField
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/AAPL:SFF"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isDetectedCheckbox
{
  return self->_isDetectedCheckbox;
}

- (void)setIsDetectedCheckbox:(BOOL)a3
{
  self->_isDetectedCheckboCGFloat x = a3;
}

- (BOOL)isDetectedSignature
{
  return self->_isDetectedSignature;
}

- (void)setIsDetectedSignature:(BOOL)a3
{
  self->_isDetectedSignature = a3;
}

- (BOOL)shouldReportAnalytics
{
  return self->_shouldReportAnalytics;
}

- (void)setShouldReportAnalytics:(BOOL)a3
{
  self->_shouldReportAnalytics = a3;
}

- (BOOL)isAutofillNewContextStart
{
  return self->_isAutofillNewContextStart;
}

- (void)setAutofillNewContextStart:(BOOL)a3
{
  self->_isAutofillNewContextStart = a3;
}

- (BOOL)isFormField
{
  if ([(PDFAnnotation *)self isTextWidget]) {
    return 1;
  }

  return [(PDFAnnotation *)self isSynthesizedFormField];
}

- (id)_accessibilityTypeString
{
  BOOL v3 = [(PDFAnnotation *)self type];
  uint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  int v5 = [v4 isEqualToString:@"/Widget"];

  if (v5)
  {
    char v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
    if ([v6 isEqualToString:@"/Tx"])
    {
      id v7 = @"Text ";
    }
    else if ([v6 isEqualToString:@"/Ch"])
    {
      id v7 = @"Choice ";
    }
    else
    {
      if (![v6 isEqualToString:@"/Btn"])
      {
LABEL_9:

        goto LABEL_10;
      }
      id v7 = @"Button ";
    }
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:v3];

    BOOL v3 = (void *)v8;
    goto LABEL_9;
  }
LABEL_10:

  return v3;
}

- (id)akAnnotation
{
  return [(PDFAKAnnotationAdaptor *)self->_akAnnotationAdaptor akAnnotation];
}

- (id)createAKAnnotation
{
  BOOL v3 = [(PDFAKAnnotationAdaptor *)self->_akAnnotationAdaptor akAnnotation];

  if (v3)
  {
    uint64_t v4 = [(PDFAKAnnotationAdaptor *)self->_akAnnotationAdaptor akAnnotation];
  }
  else if ([(PDFAnnotation *)self handledByPDFKitCheckAKEnabled:0])
  {
    uint64_t v4 = 0;
  }
  else
  {
    int v5 = +[PDFAKAnnotationAdaptor annotationAdaptorWithPDFAnnotation:self andCGPDFAnnotation:[(PDFAnnotation *)self CGPDFAnnotation] andPDFDictionary:[(PDFAnnotation *)self sourceDictionary] updatePDFAnnotationIfNeeded:0];
    uint64_t v4 = [v5 akAnnotation];
  }

  return v4;
}

- (id)getAKTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  uint64_t v4 = [WeakRetained document];

  int v5 = [v4 akController];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [v5 textEditorController];
    id v7 = [v6 annotation];
    uint64_t v8 = [(PDFAnnotation *)self akAnnotation];

    if (v7 == v8)
    {
      uint64_t v9 = [v6 textView];
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

+ (id)newPDFAnnotationFromAKAnnotation:(id)a3
{
  return +[PDFAKAnnotationAdaptor newPDFAnnotationFromAKAnnotation:a3];
}

+ (id)createWithPKDrawing:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  uint64_t v9 = -[PDFAnnotationPKDrawing initWithPKDrawing:bounds:]([PDFAnnotationPKDrawing alloc], "initWithPKDrawing:bounds:", v8, x, y, width, height);

  return v9;
}

- (void)addPageReferenceToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = [(PDFAnnotation *)self page];
  int v5 = v4;
  if (v4)
  {
    id v8 = v4;
    uint64_t v4 = [v4 document];
    int v5 = v8;
    if (v4)
    {
      char v6 = v4;
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"/#%ld", objc_msgSend(v4, "indexForPage:", v8) + 1);
      CFDictionarySetValue(a3, @"/P", v7);

      int v5 = v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (id)_createArrayForCGRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = [NSNumber numberWithDouble:CGRectGetMinX(a3)];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  id v8 = [NSNumber numberWithDouble:CGRectGetMinY(v14)];
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  uint64_t v9 = [NSNumber numberWithDouble:CGRectGetMaxX(v15)];
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  unint64_t v10 = [NSNumber numberWithDouble:CGRectGetMaxY(v16)];
  CFStringRef v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, v8, v9, v10, 0);

  return v11;
}

- (void)addRect:(CGRect)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5
{
  double x = PDFRectToCGRect(self);
  double y = v9;
  double width = v11;
  double height = v13;
  CGRect v15 = [(PDFAnnotation *)self page];
  BOOL v16 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
  if (!+[PDFDocument pdfDocumentAppendModeActiveForThisThread] == kCFCompareEqualTo)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v20.c = v17;
    *(_OWORD *)&v20.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v15 getDrawingTransformForBox:0];
    CGAffineTransform v19 = v20;
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    CGRect v22 = CGRectApplyAffineTransform(v21, &v19);
    double x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:v16];
  BOOL v18 = -[PDFAnnotation _createArrayForCGRect:](self, "_createArrayForCGRect:", x, y, width, height);
  CFDictionarySetValue(a5, a4, v18);
}

- (void)addFlagsToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4 = [(PDFAnnotation *)self flags];
  int v5 = (const void *)[NSNumber numberWithUnsignedInteger:v4];

  CFDictionarySetValue(a3, @"/F", v5);
}

- (void)addModificationDateToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/M"];
  if (v4) {
    CFDictionarySetValue(a3, @"/M", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addTextLabelToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/T"];
  if (v4) {
    CFDictionarySetValue(a3, @"/T", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addPopupToDictionaryRef:(__CFDictionary *)a3
{
  popup = self->_popup;
  if (popup)
  {
    int v5 = [(PDFAnnotation *)popup dictionaryRef];
    if (v5)
    {
      char v6 = v5;
      CFDictionarySetValue(v5, @"/Parent", a3);
      CFDictionarySetValue(a3, @"/Popup", v6);
    }
  }
}

- (id)_createArrayForColor:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (!v3) {
    goto LABEL_3;
  }
  id v5 = v3;
  if (CGColorGetAlpha((CGColorRef)[v5 CGColor]) == 0.0) {
    goto LABEL_3;
  }
  id v8 = (CGColor *)[v5 CGColor];
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v8);
  Components = CGColorGetComponents(v8);
  double v11 = (double *)Components;
  if (NumberOfComponents == 5)
  {
    id v12 = objc_alloc(MEMORY[0x263EFF8C0]);
    double v13 = [NSNumber numberWithDouble:*v11];
    CGRect v14 = [NSNumber numberWithDouble:v11[1]];
    CGRect v15 = [NSNumber numberWithDouble:v11[2]];
    BOOL v16 = [NSNumber numberWithDouble:v11[3]];
    id v6 = (id)objc_msgSend(v12, "initWithObjects:", v13, v14, v15, v16, 0);

LABEL_14:
    goto LABEL_15;
  }
  if (NumberOfComponents == 4)
  {
    id v17 = objc_alloc(MEMORY[0x263EFF8C0]);
    double v13 = [NSNumber numberWithDouble:*v11];
    CGRect v14 = [NSNumber numberWithDouble:v11[1]];
    CGRect v15 = [NSNumber numberWithDouble:v11[2]];
    id v6 = (id)objc_msgSend(v17, "initWithObjects:", v13, v14, v15, 0);
    goto LABEL_14;
  }
  if (NumberOfComponents != 2)
  {
LABEL_3:
    id v6 = 0;
    goto LABEL_4;
  }
  if (Components[1] == 0.0)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    goto LABEL_4;
  }
  id v18 = objc_alloc(MEMORY[0x263EFF8C0]);
  double v13 = [NSNumber numberWithDouble:*v11];
  id v6 = (id)objc_msgSend(v18, "initWithObjects:", v13, 0);
LABEL_15:

LABEL_4:

  return v6;
}

- (void)addColor:(id)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5
{
  id v7 = [(PDFAnnotation *)self _createArrayForColor:a3];
  if (v7) {
    CFDictionarySetValue(a5, a4, v7);
  }

  MEMORY[0x270F9A790]();
}

- (void)addNormalAppearanceToDictionaryRef:(__CFDictionary *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  [(PDFAnnotation *)self addAppearanceForKey:@"/N" toDictionaryRef:Mutable];
  CFDictionarySetValue(a3, @"/AP", Mutable);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)addAppearanceForKey:(__CFString *)a3 toDictionaryRef:(__CFDictionary *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  BOOL v7 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
  double x = PDFRectToCGRect([(PDFAnnotation *)self extendedBoundsForAction:1]);
  double y = v9;
  CGFloat width = v11;
  CGFloat height = v13;
  CGRect v15 = [(PDFAnnotation *)self page];
  BOOL v16 = v15;
  if (v15)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v25.c = v17;
    *(_OWORD *)&v25.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v15 getDrawingTransformForBox:0];
    CGAffineTransform v24 = v25;
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGRect v29 = CGRectApplyAffineTransform(v28, &v24);
    double x = v29.origin.x;
    double y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
  }
  *(_OWORD *)&v25.a = 0uLL;
  v25.c = width;
  v25.d = height;
  uint64_t v26 = *MEMORY[0x263F00300];
  id v18 = [MEMORY[0x263EFF8F8] dataWithBytes:&v25 length:32];
  v27[0] = v18;
  CGAffineTransform v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];

  uint64_t v20 = CGDisplayListCreateWithRect();
  if (v20)
  {
    CGRect v21 = (const void *)v20;
    CGDisplayListSetBoundingBox();
    CGRect v22 = (CGContext *)CGDisplayListContextCreate();
    if (!v22)
    {
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:v7];
      CGDisplayListRelease();
      goto LABEL_8;
    }
    id v23 = v22;
    CGContextTranslateCTM(v22, -x, -y);
    [(PDFAnnotation *)self drawWithBox:0 inContext:v23];
    CFDictionarySetValue(a4, a3, v21);
    CGContextRelease(v23);
    CGDisplayListRelease();
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:v7];
LABEL_8:
}

- (void)addBorderToDictionaryRef:(__CFDictionary *)a3
{
  id v17 = [(PDFAnnotation *)self border];
  if (!v17
    || ([v17 dashPattern],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    id v7 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v8 = NSNumber;
    [v17 horizontalCornerRadius];
    *(float *)&double v9 = v9;
    unint64_t v10 = [v8 numberWithFloat:v9];
    double v11 = NSNumber;
    [v17 verticalCornerRadius];
    *(float *)&double v12 = v12;
    double v13 = [v11 numberWithFloat:v12];
    CGRect v14 = NSNumber;
    [v17 lineWidth];
    *(float *)&double v15 = v15;
    BOOL v16 = [v14 numberWithFloat:v15];
    id v6 = objc_msgSend(v7, "initWithObjects:", v10, v13, v16, 0);

    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v6 = [v17 dashPattern];
  if (v6) {
LABEL_6:
  }
    CFDictionarySetValue(a3, @"/Border", v6);
LABEL_7:
}

- (void)addBorderStyleToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4 = [(PDFAnnotation *)self border];
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = (const void *)[v4 createDictionaryRef];
    unint64_t v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, @"/BS", v5);
      CFRelease(v5);
      unint64_t v4 = v6;
    }
  }
}

- (void)addContentsToDictionaryRef:(__CFDictionary *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  [(PDFAnnotation *)self noteBounds];
  if ((objc_msgSend(WeakRetained, "rectIntersectsWithRedactionPath:") & 1) == 0)
  {
    uint64_t v5 = [(PDFAnnotation *)self contents];
    id v6 = v5;
    if (v5 && [v5 length])
    {
      id v7 = (void *)[v6 mutableCopy];
      objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"/", @"//", 2, 0, 1);
      CFDictionarySetValue(a3, @"/Contents", v7);
    }
  }
}

- (void)addDefaultAppearanceDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v30 = xmmword_214422CD8;
  *(_OWORD *)CGPDFDictionaryRef v31 = unk_214422CE8;
  uint64_t v5 = [(PDFAnnotation *)self font];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 fontName];
    id v8 = NSString;
    [v6 pointSize];
    unint64_t v10 = objc_msgSend(v8, "stringWithFormat:", @"%.0f", round(v9));
    double v11 = [(PDFAnnotation *)self fontColor];
    double v12 = v11;
    if (v7)
    {
      if (v11)
      {
        PDFKitPlatformColorGetRGBA(v11, (uint64_t)&v30, (uint64_t)&v30 + 8, (uint64_t)v31, (uint64_t)&v31[1]);
        double v14 = *((double *)&v30 + 1);
        double v13 = *(double *)&v30;
        double v15 = v31[0];
      }
      else
      {
        double v15 = 0.0;
        double v14 = 0.0;
        double v13 = 0.0;
      }
      double v16 = v13 * 100.0;
      double v17 = round(v13 * 100.0);
      if (v13 == v14 && v13 == v15)
      {
        if (v17 == v16)
        {
          if (round(v13 * 10.0) == v13 * 10.0)
          {
            if (round(v13) == v13) {
              objc_msgSend(NSString, "stringWithFormat:", @"%.0f g", *(void *)&v13, v28, v29);
            }
            else {
              objc_msgSend(NSString, "stringWithFormat:", @"%.1f g", *(void *)&v13, v28, v29);
            }
          }
          else
          {
            [NSString stringWithFormat:@"%.2f g", *(void *)&v13, v28, v29];
          }
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%.3f g", *(void *)&v13, v28, v29);
        }
      }
      else
      {
        BOOL v19 = v17 == v16;
        double v18 = round(v14 * 100.0);
        BOOL v19 = v19 && v18 == v14 * 100.0;
        double v20 = round(v15 * 100.0);
        if (v19 && v20 == v15 * 100.0)
        {
          double v24 = round(v14 * 10.0);
          BOOL v25 = round(v13 * 10.0) == v13 * 10.0 && v24 == v14 * 10.0;
          double v26 = round(v15 * 10.0);
          if (v25 && v26 == v15 * 10.0)
          {
            if (round(v13) == v13 && round(v14) == v14 && round(v15) == v15) {
              objc_msgSend(NSString, "stringWithFormat:", @"%.0f %.0f %.0f rg", *(void *)&v13, *(void *)&v14, *(void *)&v15);
            }
            else {
              objc_msgSend(NSString, "stringWithFormat:", @"%.1f %.1f %.1f rg", *(void *)&v13, *(void *)&v14, *(void *)&v15);
            }
          }
          else
          {
            [NSString stringWithFormat:@"%.2f %.2f %.2f rg", *(void *)&v13, *(void *)&v14, *(void *)&v15];
          }
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%.3f %.3f %.3f rg", *(void *)&v13, *(void *)&v14, *(void *)&v15);
        }
      CGRect v22 = };
      id v23 = [NSString stringWithFormat:@"//%@ %@ Tf %@", v7, v10, v22];
      CFDictionarySetValue(a3, @"/DA", v23);
    }
  }
  else
  {
    unint64_t v10 = 0;
    double v12 = 0;
    id v7 = 0;
  }
}

- (void)addQuaddingToDictionaryRef:(__CFDictionary *)a3
{
  NSTextAlignment v4 = [(PDFAnnotation *)self alignment];
  if (v4)
  {
    if (v4 == NSTextAlignmentRight) {
      unsigned int v5 = 2;
    }
    else {
      unsigned int v5 = 0;
    }
    if (v4 == NSTextAlignmentCenter) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    id v7 = [NSNumber numberWithInt:v6];
    CFDictionarySetValue(a3, @"/Q", v7);
  }
}

- (void)addQuadPointsToDictionaryRef:(__CFDictionary *)a3
{
  unsigned int v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/QuadPoints"];
  BOOL v6 = +[PDFDocument pdfDocumentAppendModeActiveForThisThread];
  uint64_t v7 = [v5 count];
  if (v7) {
    BOOL v8 = (v7 & 3) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = v7;
    unint64_t v10 = [(PDFAnnotation *)self page];
    double v11 = v10;
    if (v10)
    {
      [v10 getDrawingTransformForBox:0];
      double v12 = v32;
      double v13 = v33;
      double v14 = v34;
      double v15 = v35;
      double v16 = v36;
      double v17 = v37;
    }
    else
    {
      double v12 = *MEMORY[0x263F000D0];
      double v13 = *(double *)(MEMORY[0x263F000D0] + 8);
      double v14 = *(double *)(MEMORY[0x263F000D0] + 16);
      double v15 = *(double *)(MEMORY[0x263F000D0] + 24);
      double v16 = *(double *)(MEMORY[0x263F000D0] + 32);
      double v17 = *(double *)(MEMORY[0x263F000D0] + 40);
    }
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v19 = 0;
    do
    {
      double v20 = [v5 objectAtIndex:v19];
      [v20 PDFKitPDFPointValue];
      double v22 = v21;
      double v24 = v23;

      if (!v6)
      {
        double v26 = PDFPointToCGPoint(v22, v24);
        double v25 = PDFPointFromCGPoint(v16 + v14 * v27 + v12 * v26, v17 + v15 * v27 + v13 * v26);
        double v22 = v25;
        double v24 = v28;
      }
      *(float *)&double v25 = v22;
      uint64_t v29 = [NSNumber numberWithFloat:v25];
      [v18 addObject:v29];

      *(float *)&double v30 = v24;
      CGPDFDictionaryRef v31 = [NSNumber numberWithFloat:v30];
      [v18 addObject:v31];

      ++v19;
    }
    while (v9 != v19);
    CFDictionarySetValue(a3, @"/QuadPoints", v18);
  }
}

- (void)addActionToDictionaryRef:(__CFDictionary *)a3
{
  NSTextAlignment v4 = [(PDFAnnotation *)self action];
  if (v4)
  {
    id v6 = v4;
    unsigned int v5 = (const void *)[v4 createDictionaryRef];
    NSTextAlignment v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, @"/A", v5);
      CFRelease(v5);
      NSTextAlignment v4 = v6;
    }
  }
}

- (void)addAdditionalActionsToDictionaryRef:(__CFDictionary *)a3
{
  NSTextAlignment v4 = [(PDFAnnotation *)self mouseDownAction];
  unsigned int v5 = v4;
  if (v4)
  {
    values = (void *)[v4 createDictionaryRef];
    if (values)
    {
      uint64_t v9 = @"/D";
      CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&v9, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        CFDictionarySetValue(a3, @"/AA", v6);
        CFRelease(v7);
        BOOL v8 = values;
        if (!values) {
          goto LABEL_8;
        }
      }
      else
      {
        BOOL v8 = values;
      }
      CFRelease(v8);
    }
  }
LABEL_8:
}

- (void)addLineToDictionaryRef:(__CFDictionary *)a3
{
  BOOL v5 = +[PDFDocument pdfDocumentAppendModeActiveForThisThread];
  CFDictionaryRef v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/L"];
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 objectAtIndex:0];
    [v8 doubleValue];
    double v10 = v9;
    double v11 = [v7 objectAtIndex:1];
    [v11 doubleValue];
    double v13 = PDFPointMake(v10, v12);
    double v15 = v14;

    double v16 = [v7 objectAtIndex:2];
    [v16 doubleValue];
    double v18 = v17;
    uint64_t v19 = [v7 objectAtIndex:3];
    [v19 doubleValue];
    double v46 = PDFPointMake(v18, v20);
    double v47 = v21;

    double v22 = [(PDFAnnotation *)self page];
    double v23 = v22;
    if (v22)
    {
      [v22 getDrawingTransformForBox:0];
      double v24 = v48;
      double v45 = v49;
      double v26 = v50;
      double v25 = v51;
      double v28 = v52;
      double v27 = v53;
    }
    else
    {
      double v24 = *MEMORY[0x263F000D0];
      double v45 = *(double *)(MEMORY[0x263F000D0] + 8);
      double v26 = *(double *)(MEMORY[0x263F000D0] + 16);
      double v25 = *(double *)(MEMORY[0x263F000D0] + 24);
      double v28 = *(double *)(MEMORY[0x263F000D0] + 32);
      double v27 = *(double *)(MEMORY[0x263F000D0] + 40);
    }
    double v29 = PDFPointToCGPoint(v13, v15);
    double v31 = v29;
    double v32 = v30;
    if (v5)
    {
      double v33 = PDFPointToCGPoint(v46, v47);
      double v35 = v34;
      double v36 = v31;
    }
    else
    {
      double v36 = v28 + v26 * v30 + v24 * v29;
      double v32 = v27 + v25 * v30 + v45 * v29;
      double v37 = PDFPointToCGPoint(v46, v47);
      double v33 = v28 + v26 * v38 + v24 * v37;
      double v35 = v27 + v25 * v38 + v45 * v37;
    }
    id v39 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v40 = [NSNumber numberWithDouble:v36];
    char v41 = [NSNumber numberWithDouble:v32];
    double v42 = [NSNumber numberWithDouble:v33];
    CGFloat v43 = [NSNumber numberWithDouble:v35];
    double v44 = objc_msgSend(v39, "initWithObjects:", v40, v41, v42, v43, 0);

    CFDictionarySetValue(a3, @"/L", v44);
  }
}

- (void)addLineEndingStylesToDictionaryRef:(__CFDictionary *)a3
{
  id v7 = +[PDFAnnotation nameForLineStyle:[(PDFAnnotation *)self startLineStyle]];
  BOOL v5 = +[PDFAnnotation nameForLineStyle:[(PDFAnnotation *)self endLineStyle]];
  CFDictionaryRef v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, v5, 0);
  CFDictionarySetValue(a3, @"/LE", v6);
}

- (void)addNameToDictionaryRef:(__CFDictionary *)a3
{
  id v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Name"];
  if (v5)
  {
    if ([v7 isEqualToString:@"/Stamp"])
    {
      if ([v5 isEqualToString:@"Draft"]) {
        goto LABEL_7;
      }
    }
    else if (![v7 isEqualToString:@"/Text"])
    {
      goto LABEL_7;
    }
    CFDictionaryRef v6 = +[PDFAnnotation getProperNameStringFromString:v5];

    CFDictionarySetValue(a3, @"/Name", v6);
    BOOL v5 = (void *)v6;
  }
LABEL_7:
}

- (void)addOpenToDictionaryRef:(__CFDictionary *)a3
{
  id v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v6 isEqualToString:@"/Popup"])
  {
    if (![(PDFAnnotation *)self isOpen]) {
      goto LABEL_8;
    }
LABEL_7:
    CFDictionarySetValue(a3, @"/Open", (const void *)*MEMORY[0x263EFFB40]);
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"/Text"])
  {
    popup = self->_popup;
    if (popup)
    {
      if ([(PDFAnnotation *)popup isOpen]) {
        goto LABEL_7;
      }
    }
  }
LABEL_8:
}

- (void)addHighlightingModeToDictionaryRef:(__CFDictionary *)a3
{
  NSTextAlignment v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/H"];
  if (v4)
  {
    CGPDFStringRef value = v4;
    if (([v4 isEqualToString:@"/I"] & 1) == 0) {
      CFDictionarySetValue(a3, @"/H", value);
    }
  }

  MEMORY[0x270F9A828]();
}

- (BOOL)addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  NSTextAlignment v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Dest"];
  BOOL v5 = v4;
  if (v4 && (id v6 = (const void *)[v4 createArrayRef]) != 0)
  {
    id v7 = v6;
    CFDictionarySetValue(a3, @"/Dest", v6);
    CFRelease(v7);
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)addInkListToDictionaryRef:(__CFDictionary *)a3
{
  id v26 = [(PDFAnnotation *)self valueForAnnotationKey:@"/InkList"];
  CFIndex v4 = [v26 count];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, MEMORY[0x263EFFF70]);
  [(PDFAnnotation *)self bounds];
  if (v4 >= 1)
  {
    double v10 = v6;
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    uint64_t v14 = 0;
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      id v19 = [v26 objectAtIndex:v14];
      double v20 = (const CGPath *)[v19 CGPath];
      double v21 = [MEMORY[0x263EFF9A0] dictionary];
      double v22 = [MEMORY[0x263EFF980] array];
      double v23 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v10, v11, v12, v13);
      [v21 setObject:v23 forKey:@"bounds"];

      double v24 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v15, v16, v17, v18);
      [v21 setObject:v24 forKey:@"firstPoint"];

      [v21 setObject:&unk_26C52E190 forKey:@"elementCount"];
      [v21 setObject:v22 forKey:@"pathArray"];
      CGPathApply(v20, v21, (CGPathApplierFunction)PDFAnnotationCGPathApplierFunc);
      CFArrayAppendValue(Mutable, v22);

      ++v14;
    }
    while (v4 != v14);
  }
  CFDictionarySetValue(a3, @"/InkList", Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (void)addNormalAndDownAppearanceToDictionaryRef:(__CFDictionary *)a3
{
  id v8 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v8 isEqualToString:@"/Widget"])
  {
    if ([v5 isEqualToString:@"/Btn"])
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      BOOL v7 = [(PDFAnnotation *)self isHighlighted];
      [(PDFAnnotation *)self setHighlighted:0];
      [(PDFAnnotation *)self addAppearanceForKey:@"/N" toDictionaryRef:Mutable];
      [(PDFAnnotation *)self setHighlighted:1];
      [(PDFAnnotation *)self addAppearanceForKey:@"/D" toDictionaryRef:Mutable];
      CFDictionarySetValue(a3, @"/AP", Mutable);
      [(PDFAnnotation *)self setHighlighted:v7];
      CFDictionarySetValue(a3, @"/H", @"/P");
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
}

- (void)addNormalAppearanceWithStateToDictionaryRef:(__CFDictionary *)a3
{
  id v16 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if (![v16 isEqualToString:@"/Widget"]
    || ![v5 isEqualToString:@"/Btn"])
  {
    goto LABEL_11;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  BOOL v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  id v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v10 = CFDictionaryCreateMutable(v6, 0, v7, v8);
  double v11 = [(PDFAnnotation *)self widgetOnStateString];
  if (v11)
  {
    PDFWidgetCellState v12 = [(PDFAnnotation *)self buttonWidgetState];
    BOOL v13 = [(PDFAnnotation *)self isHighlighted];
    [(PDFAnnotation *)self setHighlighted:0];
    [(PDFAnnotation *)self setButtonWidgetState:1];
    uint64_t v14 = [NSString stringWithFormat:@"/%@", v11];
    [(PDFAnnotation *)self addAppearanceForKey:v14 toDictionaryRef:v10];

    [(PDFAnnotation *)self setButtonWidgetState:0];
    [(PDFAnnotation *)self addAppearanceForKey:@"/Off" toDictionaryRef:v10];
    [(PDFAnnotation *)self setButtonWidgetState:v12];
    [(PDFAnnotation *)self setHighlighted:v13];
    CFDictionarySetValue(Mutable, @"/N", v10);
    CFDictionarySetValue(a3, @"/AP", Mutable);
    if ([(PDFAnnotation *)self buttonWidgetState] != kPDFWidgetOnState)
    {
      CFDictionarySetValue(a3, @"/AS", @"/Off");
      if (!v10) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    double v15 = [NSString stringWithFormat:@"/%@", v11];
    CFDictionarySetValue(a3, @"/AS", v15);
  }
  if (v10) {
LABEL_7:
  }
    CFRelease(v10);
LABEL_8:
  if (Mutable) {
    CFRelease(Mutable);
  }

LABEL_11:
}

- (void)addNormalAndDownAppearanceWithStateToDictionaryRef:(__CFDictionary *)a3
{
  id v18 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v18 isEqualToString:@"/Widget"]
    && [v5 isEqualToString:@"/Btn"])
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    BOOL v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    id v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFMutableDictionaryRef v10 = CFDictionaryCreateMutable(v6, 0, v7, v8);
    CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(v6, 0, v7, v8);
    PDFWidgetCellState v12 = [(PDFAnnotation *)self widgetOnStateString];
    if (v12)
    {
      PDFWidgetCellState v17 = [(PDFAnnotation *)self buttonWidgetState];
      BOOL v16 = [(PDFAnnotation *)self isHighlighted];
      [(PDFAnnotation *)self setHighlighted:0];
      [(PDFAnnotation *)self setButtonWidgetState:1];
      BOOL v13 = [NSString stringWithFormat:@"/%@", v12];
      [(PDFAnnotation *)self addAppearanceForKey:v13 toDictionaryRef:v10];

      [(PDFAnnotation *)self setHighlighted:0];
      [(PDFAnnotation *)self setButtonWidgetState:0];
      [(PDFAnnotation *)self addAppearanceForKey:@"/Off" toDictionaryRef:v10];
      [(PDFAnnotation *)self setHighlighted:1];
      [(PDFAnnotation *)self setButtonWidgetState:1];
      uint64_t v14 = [NSString stringWithFormat:@"/%@", v12];
      [(PDFAnnotation *)self addAppearanceForKey:v14 toDictionaryRef:v11];

      [(PDFAnnotation *)self setHighlighted:1];
      [(PDFAnnotation *)self setButtonWidgetState:0];
      [(PDFAnnotation *)self addAppearanceForKey:@"/Off" toDictionaryRef:v11];
      [(PDFAnnotation *)self setButtonWidgetState:v17];
      [(PDFAnnotation *)self setHighlighted:v16];
      CFDictionarySetValue(Mutable, @"/N", v10);
      CFDictionarySetValue(Mutable, @"/D", v11);
      CFDictionarySetValue(a3, @"/AP", Mutable);
      if ([(PDFAnnotation *)self buttonWidgetState] == kPDFWidgetOnState)
      {
        double v15 = [NSString stringWithFormat:@"/%@", v12];
        CFDictionarySetValue(a3, @"/AS", v15);
      }
      else
      {
        CFDictionarySetValue(a3, @"/AS", @"/Off");
      }
      CFDictionarySetValue(a3, @"/H", @"/P");
    }
    if (v11) {
      CFRelease(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
}

- (void)addAppearanceCharacteristicsToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MK"];
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = (const void *)[v4 createDictionaryRef];
    CFIndex v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, @"/MK", v5);
      CFRelease(v5);
      CFIndex v4 = v6;
    }
  }
}

- (void)addFieldTypeToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if (v4) {
    CFDictionarySetValue(a3, @"/FT", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addFieldValueToDictionaryRef:(__CFDictionary *)a3
{
  id v9 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  id v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
  if ([v9 isEqualToString:@"/Widget"]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if ([v5 isEqualToString:@"/Btn"])
    {
      uint64_t v8 = [@"/" stringByAppendingString:v6];

      id v6 = (void *)v8;
    }
    CFDictionarySetValue(a3, @"/V", v6);
  }
}

- (void)addDefaultFieldValueToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/DV"];
  if (v4) {
    CFDictionarySetValue(a3, @"/DV", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addFieldNameToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/T"];
  if (v4) {
    CFDictionarySetValue(a3, @"/T", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addAlternateFieldNameToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/TU"];
  if (v4) {
    CFDictionarySetValue(a3, @"/TU", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addFieldFlagsToDictionaryRef:(__CFDictionary *)a3
{
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v5 isEqualToString:@"/Widget"])
  {
    id v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Ff"];
    int v7 = [v6 integerValue];

    int valuePtr = v7;
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    if (v8)
    {
      CFNumberRef v9 = v8;
      CFDictionarySetValue(a3, @"/Ff", v8);
      CFRelease(v9);
    }
  }
}

- (void)addMaxLenToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MaxLen"];
  int v5 = [v4 integerValue];

  int valuePtr = v5;
  if (v5)
  {
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      CFDictionarySetValue(a3, @"/MaxLen", v6);
      CFRelease(v7);
    }
  }
}

- (void)addOptionsToDictionaryRef:(__CFDictionary *)a3
{
  id v14 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  int v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v14 isEqualToString:@"/Widget"]
    && [v5 isEqualToString:@"/Ch"])
  {
    CFNumberRef v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Opt"];
    CFNumberRef v7 = v6;
    if (v6)
    {
      CFIndex v8 = [v6 count];
      if ([v7 count])
      {
        CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, MEMORY[0x263EFFF70]);
        if (v8 >= 1)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            PDFWidgetCellState v12 = [v7 objectAtIndex:i];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              CFArrayAppendValue(Mutable, v12);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                BOOL v13 = CFArrayCreateMutable(v9, 2, MEMORY[0x263EFFF70]);
                CFArrayAppendValue(v13, (const void *)[v12 objectAtIndex:0]);
                CFArrayAppendValue(v13, (const void *)[v12 objectAtIndex:1]);
                CFArrayAppendValue(Mutable, v13);
                if (v13) {
                  CFRelease(v13);
                }
              }
            }
          }
        }
        CFDictionarySetValue(a3, @"/Opt", Mutable);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
    }
  }
}

- (void)_sanitizeValue:(id)a3 forKey:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    if (strcmp((const char *)[v8 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    {
LABEL_4:
      CFMutableDictionaryRef Mutable = 0;
      goto LABEL_9;
    }
    -[PDFAnnotation _createArrayForCGRect:](self, "_createArrayForCGRect:", PDFRectToCGRect([v8 PDFKitPDFRectValue]));
    CFMutableDictionaryRef v11 = (__CFArray *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    CFMutableDictionaryRef Mutable = v11;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (unint64_t v10 = 0x263F08000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_7:
    CFMutableDictionaryRef v11 = (__CFArray *)v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v6;
    id v14 = v6;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v66 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = [(PDFAnnotation *)self _sanitizeValue:*(void *)(*((void *)&v65 + 1) + 8 * i) forKey:v7];
          if (v20)
          {
            double v21 = v20;
            CFArrayAppendValue(Mutable, v20);
            CFRelease(v21);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v17);
    }

    double v22 = [(NSMutableDictionary *)self->_internalPDFAnnotationDictionary objectForKey:v15];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(v22);
          }
          CFArrayAppendValue(Mutable, *(const void **)(*(void *)(*((void *)&v61 + 1) + 8 * j) + 8));
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v24);
    }
    if (CFArrayGetCount(Mutable) <= 0)
    {
      NSLog(&cfstr_ErrorCouldNotC.isa, v7);
      CFMutableDictionaryRef Mutable = 0;
    }

    id v6 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v51 = v6;
      double v52 = self;
      id v27 = v6;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v58;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v58 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v57 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v34 = v7;
              unint64_t v35 = v10;
              double v36 = +[PDFAnnotation getProperNameStringFromString:v33];
              id v37 = v28;
              double v38 = [v28 objectForKey:v33];
              id v39 = [(PDFAnnotation *)v52 _sanitizeValue:v38 forKey:v33];
              if (v39)
              {
                uint64_t v40 = v39;
                CFDictionarySetValue(Mutable, v36, v39);
                CFRelease(v40);
              }

              unint64_t v10 = v35;
              id v7 = v34;
              id v28 = v37;
            }
            else
            {
              NSLog(&cfstr_ErrorAttemptin.isa, v33);
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v57 objects:v70 count:16];
        }
        while (v30);
      }

      char v41 = [(NSMutableDictionary *)v52->_internalPDFAnnotationDictionary objectForKey:v28];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v54;
        do
        {
          for (uint64_t m = 0; m != v43; ++m)
          {
            if (*(void *)v54 != v44) {
              objc_enumerationMutation(v41);
            }
            double v46 = *(const void **)(*((void *)&v53 + 1) + 8 * m);
            uint64_t v47 = [v41 objectForKey:v46];
            double v48 = (void *)v47;
            if (v47) {
              CFDictionarySetValue(Mutable, v46, *(const void **)(v47 + 8));
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v53 objects:v69 count:16];
        }
        while (v43);
      }
      if (!CFDictionaryGetCount(Mutable))
      {
        NSLog(&cfstr_ErrorCouldNotC_0.isa, v7);
        CFMutableDictionaryRef Mutable = 0;
      }

      id v6 = v51;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_4;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              CFMutableDictionaryRef v11 = (__CFArray *)[v6 createArrayRef];
              goto LABEL_8;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSLog(&cfstr_ErrorCannotSav.isa, v7);
              goto LABEL_4;
            }
          }
        }
        CFMutableDictionaryRef v11 = (__CFArray *)[v6 createDictionaryRef];
        goto LABEL_8;
      }
      double v49 = [(PDFAnnotation *)self _createArrayForColor:v6];
      CFMutableDictionaryRef Mutable = v49;
      if (v49) {
        double v50 = v49;
      }
    }
  }
LABEL_9:

  return Mutable;
}

- (void)_addUnknownPropertiesToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v5 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary allKeys];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = +[PDFAnnotation PDFKitAnnotationKeys];
  [v6 addObjectsFromArray:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(const void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v6 containsObject:v13] & 1) == 0)
        {
          id v14 = [(NSMutableDictionary *)self->_PDFAnnotationDictionary objectForKey:v13];
          id v15 = [(PDFAnnotation *)self _sanitizeValue:v14 forKey:v13];
          if (v15)
          {
            uint64_t v16 = v15;
            CFDictionarySetValue(a3, v13, v15);
            CFRelease(v16);
          }
          else
          {
            NSLog(&cfstr_ErrorCannotSav.isa, v13);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if (+[PDFDocument pdfDocumentAppendModeActiveForThisThread])
  {
    internalPDFAnnotationDictionardouble y = self->_internalPDFAnnotationDictionary;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__PDFAnnotation__addUnknownPropertiesToDictionaryRef___block_invoke;
    v18[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v18[4] = a3;
    [(NSMutableDictionary *)internalPDFAnnotationDictionary enumerateKeysAndObjectsUsingBlock:v18];
  }
}

void __54__PDFAnnotation__addUnknownPropertiesToDictionaryRef___block_invoke(uint64_t a1, void *a2, void *a3)
{
  kedouble y = a2;
  int v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), key, v5[1]);
    }
  }
}

- (id)createDefaultAppearanceStringWithFont:(id)a3 fontColor:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v30 = xmmword_214422CD8;
  *(_OWORD *)uint64_t v31 = unk_214422CE8;
  if (a3)
  {
    id v6 = a3;
    id v7 = [v6 fontName];
    id v8 = NSString;
    [v6 pointSize];
    double v10 = v9;

    uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", @"%.0f", round(v10));
    if (v7)
    {
      if (v5)
      {
        PDFKitPlatformColorGetRGBA(v5, (uint64_t)&v30, (uint64_t)&v30 + 8, (uint64_t)v31, (uint64_t)&v31[1]);
        double v13 = *((double *)&v30 + 1);
        double v12 = *(double *)&v30;
        double v14 = v31[0];
      }
      else
      {
        double v14 = 0.0;
        double v13 = 0.0;
        double v12 = 0.0;
      }
      double v17 = v12 * 100.0;
      double v18 = round(v12 * 100.0);
      if (v12 == v13 && v12 == v14)
      {
        if (v18 == v17)
        {
          if (round(v12 * 10.0) == v12 * 10.0)
          {
            if (round(v12) == v12) {
              objc_msgSend(NSString, "stringWithFormat:", @"%.0f g", *(void *)&v12, v28, v29);
            }
            else {
              objc_msgSend(NSString, "stringWithFormat:", @"%.1f g", *(void *)&v12, v28, v29);
            }
          }
          else
          {
            [NSString stringWithFormat:@"%.2f g", *(void *)&v12, v28, v29];
          }
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%.3f g", *(void *)&v12, v28, v29);
        }
      }
      else
      {
        BOOL v20 = v18 == v17;
        double v19 = round(v13 * 100.0);
        BOOL v20 = v20 && v19 == v13 * 100.0;
        double v21 = round(v14 * 100.0);
        if (v20 && v21 == v14 * 100.0)
        {
          double v24 = round(v13 * 10.0);
          BOOL v25 = round(v12 * 10.0) == v12 * 10.0 && v24 == v13 * 10.0;
          double v26 = round(v14 * 10.0);
          if (v25 && v26 == v14 * 10.0)
          {
            if (round(v12) == v12 && round(v13) == v13 && round(v14) == v14) {
              objc_msgSend(NSString, "stringWithFormat:", @"%.0f %.0f %.0f rg", *(void *)&v12, *(void *)&v13, *(void *)&v14);
            }
            else {
              objc_msgSend(NSString, "stringWithFormat:", @"%.1f %.1f %.1f rg", *(void *)&v12, *(void *)&v13, *(void *)&v14);
            }
          }
          else
          {
            [NSString stringWithFormat:@"%.2f %.2f %.2f rg", *(void *)&v12, *(void *)&v13, *(void *)&v14];
          }
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%.3f %.3f %.3f rg", *(void *)&v12, *(void *)&v13, *(void *)&v14);
        }
      uint64_t v16 = };
      id v15 = [NSString stringWithFormat:@"/%@ %@ Tf %@", v7, v11, v16];
    }
    else
    {
      uint64_t v16 = 0;
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (unint64_t)flags
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/F"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

- (CGPDFDictionary)sourceDictionary
{
  return self->_sourceDictionary;
}

- (CGPDFDictionary)popupDictionary
{
  return self->_popupDictionary;
}

- (void)setPDFAnnotationDictionary:(id)a3
{
  id v8 = a3;
  PDFAnnotationDictionardouble y = self->_PDFAnnotationDictionary;
  self = (PDFAnnotation *)((char *)self + 56);
  id v6 = PDFAnnotationDictionary;
  objc_storeStrong((id *)&self->super.isa, a3);
  CGFloat x = self->_endPoint.x;
  if (x != 0.0) {
    [*(id *)&x didReplaceAllValuesWithNewDictionary:v8 andOldDictionary:v6];
  }
}

- (id)widgetOnStateString
{
  return self->_widgetOnStateString;
}

- (void)setWidgetOnStateString:(id)a3
{
}

- (BOOL)popupDrawsCloseWidget
{
  return self->_popupDrawCloseWidget;
}

- (void)setPopupDrawsCloseWidget:(BOOL)a3
{
  self->_popupDrawCloseWidget = a3;
}

- (BOOL)popupDrawsText
{
  return self->_popupDrawText;
}

- (void)setPopupDrawsText:(BOOL)a3
{
  self->_popupDrawText = a3;
}

- (CGPath)cgPathArray
{
  return self->_cgPaths;
}

- (void)setCGPathArray:(CGPath *)a3
{
  self->_cgPaths = a3;
}

- (void)releaseCGPathArray
{
  if (self->_cgPaths)
  {
    id v3 = [(PDFAnnotation *)self paths];
    uint64_t v4 = [v3 count];

    if (v4 >= 1)
    {
      for (uint64_t i = 0; i != v4; ++i)
        CGPathRelease(self->_cgPaths[i]);
    }
    NSZoneReallyFree();
    self->_cgPaths = 0;
  }
}

- (id)pathLock
{
  return self->_pathLock;
}

- (id)replaceTextWidgetWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  id v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v5 isEqualToString:@"/Widget"]
    && [v6 isEqualToString:@"/Tx"]
    && (unint64_t v7 = [(PDFAnnotation *)self maximumLength]) != 0
    && (unint64_t v8 = v7, [v4 length] > v7))
  {
    double v9 = [v4 substringToIndex:v8];
    double v10 = v9;
    if (v9 && [v9 length] <= v8) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = &stru_26C516768;
    }
  }
  else
  {
    uint64_t v11 = (__CFString *)v4;
  }

  return v11;
}

- (CGPDFForm)appearance:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return (CGPDFForm *)*((void *)&self->_normalAppearance + a3);
  }
}

- (void)setSavesAppearanceStream:(BOOL)a3
{
  self->_saveAppearance = a3;
}

- (BOOL)savesAppearanceStream
{
  return self->_saveAppearance;
}

- (void)setAppearance:(CGPDFForm *)a3 forType:(int)a4
{
  switch(a4)
  {
    case 0:
      p_normalAppearance = &self->_normalAppearance;
      if (self->_normalAppearance) {
        goto LABEL_13;
      }
      goto LABEL_14;
    case 1:
      p_normalAppearance = &self->_rolloverAppearance;
      if (!self->_rolloverAppearance) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 2:
      p_normalAppearance = &self->_downAppearance;
      if (!self->_downAppearance) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 3:
      p_normalAppearance = &self->_normalOffAppearance;
      if (!self->_normalOffAppearance) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 4:
      p_normalAppearance = &self->_rolloverOffAppearance;
      if (!self->_rolloverOffAppearance) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 5:
      p_normalAppearance = &self->_downOffAppearance;
      if (self->_downOffAppearance) {
LABEL_13:
      }
        CGPDFFormRelease();
LABEL_14:
      *p_normalAppearance = a3;
      break;
    default:
      return;
  }
}

- (CGDisplayList)cachedAppearance:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_cachedAppearancesLocuint64_t k = &self->_cachedAppearancesLock;
  os_unfair_lock_lock(&self->_cachedAppearancesLock);
  cachedAppearances = self->_cachedAppearances;
  unint64_t v7 = [NSNumber numberWithInt:v3];
  unint64_t v8 = [(NSMutableDictionary *)cachedAppearances objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_cachedAppearancesLock);
  return v8;
}

- (void)cacheAppearances
{
  p_cachedAppearancesLocuint64_t k = &self->_cachedAppearancesLock;
  os_unfair_lock_lock(&self->_cachedAppearancesLock);
  if (!self->_cachedAppearances)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    cachedAppearances = self->_cachedAppearances;
    self->_cachedAppearances = v4;
  }
  uint64_t v6 = 0;
  do
  {
    unint64_t v7 = [(PDFAnnotation *)self appearance:v6];
    if (v7)
    {
      unint64_t v8 = v7;
      double v9 = self->_cachedAppearances;
      double v10 = [NSNumber numberWithInt:v6];
      uint64_t v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];

      if (!v11)
      {
        [(PDFAnnotation *)self bounds];
        uint64_t v12 = CGDisplayListCreateWithRect();
        if (v12)
        {
          double v13 = (void *)v12;
          uint64_t v14 = CGDisplayListContextCreate();
          if (v14)
          {
            id v15 = (CGContext *)v14;
            [(PDFAnnotation *)self drawAppearance:v8 withBox:1 inContext:v14];
            uint64_t v16 = self->_cachedAppearances;
            double v17 = [NSNumber numberWithInt:v6];
            [(NSMutableDictionary *)v16 setObject:v13 forKeyedSubscript:v17];

            CGContextRelease(v15);
          }
        }
      }
    }
    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 6);

  os_unfair_lock_unlock(p_cachedAppearancesLock);
}

- (BOOL)isAppearanceStreamEmpty
{
  uint64_t v3 = [(PDFAnnotation *)self appearance:0];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  [(PDFAnnotation *)self bounds];
  uint64_t v5 = CGDisplayListCreateWithRect();
  if (!v5) {
    return 1;
  }
  uint64_t v6 = (const void *)v5;
  uint64_t v7 = CGDisplayListContextCreate();
  if (v7)
  {
    unint64_t v8 = (const void *)v7;
    [(PDFAnnotation *)self drawAppearance:v4 withBox:1 inContext:v7];
    BOOL v9 = CGDisplayListGetNumberOfEntries() == 0;
    CFRelease(v8);
  }
  else
  {
    BOOL v9 = 1;
  }
  CFRelease(v6);
  return v9;
}

- (void)getAppearancesFromDictionary:(CGPDFDictionary *)a3 ofType:(int)a4
{
  CGPDFObjectRef value = 0;
  uint64_t v16 = 0;
  if (a4 == 2)
  {
    self->_downAppearance = 0;
    p_downAppearance = &self->_downAppearance;
    self->_downOffAppearance = 0;
    p_downOffAppearance = &self->_downOffAppearance;
    if (!CGPDFDictionaryGetObject(a3, "D", &value)) {
      return;
    }
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    self->_rolloverAppearance = 0;
    p_downAppearance = &self->_rolloverAppearance;
    self->_rolloverOffAppearance = 0;
    p_downOffAppearance = &self->_rolloverOffAppearance;
    uint64_t v7 = "R";
  }
  else
  {
    if (a4) {
      return;
    }
    self->_normalAppearance = 0;
    p_downAppearance = &self->_normalAppearance;
    self->_normalOffAppearance = 0;
    p_downOffAppearance = &self->_normalOffAppearance;
    uint64_t v7 = "N";
  }
  if (CGPDFDictionaryGetObject(a3, v7, &value))
  {
LABEL_9:
    if (CGPDFObjectGetValue(value, kCGPDFObjectTypeStream, &v16))
    {
      *p_downAppearance = (CGPDFForm *)CGPDFFormCreate();
    }
    else
    {
      CGPDFDictionaryRef dict = 0;
      if (CGPDFObjectGetValue(value, kCGPDFObjectTypeDictionary, &dict))
      {
        CGPDFDictionaryRef info = dict;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        CGPDFDictionaryApplyFunction(dict, (CGPDFDictionaryApplierFunction)getStreams, &info);
        if (v12) {
          *p_downAppearance = (CGPDFForm *)CGPDFFormCreate();
        }
        if (v13) {
          *p_downOffAppearance = (CGPDFForm *)CGPDFFormCreate();
        }
        unint64_t v8 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
        BOOL v9 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
        if (v14 && [v8 isEqualToString:@"/Widget"])
        {
          if ([v9 isEqualToString:@"/Btn"])
          {
            double v10 = [NSString stringWithCString:v14 encoding:1];
            [(PDFAnnotation *)self setWidgetOnStateString:v10];
          }
        }
      }
    }
  }
}

- (id)tokenizeAppearanceString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  uint64_t v5 = [v3 length];
  uint64_t v6 = 0;
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ([v3 characterAtIndex:i] == 32)
      {
        if (i == v6)
        {
          ++v6;
        }
        else
        {
          unint64_t v8 = objc_msgSend(v3, "substringWithRange:", v6, i - v6);
          [v4 addObject:v8];

          uint64_t v6 = i + 1;
        }
      }
    }
  }
  BOOL v9 = objc_msgSend(v3, "substringWithRange:", v6, v5 - v6);
  [v4 addObject:v9];

  return v4;
}

- (double)pointSizeFromAppearanceTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  double v5 = 0.0;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v8 = [v3 objectAtIndex:v7];
        int v9 = [v8 isEqualToString:@"Tf"];

        if (v9) {
          break;
        }
      }
      if (v6 == ++v7) {
        goto LABEL_8;
      }
    }
    double v10 = [v3 objectAtIndex:v7 - 1];
    [v10 floatValue];
    double v5 = v11;
  }
LABEL_8:

  return v5;
}

- (id)fontNameFromAppearanceTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 count];
  if (v4)
  {
    unint64_t v5 = 0;
    while (1)
    {
      if (v5 >= 2)
      {
        uint64_t v6 = [v3 objectAtIndex:v5];
        int v7 = [v6 isEqualToString:@"Tf"];

        if (v7)
        {
          unint64_t v8 = [v3 objectAtIndex:v5 - 2];
          uint64_t v9 = [v8 length];

          if (v9) {
            break;
          }
        }
      }
      if (v4 == (void *)++v5)
      {
        uint64_t v4 = 0;
        goto LABEL_9;
      }
    }
    double v10 = [v3 objectAtIndex:v5 - 2];
    uint64_t v4 = objc_msgSend(v10, "substringWithRange:", 1, v9 - 1);
  }
LABEL_9:

  return v4;
}

- (id)colorFromAppearanceTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (!v4)
  {
LABEL_9:
    BOOL v25 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = 0xFFFFFFFF00000000;
  uint64_t v8 = 0xFFFFFFFE00000000;
  uint64_t v9 = 0xFFFFFFFD00000000;
  while (v6 < 3)
  {
    if (v6) {
      goto LABEL_7;
    }
LABEL_8:
    ++v6;
    v7 += 0x100000000;
    v8 += 0x100000000;
    v9 += 0x100000000;
    if (v5 == v6) {
      goto LABEL_9;
    }
  }
  double v10 = [v3 objectAtIndex:v6];
  int v11 = [v10 isEqualToString:@"rg"];

  if (v11)
  {
    uint64_t v16 = (void *)MEMORY[0x263F825C8];
    double v17 = [v3 objectAtIndex:v9 >> 32];
    [v17 floatValue];
    double v19 = v18;
    BOOL v20 = [v3 objectAtIndex:v8 >> 32];
    [v20 floatValue];
    double v22 = v21;
    uint64_t v23 = [v3 objectAtIndex:v7 >> 32];
    [v23 floatValue];
    BOOL v25 = [v16 colorWithRed:v19 green:v22 blue:v24 alpha:1.0];

    goto LABEL_11;
  }
LABEL_7:
  uint64_t v12 = [v3 objectAtIndex:v6];
  int v13 = [v12 isEqualToString:@"g"];

  if (!v13) {
    goto LABEL_8;
  }
  uint64_t v14 = (void *)MEMORY[0x263F825C8];
  double v17 = [v3 objectAtIndex:v7 >> 32];
  [v17 floatValue];
  BOOL v25 = [v14 colorWithWhite:v15 alpha:1.0];
LABEL_11:

LABEL_12:

  return v25;
}

- (id)getFontFromAppearanceString:(CGPDFString *)a3
{
  uint64_t v4 = (__CFString *)CGPDFStringCopyTextString(a3);
  uint64_t v5 = [(PDFAnnotation *)self getFontFromAppearanceNSString:v4];

  return v5;
}

- (id)getColorFromAppearanceString:(CGPDFString *)a3
{
  uint64_t v4 = (__CFString *)CGPDFStringCopyTextString(a3);
  uint64_t v5 = [(PDFAnnotation *)self getColorFromAppearanceNSString:v4];

  return v5;
}

- (id)getFontFromAppearanceNSString:(id)a3
{
  id v4 = a3;
  CGPDFObjectRef v29 = 0;
  CGPDFDictionaryRef v30 = 0;
  uint64_t v5 = [(PDFAnnotation *)self page];
  unint64_t v6 = [v5 document];
  if (!v4)
  {
    double v10 = 0;
    uint64_t v14 = 0;
    uint64_t v7 = 0;
    float v9 = 0.0;
    goto LABEL_29;
  }
  uint64_t v7 = [(PDFAnnotation *)self tokenizeAppearanceString:v4];
  [(PDFAnnotation *)self pointSizeFromAppearanceTokens:v7];
  float v9 = v8;
  double v10 = [(PDFAnnotation *)self fontNameFromAppearanceTokens:v7];
  if (!v10)
  {
    uint64_t v14 = 0;
    goto LABEL_29;
  }
  if ([v6 createdWithWithHighLatencyDataProvider]
    && ([MEMORY[0x263F08B88] isMainThread] & 1) != 0
    || (CGPDFDictionaryRef value = 0, (Catalog = CGPDFDocumentGetCatalog((CGPDFDocumentRef)objc_msgSend(v6, "documentRef", 0))) == 0)
    || !CGPDFDictionaryGetDictionary(Catalog, "AcroForm", &value)
    || !CGPDFDictionaryGetDictionary(value, "DR", &dict)
    || !CGPDFDictionaryGetDictionary(dict, "Font", &v30)
    || (uint64_t v12 = v30,
        id v13 = v10,
        !CGPDFDictionaryGetObject(v12, (const char *)[v13 cStringUsingEncoding:1], &v29)))
  {
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  uint64_t v14 = CGPDFFontCreateWithObject();
  if (!v14 || (Font = (CGFont *)CGPDFFontGetFont(), (CFStringRef v16 = CGFontCopyPostScriptName(Font)) == 0))
  {
LABEL_23:
    if (v9 > 0.0)
    {
      uint64_t v24 = PDFFontWithNameAndSize((uint64_t)v10, v9);
      if (v24)
      {
LABEL_30:
        float v18 = (void *)v24;
        goto LABEL_31;
      }
      if ([v10 isEqualToString:@"Helv"])
      {
        BOOL v25 = @"Helvetica";
        goto LABEL_42;
      }
      if ([v10 isEqualToString:@"HeBo"])
      {
        BOOL v25 = @"Helvetica-Bold";
        goto LABEL_42;
      }
      if ([v10 isEqualToString:@"Cour"])
      {
        BOOL v25 = @"Courier";
        goto LABEL_42;
      }
      if ([v10 isEqualToString:@"ZaDb"])
      {
        BOOL v25 = @"ZapfDingbats";
LABEL_42:
        float v18 = PDFFontWithNameAndSize((uint64_t)v25, v9);
        if (v18)
        {
LABEL_31:
          id v13 = v10;
          if (!v14) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }
LABEL_29:
    uint64_t v24 = PDFFontWithNameAndSize(@"Helvetica", v9);
    goto LABEL_30;
  }
  double v17 = (__CFString *)v16;
  float v18 = PDFFontWithNameAndSize((uint64_t)v16, v9);

  if (!v18)
  {
    CGPDFFontGetFontDescriptor();
    char Flags = CGPDFFontDescriptorGetFlags();
    BOOL v20 = @"Courier";
    if ((Flags & 1) == 0) {
      BOOL v20 = @"Times";
    }
    float v21 = @"Helvetica";
    if (Flags) {
      float v21 = @"Monaco";
    }
    if ((Flags & 2) != 0) {
      uint64_t v22 = (uint64_t)v20;
    }
    else {
      uint64_t v22 = (uint64_t)v21;
    }
    uint64_t v23 = PDFFontWithNameAndSize(v22, v9);
    if (v23)
    {
      float v18 = (void *)v23;
      goto LABEL_32;
    }
    goto LABEL_23;
  }
LABEL_32:
  CGPDFFontRelease();
  double v10 = v13;
LABEL_33:

  return v18;
}

- (id)getColorFromAppearanceNSString:(id)a3
{
  if (a3)
  {
    id v4 = -[PDFAnnotation tokenizeAppearanceString:](self, "tokenizeAppearanceString:");
    uint64_t v5 = [(PDFAnnotation *)self colorFromAppearanceTokens:v4];
  }
  else
  {
    uint64_t v5 = 0;
    id v4 = 0;
  }

  return v5;
}

- (BOOL)_shouldReadAppearanceStreams
{
  if (![(PDFAnnotation *)self isMarkupAnnotationSubtype]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  Document = CGPDFPageGetDocument((CGPDFPageRef)[WeakRetained pageRef]);

  if (!Document) {
    return 1;
  }
  *(void *)minorVersion = 0;
  CGPDFDocumentGetVersion(Document, &minorVersion[1], minorVersion);
  return minorVersion[1] != 1 || minorVersion[0] > 3;
}

- (void)setDictionaryRef:(__CFDictionary *)a3
{
  [(PDFAnnotation *)self _releaseDictionaryRef];
  self->_dictionaryRef = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (__CFDictionary)commonCreateDictionaryRef
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  self->_constructingDictionaryRef = 1;
  BOOL pointerIsOverAnnotation = self->_pointerIsOverAnnotation;
  self->_BOOL pointerIsOverAnnotation = 0;
  BOOL isSelected = self->_isSelected;
  self->_BOOL isSelected = 0;
  CFDictionarySetValue(Mutable, @"/Type", @"/Annot");
  unint64_t v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"/Subtype", v6);
    [(PDFAnnotation *)self extendedBoundsForAction:1];
    -[PDFAnnotation addRect:forKey:toDictionaryRef:](self, "addRect:forKey:toDictionaryRef:", @"/Rect", Mutable);
    [(PDFAnnotation *)self addActionToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addAdditionalActionsToDictionaryRef:Mutable];
    if ([(PDFAnnotation *)self savesAppearanceStream]
      && ([v6 isEqualToString:@"/Popup"] & 1) == 0)
    {
      uint64_t v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
      double v8 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
      if ([v7 isEqualToString:@"/Widget"]
        && [v8 isEqualToString:@"/Btn"])
      {
        float v9 = [(PDFAnnotation *)self formData];
        if (v9)
        {
          double v10 = [(PDFAnnotation *)self fieldName];
          int v11 = [v9 stringValueForFieldNamed:v10];
        }
        else
        {
          int v11 = 0;
        }
        PDFWidgetControlType v12 = [(PDFAnnotation *)self widgetControlType];
        id v13 = [(PDFAnnotation *)self appearance:2];
        if (v12)
        {
          if (v13) {
            [(PDFAnnotation *)self addNormalAndDownAppearanceWithStateToDictionaryRef:Mutable];
          }
          else {
            [(PDFAnnotation *)self addNormalAppearanceWithStateToDictionaryRef:Mutable];
          }
        }
        else if (v13)
        {
          [(PDFAnnotation *)self addNormalAndDownAppearanceToDictionaryRef:Mutable];
        }
        else
        {
          [(PDFAnnotation *)self addNormalAppearanceToDictionaryRef:Mutable];
        }
        if (v11)
        {
          uint64_t v14 = [(PDFAnnotation *)self fieldName];
          [v9 setStringValue:v11 forFieldNamed:v14 postFormChangeNotification:!self->_constructingDictionaryRef];
        }
      }
      else
      {
        [(PDFAnnotation *)self addNormalAppearanceToDictionaryRef:Mutable];
      }
    }
    [(PDFAnnotation *)self addBorderToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addBorderStyleToDictionaryRef:Mutable];
    float v15 = [(PDFAnnotation *)self color];
    [(PDFAnnotation *)self addColor:v15 forKey:@"/C" toDictionaryRef:Mutable];

    [(PDFAnnotation *)self addContentsToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addDefaultAppearanceDictionaryRef:Mutable];
    if (![(PDFAnnotation *)self addDestinationToDictionaryRef:Mutable]) {
      [(PDFAnnotation *)self addActionToDictionaryRef:Mutable];
    }
    [(PDFAnnotation *)self addFlagsToDictionaryRef:Mutable];
    CFStringRef v16 = [(PDFAnnotation *)self valueForAnnotationKey:@"/IC"];
    [(PDFAnnotation *)self addColor:v16 forKey:@"/IC" toDictionaryRef:Mutable];

    [(PDFAnnotation *)self addHighlightingModeToDictionaryRef:Mutable];
    if ([v6 isEqualToString:@"/Ink"]) {
      [(PDFAnnotation *)self addInkListToDictionaryRef:Mutable];
    }
    if ([v6 isEqualToString:@"/Line"]) {
      [(PDFAnnotation *)self addLineToDictionaryRef:Mutable];
    }
    if ([v6 isEqualToString:@"/Line"]) {
      [(PDFAnnotation *)self addLineEndingStylesToDictionaryRef:Mutable];
    }
    [(PDFAnnotation *)self addModificationDateToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addNameToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addOpenToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addPopupToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addQuaddingToDictionaryRef:Mutable];
    if ([(PDFAnnotation *)self isMarkupAnnotationSubtype]) {
      [(PDFAnnotation *)self addQuadPointsToDictionaryRef:Mutable];
    }
    [(PDFAnnotation *)self addTextLabelToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addDefaultFieldValueToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addFieldFlagsToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addFieldTypeToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addMaxLenToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addAppearanceCharacteristicsToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addOptionsToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addAlternateFieldNameToDictionaryRef:Mutable];
    [(PDFAnnotation *)self addFieldValueToDictionaryRef:Mutable];
    [(PDFAnnotation *)self _addUnknownPropertiesToDictionaryRef:Mutable];
    self->_BOOL isSelected = isSelected;
    self->_BOOL pointerIsOverAnnotation = pointerIsOverAnnotation;
    self->_constructingDictionaryRef = 0;
  }
  else
  {
    NSLog(&cfstr_PdfkitSerializ.isa);
    CFMutableDictionaryRef Mutable = 0;
  }

  return Mutable;
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5
{
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 scaleProportional:(BOOL)a6
{
  BOOL v6 = a6;
  [(PDFAnnotation *)self bounds];

  -[PDFAnnotation drawAppearance:withBox:inContext:inRect:scaleProportional:](self, "drawAppearance:withBox:inContext:inRect:scaleProportional:", a3, a4, a5, v6);
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7
{
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7 suppressTextRendering:(BOOL)a8
{
  double x = a6.origin.x;
  memset(&v37, 0, sizeof(v37));
  if (a3)
  {
    if ((unint64_t)a4 <= 4)
    {
      BOOL v10 = a7;
      CGFloat height = a6.size.height;
      double width = a6.size.width;
      CGFloat y = a6.origin.y;
      CurrentContext = a5;
      if (a5 || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
      {
        double v35 = height;
        double v33 = y;
        CGPDFFormGetMatrix();
        CGPDFFormGetBBox();
        CGFloat v16 = v38.origin.x;
        CGFloat v17 = v38.origin.y;
        CGFloat v18 = v38.size.width;
        CGFloat v19 = v38.size.height;
        transforuint64_t m = v37;
        CGRect v39 = CGRectApplyAffineTransform(v38, &transform);
        CGFloat v32 = v39.origin.x;
        CGFloat rect = v39.origin.y;
        double v20 = v39.size.width;
        double v21 = v39.size.height;
        CGContextSaveGState(CurrentContext);
        uint64_t v22 = [(PDFAnnotation *)self page];
        [v22 transformContext:CurrentContext forBox:a4];

        if (v20 <= 0.0 || v21 <= 0.0)
        {
          CGContextRestoreGState(CurrentContext);
          return;
        }
        double v23 = width / v20;
        double v24 = v35 / v21;
        if (v10)
        {
          if (v23 >= v24)
          {
            double v28 = v35 / v21;
            if (v24 < v23)
            {
              double v29 = v35 / v21;
LABEL_13:
              double MinX = PDFRectGetMinX(x, v33, width);
              v40.origin.double x = v32;
              v40.origin.CGFloat y = rect;
              v40.size.double width = v20;
              v40.size.CGFloat height = v21;
              CGFloat v31 = (width - v29 * v20) * 0.5 + MinX - v29 * CGRectGetMinX(v40);
              double MinY = PDFRectGetMinY(x, v33, width, v35);
              v41.origin.double x = v32;
              v41.origin.CGFloat y = rect;
              v41.size.double width = v20;
              v41.size.CGFloat height = v21;
              CGFloat v26 = CGRectGetMinY(v41);
              transform.a = v29;
              transform.b = 0.0;
              transform.c = 0.0;
              transform.d = v28;
              transform.tdouble x = v31;
              transform.tCGFloat y = (v35 - v28 * v21) * 0.5 + MinY - v28 * v26;
              CGContextConcatCTM(CurrentContext, &transform);
              CGPDFFormGetStream();
              CGPDFFormGetResources();
              uint64_t v27 = CGPDFDrawingContextCreateWithStream();
              transforuint64_t m = v37;
              CGContextConcatCTM(CurrentContext, &transform);
              v42.origin.CGFloat y = v17;
              v42.origin.double x = v16;
              v42.size.CGFloat height = v19;
              v42.size.double width = v18;
              CGContextClipToRect(CurrentContext, v42);
              CGPDFDrawingContextDrawWithContentTypes();
              CGContextRestoreGState(CurrentContext);
              if (v27) {
                CGPDFDrawingContextRelease();
              }
              return;
            }
          }
          else
          {
            double v28 = width / v20;
          }
        }
        else
        {
          double v28 = v35 / v21;
        }
        double v29 = width / v20;
        goto LABEL_13;
      }
    }
  }
}

- (void)drawCachedAppearance:(CGDisplayList *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7
{
  if (a3)
  {
    if ((unint64_t)a4 <= 4)
    {
      BOOL v8 = a7;
      double height = a6.size.height;
      double width = a6.size.width;
      CGFloat y = a6.origin.y;
      CGFloat x = a6.origin.x;
      CurrentContext = a5;
      if (a5 || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
      {
        [(PDFAnnotation *)self bounds];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        CGContextSaveGState(CurrentContext);
        double v23 = [(PDFAnnotation *)self page];
        [v23 transformContext:CurrentContext forBox:a4];

        if (v20 > 0.0 && v22 > 0.0)
        {
          double v24 = x;
          double v25 = width / v20;
          double v26 = height / v22;
          CGFloat v35 = v16;
          CGFloat v36 = v18;
          double v27 = y;
          double v28 = height;
          if (v8)
          {
            if (v25 >= v26)
            {
              double v33 = height / v22;
              if (v26 < v25) {
                double v25 = height / v22;
              }
            }
            else
            {
              double v33 = width / v20;
            }
          }
          else
          {
            double v33 = height / v22;
          }
          double v29 = v24;
          double v30 = v27;
          double MinX = PDFRectGetMinX(v24, v27, width);
          v38.origin.CGFloat x = v35;
          v38.origin.CGFloat y = v36;
          v38.size.double width = v20;
          v38.size.double height = v22;
          CGFloat v34 = (width - v25 * v20) * 0.5 + MinX - v25 * CGRectGetMinX(v38);
          double MinY = PDFRectGetMinY(v29, v30, width, v28);
          v39.origin.CGFloat x = v35;
          v39.origin.CGFloat y = v36;
          v39.size.double width = v20;
          v39.size.double height = v22;
          transform.a = v25;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.d = v33;
          transform.tCGFloat x = v34;
          transform.tCGFloat y = (v28 - v33 * v22) * 0.5 + MinY - v33 * CGRectGetMinY(v39);
          CGContextConcatCTM(CurrentContext, &transform);
          v40.origin.CGFloat x = v35;
          v40.origin.CGFloat y = v36;
          v40.size.double width = v20;
          v40.size.double height = v22;
          CGContextClipToRect(CurrentContext, v40);
          CGDisplayListDrawInContext();
        }
        CGContextRestoreGState(CurrentContext);
      }
    }
  }
}

- (void)_drawAnnotationWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F089D8] string];
  [(PDFAnnotation *)self bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  PDFWidgetControlType v12 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  id v13 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  [v3 appendFormat:@"Type: '%@', Bounds: (%.0f, %.0f) [%.0f, %.0f]", v12, v5, v7, v9, v11];
  if ([v12 isEqualToString:@"/Widget"]
    && [v13 isEqualToString:@"/Tx"])
  {
    uint64_t v14 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
    [v3 appendFormat:@", WidgetValue: %@", v14];
  }
  else
  {
    if (![v12 isEqualToString:@"/FreeText"]) {
      goto LABEL_7;
    }
    uint64_t v14 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Contents"];
    [v3 appendFormat:@", Contents: %@", v14];
  }

LABEL_7:

  return (NSString *)v3;
}

- (id)debugQuickLookObject
{
  [(PDFAnnotation *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v7, v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__PDFAnnotation_debugQuickLookObject__block_invoke;
  v14[3] = &unk_264203BD0;
  v14[5] = v4;
  v14[6] = v6;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v10;
  v14[4] = self;
  PDFWidgetControlType v12 = [v11 imageWithActions:v14];

  return v12;
}

void __37__PDFAnnotation_debugQuickLookObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  if (v3)
  {
    uint64_t v4 = v3;
    CGContextSaveGState(v3);
    CGContextScaleCTM(v4, 1.0, -1.0);
    CGContextTranslateCTM(v4, -*(double *)(a1 + 40), -*(double *)(a1 + 48) - *(double *)(a1 + 64));
    [*(id *)(a1 + 32) drawWithBox:1 inContext:v4];
    CGContextRestoreGState(v4);
  }
}

- (__CFDictionary)gcCreateAttributesForFont:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  double v8 = Mutable;
  if (Mutable)
  {
    if (v5) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F039A0], v5);
    }
    if (v6)
    {
      id v9 = v6;
      ColorSpace = CGColorGetColorSpace((CGColorRef)[v9 CGColor]);
      Components = CGColorGetComponents((CGColorRef)[v9 CGColor]);
      CGColorRef v12 = CGColorCreate(ColorSpace, Components);
      if (v12)
      {
        id v13 = v12;
        CFDictionarySetValue(v8, (const void *)*MEMORY[0x263F03C60], v12);
        CGColorRelease(v13);
      }
    }
  }

  return v8;
}

- (void)addToPageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    uint64_t v4 = [WeakRetained view];

    id WeakRetained = v10;
    if (v4)
    {
      id v5 = [v10 view];
      id v6 = [v5 document];
      uint64_t v7 = [v6 indexForPage:v10];

      double v8 = [v5 pageViewForPageAtIndex:v7];
      id v9 = v8;
      if (v8) {
        [v8 addAnnotation:self];
      }

      id WeakRetained = v10;
    }
  }
}

- (void)removeFromPageView
{
  uint64_t v3 = [(PDFAnnotation *)self page];
  if (v3)
  {
    id v10 = v3;
    uint64_t v4 = [v3 view];

    uint64_t v3 = v10;
    if (v4)
    {
      id v5 = [v10 view];
      id v6 = [v5 document];
      uint64_t v7 = [v6 indexForPage:v10];

      double v8 = [v5 pageViewForPageAtIndex:v7];
      id v9 = v8;
      if (v8) {
        [v8 removeAnnotation:self];
      }

      uint64_t v3 = v10;
    }
  }
}

- (void)updateAnnotationEffect
{
  if (!self->_constructingDictionaryRef && self->_isFullyConstructed)
  {
    uint64_t v3 = [(PDFAnnotation *)self page];
    if (v3)
    {
      id v10 = v3;
      uint64_t v4 = [v3 view];

      uint64_t v3 = v10;
      if (v4)
      {
        id v5 = [v10 view];
        id v6 = [v5 document];
        uint64_t v7 = [v6 indexForPage:v10];

        double v8 = [v5 pageViewForPageAtIndex:v7];
        id v9 = v8;
        if (v8) {
          [v8 updateAnnotation:self];
        }

        uint64_t v3 = v10;
      }
    }
  }
}

- (void)addControl
{
  uint64_t v3 = [(PDFAnnotation *)self page];
  if (v3)
  {
    id v10 = v3;
    uint64_t v4 = [v3 view];

    uint64_t v3 = v10;
    if (v4)
    {
      id v5 = [v10 view];
      id v6 = [v5 document];
      uint64_t v7 = [v6 indexForPage:v10];

      double v8 = [v5 pageViewForPageAtIndex:v7];
      id v9 = v8;
      if (v8) {
        [v8 addControlForAnnotation:self];
      }

      uint64_t v3 = v10;
    }
  }
}

- (void)postAnnotationsChangedNotification
{
  if (!self->_constructingDictionaryRef && self->_isFullyConstructed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    if (WeakRetained)
    {
      id v3 = WeakRetained;
      [WeakRetained postAnnotationsChangedNotification];
      id WeakRetained = v3;
    }
  }
}

- (CGRect)extendedBoundsForAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(PDFAnnotation *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PDFAnnotation *)self _calculatePDFAnnotationLayerOutsetForAction:v3];
  double v16 = v15 + v10 + v13;
  double v18 = v17 + v12 + v14;
  double v19 = v6 - v13;
  double v20 = v8 - v14;
  result.size.double height = v18;
  result.size.double width = v16;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- ($109F14CB9CD3811A6C59613AC76ACC48)_calculatePDFAnnotationLayerOutsetForAction:(int)a3
{
  double v5 = 0.0;
  if ([(PDFAnnotation *)self hasAppearanceStream]
    || ([(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"],
        double v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"/Line"],
        v6,
        a3 == 1)
    && !v7)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
  }
  else
  {
    double v15 = [(PDFAnnotation *)self border];
    [v15 lineWidth];
    double v17 = v16;

    double v18 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MK"];
    [v18 borderColor];

    if (!v7)
    {
      if (v17 <= 0.0)
      {
        double v8 = 0.0;
        double v9 = 0.0;
        double v10 = 0.0;
        if (![(PDFAnnotation *)self _isTextMarkupRedaction]) {
          goto LABEL_5;
        }
        double v58 = 0.8;
      }
      else
      {
        double v58 = ceil(v17);
      }
      double v10 = PDFPointMake(v58, v58);
      double v9 = v61;
      double v8 = PDFPointMake(v58, v58);
      double v5 = v62;
      goto LABEL_5;
    }
    [(PDFAnnotation *)self bounds];
    double rect_8 = v20;
    double rect_16 = v19;
    [(PDFAnnotation *)self startPoint];
    double v22 = v21;
    double v24 = v23;
    [(PDFAnnotation *)self endPoint];
    double v26 = v25;
    double v28 = v27;
    PDFLineStyle v29 = [(PDFAnnotation *)self startLineStyle];
    PDFLineStyle v30 = [(PDFAnnotation *)self endLineStyle];
    -[PDFAnnotation _drawingRectForLineStyle:from:to:borderWidth:](self, "_drawingRectForLineStyle:from:to:borderWidth:", v29, v26, v28, v22, v24, v17);
    CGFloat recta = v31;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    -[PDFAnnotation _drawingRectForLineStyle:from:to:borderWidth:](self, "_drawingRectForLineStyle:from:to:borderWidth:", v30, v22, v24, v26, v28, v17);
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    v70.origin.CGFloat x = recta;
    v70.origin.CGFloat y = v33;
    v70.size.CGFloat width = v35;
    v70.size.CGFloat height = v37;
    CGRect v71 = PDFRectInset(v70, -1.0, -1.0);
    CGFloat x = v71.origin.x;
    CGFloat y = v71.origin.y;
    CGFloat width = v71.size.width;
    CGFloat height = v71.size.height;
    v71.origin.CGFloat x = v39;
    v71.origin.CGFloat y = v41;
    v71.size.CGFloat width = v43;
    v71.size.CGFloat height = v45;
    CGRect v72 = PDFRectInset(v71, -1.0, -1.0);
    CGFloat v64 = v72.origin.x;
    CGFloat v65 = v72.size.width;
    CGFloat rect = v72.origin.y;
    CGFloat v63 = v72.size.height;
    CGFloat v50 = *MEMORY[0x263F00148];
    CGFloat v51 = *(double *)(MEMORY[0x263F00148] + 8);
    v72.origin.CGFloat x = *(CGFloat *)MEMORY[0x263F00148];
    v72.origin.CGFloat y = v51;
    v72.size.CGFloat height = rect_8;
    v72.size.CGFloat width = rect_16;
    double v52 = rect_8;
    v78.origin.CGFloat x = x;
    v78.origin.CGFloat y = y;
    v78.size.CGFloat width = width;
    v78.size.CGFloat height = height;
    if (PDFRectIntersectsRect(v72, v78))
    {
      v73.origin.CGFloat x = v50;
      v73.origin.CGFloat y = v51;
      v73.size.CGFloat width = rect_16;
      v73.size.CGFloat height = rect_8;
      v79.origin.CGFloat x = x;
      v79.origin.CGFloat y = y;
      v79.size.CGFloat width = width;
      v79.size.CGFloat height = height;
      CGRect v74 = PDFRectUnion(v73, v79);
      double v53 = v74.origin.x;
      double v54 = v74.origin.y;
      double v55 = v74.size.width;
      double v52 = v74.size.height;
      double v56 = rect_8;
      double v57 = rect_16;
    }
    else
    {
      double v53 = v50;
      double v54 = v51;
      double v57 = rect_16;
      double v55 = rect_16;
      double v56 = rect_8;
    }
    CGFloat v59 = v50;
    CGFloat v60 = v51;
    v80.origin.CGFloat x = v64;
    v80.origin.CGFloat y = rect;
    v80.size.CGFloat width = v65;
    v80.size.CGFloat height = v63;
    if (PDFRectIntersectsRect(*(CGRect *)(&v57 - 2), v80))
    {
      v75.origin.CGFloat x = v53;
      v75.origin.CGFloat y = v54;
      v75.size.CGFloat width = v55;
      v75.size.CGFloat height = v52;
      v81.origin.CGFloat x = v64;
      v81.origin.CGFloat y = rect;
      v81.size.CGFloat width = v65;
      v81.size.CGFloat height = v63;
      CGRect v76 = PDFRectUnion(v75, v81);
      double v53 = v76.origin.x;
      double v54 = v76.origin.y;
      double v55 = v76.size.width;
      double v52 = v76.size.height;
    }
    double v10 = fabs(PDFRectGetMinX(v53, v54, v55));
    double v9 = fabs(PDFRectGetMinY(v53, v54, v55, v52));
    double v8 = PDFRectGetMaxX(v53, v54, v55) - rect_16;
    double v5 = PDFRectGetMaxY(v53, v54, v55, v52) - rect_8;
  }
LABEL_5:
  double v11 = v10;
  double v12 = v9;
  double v13 = v8;
  double v14 = v5;
  result.var1.CGFloat y = v14;
  result.var1.CGFloat x = v13;
  result.var0.CGFloat y = v12;
  result.var0.CGFloat x = v11;
  return result;
}

- (CGRect)_drawingRectForLineStyle:(int64_t)a3 from:(CGPoint)a4 to:(CGPoint)a5 borderWidth:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double v13 = PDFRectMakeFromCenter(a5.x, a5.y, 2.0);
  switch(a3)
  {
    case 0:
      double v19 = PDFPointMake(a6 * 0.5, a6 * 0.5);
      double v20 = v19 + v19;
      double v22 = v21 + v21;
      v23.n128_f64[0] = x - v19;
      v24.n128_f64[0] = y - v21;
      double v13 = PDFRectMake(v23, v24, v20, v22);
      break;
    case 1:
    case 2:
      double v17 = a6 * 0.5;
      double v18 = 1.5;
      goto LABEL_5;
    case 3:
      double v17 = a6 * 1.5 * 0.25 + a6 * 1.5;
      double v18 = 0.375;
LABEL_5:
      double v13 = PDFRectMakeFromCenter(x, y, v17 + a6 * v18 + v17 + a6 * v18);
      break;
    case 4:
      double v25 = sqrt((y - v9) * (y - v9) + (x - v10) * (x - v10));
      double v26 = (x - v10) * a6;
      double v27 = (y - v9) * a6;
      double v28 = PDFPointMake(x - v26 * 3.0 / v25, y - v27 * 3.0 / v25);
      double v30 = v29;
      double v31 = v27 * 1.5 / v25;
      double v32 = v26 * 1.5 / v25;
      double v33 = PDFPointMake(v28 - v31, v32 + v29);
      double v127 = v34;
      double v35 = PDFPointMake(v31 + v28, v30 - v32);
      double v37 = v36;
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", x, y, v33, v127, v35, v36, a6);
      double v39 = v38 + v38;
      double v41 = v40 + v40;
      v42.n128_f64[0] = x - v38;
      v43.n128_f64[0] = y - v40;
      PDFRectMake(v42, v43, v39, v41);
      double v44 = PDFPointMake(a6 * 0.5, a6 * 0.5);
      double v46 = v45;
      v47.n128_f64[0] = v33 - v44;
      v48.n128_f64[0] = v127 - v45;
      PDFRectMake(v47, v48, v44 + v44, v46 + v46);
      v49.n128_f64[0] = v35 - v44;
      v50.n128_f64[0] = v37 - v46;
      PDFRectMake(v49, v50, v44 + v44, v46 + v46);
      double v52 = PDFRectToCGRect(v51);
      uint64_t v131 = v53;
      double v133 = v52;
      uint64_t v128 = v55;
      uint64_t v129 = v54;
      CGFloat v57 = PDFRectToCGRect(v56);
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;
      v141.origin.double x = PDFRectToCGRect(v64);
      v141.origin.double y = v65;
      v141.size.CGFloat width = v66;
      v141.size.CGFloat height = v67;
      v135.origin.double x = v57;
      v135.origin.double y = v59;
      v135.size.CGFloat width = v61;
      v135.size.CGFloat height = v63;
      CGRect v136 = CGRectUnion(v135, v141);
      CGFloat v68 = v136.origin.x;
      CGFloat v69 = v136.origin.y;
      CGFloat width = v136.size.width;
      CGFloat height = v136.size.height;
      uint64_t v73 = v131;
      double v72 = v133;
      uint64_t v75 = v128;
      uint64_t v74 = v129;
      goto LABEL_8;
    case 5:
      double v76 = y - v9;
      double v77 = sqrt(v76 * v76 + (x - v10) * (x - v10));
      double v78 = (x - v10) * a6;
      double v79 = v76 * a6;
      double v80 = PDFPointMake(x - v78 * 3.0 / v77, y - v76 * a6 * 3.0 / v77);
      double v82 = v81;
      double v83 = v79 * 1.5 / v77;
      double v84 = v78 * 1.5 / v77;
      double r1 = PDFPointMake(v80 - v83, v84 + v81);
      double v86 = v85;
      double v87 = PDFPointMake(v83 + v80, v82 - v84);
      double v89 = v88;
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", x, y, r1, v86, v87, v88, a6);
      double v91 = v90 + v90;
      double v93 = v92 + v92;
      v94.n128_f64[0] = x - v90;
      v95.n128_f64[0] = y - v92;
      PDFRectMake(v94, v95, v91, v93);
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", r1, v86, x, y, v87, v89, a6);
      double v97 = v96 + v96;
      double v99 = v98 + v98;
      v100.n128_f64[0] = r1 - v96;
      v101.n128_f64[0] = v86 - v98;
      PDFRectMake(v100, v101, v97, v99);
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", v87, v89, x, y, r1, v86, a6);
      double v103 = v102 + v102;
      double v105 = v104 + v104;
      v106.n128_f64[0] = v87 - v102;
      v107.n128_f64[0] = v89 - v104;
      PDFRectMake(v106, v107, v103, v105);
      double v109 = PDFRectToCGRect(v108);
      uint64_t v132 = v110;
      double v134 = v109;
      uint64_t v130 = v111;
      uint64_t r1a = v112;
      CGFloat v114 = PDFRectToCGRect(v113);
      CGFloat v116 = v115;
      CGFloat v118 = v117;
      CGFloat v120 = v119;
      v142.origin.double x = PDFRectToCGRect(v121);
      v142.origin.double y = v122;
      v142.size.CGFloat width = v123;
      v142.size.CGFloat height = v124;
      v137.origin.double x = v114;
      v137.origin.double y = v116;
      v137.size.CGFloat width = v118;
      v137.size.CGFloat height = v120;
      CGRect v138 = CGRectUnion(v137, v142);
      CGFloat v68 = v138.origin.x;
      CGFloat v69 = v138.origin.y;
      CGFloat width = v138.size.width;
      CGFloat height = v138.size.height;
      uint64_t v73 = v132;
      double v72 = v134;
      uint64_t v74 = v130;
      uint64_t v75 = r1a;
LABEL_8:
      CGRect v139 = CGRectUnion(*(CGRect *)&v72, *(CGRect *)&v68);
      double v13 = PDFRectFromCGRect(v139.origin.x, v139.origin.y, v139.size.width, v139.size.height);
      break;
    default:
      break;
  }
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGPoint)_pointOutsetFrom:(CGPoint)a3 startPoint1:(CGPoint)a4 startPoint2:(CGPoint)a5 lineWidth:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a3.y;
  double v10 = a3.x;
  double v11 = PDFNormalizedCGVectorFromPoints(a3.x, a3.y, a4.x, a4.y);
  double v13 = v12;
  double v14 = PDFNormalizedCGVectorFromPoints(v10, v9, x, y);
  double v16 = v15;
  double v17 = PDFNormalizeCGVector((v11 + v14) * 0.5, (v13 + v15) * 0.5);
  double v19 = v18;
  double v20 = PDFGetAngleBetweenCGVectors(v11, v13, v14, v16);
  long double v21 = a6 / sin(v20 * 0.5) * 0.5;
  double v22 = v17 * v21;
  double v23 = v19 * v21;

  double v24 = PDFPointMake(v22, v23);
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (void)updateFormData
{
  id v17 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if ([v17 isEqualToString:@"/Widget"])
  {
    uint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
    double v5 = [(PDFAnnotation *)self formData];
    if (!v5)
    {
      double v6 = [WeakRetained document];
      double v5 = objc_alloc_init(PDFForm);
      [(PDFForm *)v5 setDocument:v6];
      [v6 setFormData:v5];
    }
    int v7 = [(PDFAnnotation *)self fieldName];
    if (![v4 isEqualToString:@"/Btn"])
    {
      if ([v4 isEqualToString:@"/Ch"])
      {
        double v13 = [(PDFForm *)v5 fieldNamed:v7];

        if (!v13)
        {
          double v14 = [[PDFFormField alloc] initWithAnnotation:self];
          [(PDFForm *)v5 addFormField:v14];
        }
        double v8 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
      }
      else
      {
        if (![v4 isEqualToString:@"/Tx"])
        {
LABEL_22:

          goto LABEL_23;
        }
        double v8 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
        double v15 = [(PDFForm *)v5 fieldNamed:v7];

        if (!v15) {
          [WeakRetained addAnnotationFormField:self];
        }
      }
      [(PDFForm *)v5 setStringValue:v8 forFieldNamed:v7 postFormChangeNotification:!self->_constructingDictionaryRef];
LABEL_21:

      goto LABEL_22;
    }
    double v8 = [(PDFAnnotation *)self widgetOnStateString];
    double v9 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
    int v10 = [v9 isEqualToString:v8];
    double v11 = [(PDFForm *)v5 fieldNamed:v7];

    if (v11)
    {
      if (v10)
      {
LABEL_7:
        double v12 = [(PDFAnnotation *)self widgetOnStateString];
        if (v12) {
          [(PDFForm *)v5 setStringValue:v12 forFieldNamed:v7 postFormChangeNotification:!self->_constructingDictionaryRef];
        }

        goto LABEL_20;
      }
    }
    else
    {
      double v16 = [[PDFFormField alloc] initWithAnnotation:self];
      [(PDFForm *)v5 addFormField:v16];

      if (v10) {
        goto LABEL_7;
      }
    }
    [(PDFForm *)v5 setStringValue:0 forFieldNamed:v7 postFormChangeNotification:!self->_constructingDictionaryRef];
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:
}

- (void)clearFormData
{
  id v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v5 isEqualToString:@"/Widget"])
  {
    uint64_t v3 = [(PDFAnnotation *)self fieldName];

    if (v3) {
      [(PDFAnnotation *)self setFieldName:0];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [(PDFAnnotation *)self alternateFieldName];

      if (v4)
      {
        if (objc_opt_respondsToSelector()) {
          [(PDFAnnotation *)self setAlternateFieldName:0];
        }
      }
    }
  }
}

- (id)formData
{
  uint64_t v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v3 isEqualToString:@"/Widget"]
    && ([(PDFAnnotation *)self page], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v4 document];
    if (v6)
    {
      int v7 = (void *)v6;
      double v8 = [(PDFAnnotation *)self fieldName];
      if (v8)
      {
        double v9 = [v7 formData];
      }
      else
      {
        double v9 = 0;
      }
    }
    else
    {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)akAnnotationAdaptor
{
  return self->_akAnnotationAdaptor;
}

- (id)scaledFontForTextWidget
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = [(PDFAnnotation *)self font];
  if (![(PDFAnnotation *)self isTextWidget]) {
    goto LABEL_7;
  }
  if (v3)
  {
    [v3 pointSize];
    if (v4 == 0.0)
    {
      [MEMORY[0x263F82760] smallSystemFontSize];
      uint64_t v5 = objc_msgSend(v3, "fontWithSize:");

      id v3 = (id)v5;
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F82760];
    [MEMORY[0x263F82760] smallSystemFontSize];
    objc_msgSend(v6, "systemFontOfSize:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(PDFAnnotation *)self isMultiline])
  {
    [v3 pointSize];
    double v9 = v8;
    [(PDFAnnotation *)self bounds];
    double v11 = v10;
    double v13 = v12;
    double v14 = [(PDFAnnotation *)self widgetStringValue];
    uint64_t v15 = *MEMORY[0x263F82270];
    do
    {
      double v16 = v9;
      if (v9 <= 4.0) {
        break;
      }
      uint64_t v24 = v15;
      id v17 = [MEMORY[0x263F82760] systemFontOfSize:v9];
      v25[0] = v17;
      double v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      double v19 = PDFSizeToCGSize([v14 sizeWithAttributes:v18]);
      double v21 = v20;

      double v9 = v9 + -1.0;
    }
    while (v19 > v11 || v21 > v13);
    int v7 = [v3 fontWithSize:round(v16)];
  }
  else
  {
LABEL_7:
    id v3 = v3;
    int v7 = v3;
  }

  return v7;
}

- (id)createAttributedStringForTextWidget
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = [(PDFAnnotation *)self widgetStringValue];
  double v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v5 = [(PDFAnnotation *)self scaledFontForTextWidget];
    uint64_t v6 = [(PDFAnnotation *)self fontColor];
    NSTextAlignment v7 = [(PDFAnnotation *)self alignment];
    uint64_t v8 = [v4 length];
    double v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v4];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F82290], &unk_26C52E190, 0, v8);
    double v10 = (uint64_t *)MEMORY[0x263F82270];
    if (v5) {
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F82270], v5, 0, v8);
    }
    if (v6) {
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F82278], v6, 0, v8);
    }
    double v11 = [MEMORY[0x263F82370] defaultParagraphStyle];
    double v12 = (void *)[v11 mutableCopy];

    [v12 setAlignment:v7];
    if ([(PDFAnnotation *)self shouldComb])
    {
      double v13 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MaxLen"];
      double v14 = (double)[v13 integerValue];

      uint64_t v23 = *v10;
      v24[0] = v5;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      [v4 sizeWithAttributes:v15];
      double v17 = v16;

      double v18 = (double)(unint64_t)[v4 length];
      [(PDFAnnotation *)self bounds];
      uint64_t v20 = *MEMORY[0x263F82288];
      double v21 = [NSNumber numberWithDouble:(v19 + -v17 / v18 * v14) / v14];
      objc_msgSend(v9, "addAttribute:value:range:", v20, v21, 0, v8);

      [v12 setLineBreakMode:2];
    }
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F822A8], v12, 0, v8);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (BOOL)suppressAppearanceStreamText
{
  return self->_suppressAppearanceStreamText;
}

- (id)autoFillTextContentType
{
  p_autoFillTextContentType = &self->_autoFillTextContentType;
  if (!self->_autoFillTextContentType && [(PDFAnnotation *)self isTextWidget])
  {
    double v4 = [(PDFAnnotation *)self fieldName];
    uint64_t v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/TU"];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __40__PDFAnnotation_autoFillTextContentType__block_invoke;
    v12[3] = &unk_264203BF8;
    id v6 = v4;
    id v13 = v6;
    id v7 = v5;
    id v14 = v7;
    uint64_t v8 = (uint64_t (**)(void *, __CFString *))_Block_copy(v12);
    if (v8[2](v8, @"user"))
    {
      double v9 = (id *)MEMORY[0x263F83AA8];
    }
    else if (v8[2](v8, @"password"))
    {
      double v9 = (id *)MEMORY[0x263F83A70];
    }
    else if (v8[2](v8, @"email"))
    {
      double v9 = (id *)MEMORY[0x263F839F8];
    }
    else if (v8[2](v8, @"url"))
    {
      double v9 = (id *)MEMORY[0x263F83AA0];
    }
    else if (v8[2](v8, @"address"))
    {
      objc_storeStrong((id *)p_autoFillTextContentType, (id)*MEMORY[0x263F83A08]);
      if (v8[2](v8, @"first") & 1) != 0 || (v8[2](v8, @"1"))
      {
        double v9 = (id *)MEMORY[0x263F83A80];
      }
      else
      {
        if ((v8[2](v8, @"second") & 1) == 0 && (v8[2](v8, @"2") & 1) == 0) {
          goto LABEL_33;
        }
        double v9 = (id *)MEMORY[0x263F83A88];
      }
    }
    else if v8[2](v8, @"city") && (v8[2](v8, @"state"))
    {
      double v9 = (id *)MEMORY[0x263F839D0];
    }
    else if (v8[2](v8, @"city"))
    {
      double v9 = (id *)MEMORY[0x263F839C8];
    }
    else if (v8[2](v8, @"state"))
    {
      double v9 = (id *)MEMORY[0x263F839D8];
    }
    else if (v8[2](v8, @"sublocal"))
    {
      double v9 = (id *)MEMORY[0x263F83A90];
    }
    else if (v8[2](v8, @"country"))
    {
      double v9 = (id *)MEMORY[0x263F839E8];
    }
    else if (v8[2](v8, @"postal") & 1) != 0 || (v8[2](v8, @"postcode"))
    {
      double v9 = (id *)MEMORY[0x263F83A78];
    }
    else if (v8[2](v8, @"location"))
    {
      double v9 = (id *)MEMORY[0x263F83A20];
    }
    else if (v8[2](v8, @"job"))
    {
      double v9 = (id *)MEMORY[0x263F83A18];
    }
    else if (v8[2](v8, @"organization") & 1) != 0 || (v8[2](v8, @"company"))
    {
      double v9 = (id *)MEMORY[0x263F83A68];
    }
    else if (v8[2](v8, @"prefix"))
    {
      double v9 = (id *)MEMORY[0x263F83A38];
    }
    else if (v8[2](v8, @"suffix"))
    {
      double v9 = (id *)MEMORY[0x263F83A40];
    }
    else if (v8[2](v8, @"name"))
    {
      objc_storeStrong((id *)p_autoFillTextContentType, (id)*MEMORY[0x263F83A30]);
      if (v8[2](v8, @"first") & 1) != 0 || (v8[2](v8, @"given"))
      {
        double v9 = (id *)MEMORY[0x263F83A10];
      }
      else if (v8[2](v8, @"middle"))
      {
        double v9 = (id *)MEMORY[0x263F83A28];
      }
      else if ((v8[2](v8, @"last") & 1) != 0 {
             || (v8[2](v8, @"family") & 1) != 0
      }
             || (v8[2](v8, @"surname") & 1) != 0)
      {
        double v9 = (id *)MEMORY[0x263F83A00];
      }
      else
      {
        if ((v8[2](v8, @"nickname") & 1) == 0) {
          goto LABEL_33;
        }
        double v9 = (id *)MEMORY[0x263F83A50];
      }
    }
    else if (v8[2](v8, @"phone") & 1) != 0 || (v8[2](v8, @"mobile"))
    {
      double v9 = (id *)MEMORY[0x263F83A98];
    }
    else
    {
      if (!v8[2](v8, @"credit")) {
        goto LABEL_33;
      }
      double v9 = (id *)MEMORY[0x263F839F0];
    }
    objc_storeStrong((id *)p_autoFillTextContentType, *v9);
LABEL_33:
  }
  double v10 = *p_autoFillTextContentType;

  return v10;
}

uint64_t __40__PDFAnnotation_autoFillTextContentType__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) localizedCaseInsensitiveContainsString:v3]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) localizedCaseInsensitiveContainsString:v3];
  }

  return v4;
}

- (void)setAutoFillTextContentType:(id)a3
{
}

- (unint64_t)formContentType
{
  return self->_formContentType;
}

- (void)setFormContentType:(unint64_t)a3
{
  self->_formContentType = a3;
}

- (unint64_t)autofillEntryType
{
  return self->_autofillEntryType;
}

- (void)setAutofillEntryType:(unint64_t)a3
{
  self->_autofillEntryType = a3;
}

- (id)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
}

- (BOOL)handledByPDFKit
{
  return [(PDFAnnotation *)self handledByPDFKitCheckAKEnabled:1];
}

- (BOOL)handledByPDFKitCheckAKEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  char v6 = ShouldRenderAnnotationsInPDFKit();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  uint64_t v8 = [WeakRetained view];

  if (v8) {
    char v6 = [v8 allowsMarkupAnnotationEditing] ^ 1;
  }
  BOOL v9 = v3 && (v6 & 1) != 0
    || ([v5 isEqualToString:@"/Widget"] & 1) != 0
    || ([v5 isEqualToString:@"/Link"] & 1) != 0
    || ([v5 isEqualToString:@"/Text"] & 1) != 0
    || ([v5 isEqualToString:@"/Popup"] & 1) != 0
    || [(PDFAnnotation *)self isMarkupAnnotationSubtype];

  return v9;
}

+ (void)setAnnotationPageLayerEffectIsFlipped:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  id v6 = [v4 threadDictionary];

  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:@"PDFAnnotationPageLayerEffectIsFlippedKey"];
}

+ (BOOL)annotationPageLayerEffectIsFlipped
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"PDFAnnotationPageLayerEffectIsFlippedKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (id)PDFKitAnnotationKeys
{
  if (PDFKitAnnotationKeys_pred != -1) {
    dispatch_once(&PDFKitAnnotationKeys_pred, &__block_literal_global_811);
  }
  v2 = (void *)PDFKitAnnotationKeys_array;

  return v2;
}

uint64_t __37__PDFAnnotation_PDFKitAnnotationKeys__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/AP", @"/AS", @"/Border", @"/C", @"/Contents", @"/F", @"/M", @"/NM", @"/P", @"/Rect", @"/Type", @"/Subtype", @"/A", @"/AA", @"/BS", @"/DA", @"/Dest",
         @"/H",
         @"/InkList",
         @"/IC",
         @"/L",
         @"/LE",
         @"/Name",
         @"/Open",
         @"/Parent",
         @"/Popup",
         @"/Q",
         @"/QuadPoints",
         @"/T",
         @"/AC",
         @"/BC",
         @"/BG",
         @"/CA",
         @"/DV",
         @"/Ff",
         @"/FT",
         @"/MK",
         @"/MaxLen",
         @"/Opt",
         @"/R",
         @"/RC",
         @"/TU",
         @"/V",
         0);
  uint64_t v1 = PDFKitAnnotationKeys_array;
  PDFKitAnnotationKeys_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFKitFieldTypeArray
{
  if (PDFKitFieldTypeArray_pred != -1) {
    dispatch_once(&PDFKitFieldTypeArray_pred, &__block_literal_global_813);
  }
  v2 = (void *)PDFKitFieldTypeArray_array;

  return v2;
}

uint64_t __37__PDFAnnotation_PDFKitFieldTypeArray__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/Btn", @"/Ch", @"/Tx", @"/Sig", 0);
  uint64_t v1 = PDFKitFieldTypeArray_array;
  PDFKitFieldTypeArray_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFKitHighlightingModeArray
{
  if (PDFKitHighlightingModeArray_pred != -1) {
    dispatch_once(&PDFKitHighlightingModeArray_pred, &__block_literal_global_815);
  }
  v2 = (void *)PDFKitHighlightingModeArray_array;

  return v2;
}

uint64_t __44__PDFAnnotation_PDFKitHighlightingModeArray__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/N", @"/I", @"/O", @"/P", @"/T", 0);
  uint64_t v1 = PDFKitHighlightingModeArray_array;
  PDFKitHighlightingModeArray_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFKitSubtypeArray
{
  if (PDFKitSubtypeArray_pred != -1) {
    dispatch_once(&PDFKitSubtypeArray_pred, &__block_literal_global_823);
  }
  v2 = (void *)PDFKitSubtypeArray_array;

  return v2;
}

uint64_t __35__PDFAnnotation_PDFKitSubtypeArray__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/Text", @"/Link", @"/FreeText", @"/Line", @"/Square", @"/Circle", @"/Highlight", @"/Underline", @"/StrikeOut", @"/Stamp", @"/Ink", @"/Popup", @"/Widget", 0);
  uint64_t v1 = PDFKitSubtypeArray_array;
  PDFKitSubtypeArray_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFKitAppearanceDictionaryArray
{
  if (PDFKitAppearanceDictionaryArray_pred != -1) {
    dispatch_once(&PDFKitAppearanceDictionaryArray_pred, &__block_literal_global_825);
  }
  v2 = (void *)PDFKitAppearanceDictionaryArray_array;

  return v2;
}

uint64_t __48__PDFAnnotation_PDFKitAppearanceDictionaryArray__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/N", @"/R", @"/D", 0);
  uint64_t v1 = PDFKitAppearanceDictionaryArray_array;
  PDFKitAppearanceDictionaryArray_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFKitBorderStyleArray
{
  if (PDFKitBorderStyleArray_pred != -1) {
    dispatch_once(&PDFKitBorderStyleArray_pred, &__block_literal_global_827);
  }
  v2 = (void *)PDFKitBorderStyleArray_array;

  return v2;
}

uint64_t __39__PDFAnnotation_PDFKitBorderStyleArray__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/Type", @"/W", @"/S", @"/D", 0);
  uint64_t v1 = PDFKitBorderStyleArray_array;
  PDFKitBorderStyleArray_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (int64_t)MarkupTypeForMarkupStyle:(unint64_t)a3
{
  if (MarkupTypeForMarkupStyle__onceToken != -1) {
    dispatch_once(&MarkupTypeForMarkupStyle__onceToken, &__block_literal_global_835);
  }
  uint64_t v4 = (void *)MarkupTypeForMarkupStyle__styles;
  char v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

void __42__PDFAnnotation_MarkupTypeForMarkupStyle___block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C52E1A8;
  v2[1] = &unk_26C52E1D8;
  v3[0] = &unk_26C52E1C0;
  v3[1] = &unk_26C52E1C0;
  v2[2] = &unk_26C52E1F0;
  v2[3] = &unk_26C52E208;
  v3[2] = &unk_26C52E1C0;
  v3[3] = &unk_26C52E1C0;
  v2[4] = &unk_26C52E220;
  v2[5] = &unk_26C52E238;
  v3[4] = &unk_26C52E1C0;
  v3[5] = &unk_26C52E250;
  v2[6] = &unk_26C52E268;
  v2[7] = &unk_26C52E298;
  v3[6] = &unk_26C52E280;
  v3[7] = &unk_26C52E2B0;
  v2[8] = &unk_26C52E2C8;
  v3[8] = &unk_26C52E2E0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)MarkupTypeForMarkupStyle__styles;
  MarkupTypeForMarkupStyle__styles = v0;
}

+ (id)SubtypeForPDFMarkupStyle:(unint64_t)a3
{
  if (SubtypeForPDFMarkupStyle__onceToken != -1) {
    dispatch_once(&SubtypeForPDFMarkupStyle__onceToken, &__block_literal_global_865);
  }
  uint64_t v4 = (void *)SubtypeForPDFMarkupStyle__subtypes;
  char v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __42__PDFAnnotation_SubtypeForPDFMarkupStyle___block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C52E1A8;
  v2[1] = &unk_26C52E1D8;
  v3[0] = @"/Highlight";
  v3[1] = @"/Highlight";
  v2[2] = &unk_26C52E1F0;
  v2[3] = &unk_26C52E208;
  v3[2] = @"/Highlight";
  v3[3] = @"/Highlight";
  v2[4] = &unk_26C52E220;
  v2[5] = &unk_26C52E238;
  v3[4] = @"/Highlight";
  v3[5] = @"/Underline";
  v2[6] = &unk_26C52E268;
  v2[7] = &unk_26C52E298;
  v3[6] = @"/StrikeOut";
  v3[7] = @"/Redact";
  v2[8] = &unk_26C52E2C8;
  v3[8] = &stru_26C516768;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)SubtypeForPDFMarkupStyle__subtypes;
  SubtypeForPDFMarkupStyle__subtypes = v0;
}

+ (id)PDFMarkupColors
{
  if (PDFMarkupColors_pred != -1) {
    dispatch_once(&PDFMarkupColors_pred, &__block_literal_global_867);
  }
  v2 = (void *)PDFMarkupColors_array;

  return v2;
}

void __32__PDFAnnotation_PDFMarkupColors__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF980]);
  id v10 = [MEMORY[0x263F825C8] colorWithRed:0.980392 green:0.803922 blue:0.352941 alpha:1.0];
  uint64_t v1 = [MEMORY[0x263F825C8] colorWithRed:0.486275 green:0.784314 blue:0.407843 alpha:1.0];
  v2 = [MEMORY[0x263F825C8] colorWithRed:0.411765 green:0.690196 blue:0.945098 alpha:1.0];
  BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.984314 green:0.360784 blue:0.537255 alpha:1.0];
  uint64_t v4 = [MEMORY[0x263F825C8] colorWithRed:0.784314 green:0.521569 blue:0.854902 alpha:1.0];
  char v5 = [MEMORY[0x263F825C8] colorWithRed:0.92549 green:0.156863 blue:0.078431 alpha:1.0];
  id v6 = [MEMORY[0x263F825C8] colorWithRed:0.92549 green:0.156863 blue:0.078431 alpha:1.0];
  int64_t v7 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v8 = objc_msgSend(v0, "initWithObjects:", v10, v1, v2, v3, v4, v5, v6, v7, 0);
  BOOL v9 = (void *)PDFMarkupColors_array;
  PDFMarkupColors_arradouble y = v8;
}

+ (id)PDFTextColors
{
  if (PDFTextColors_pred != -1) {
    dispatch_once(&PDFTextColors_pred, &__block_literal_global_869);
  }
  v2 = (void *)PDFTextColors_array;

  return v2;
}

void __30__PDFAnnotation_PDFTextColors__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF980]);
  id v9 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.92 blue:0.42 alpha:1.0];
  uint64_t v1 = [MEMORY[0x263F825C8] colorWithRed:0.75 green:0.93 blue:0.45 alpha:1.0];
  v2 = [MEMORY[0x263F825C8] colorWithRed:0.67 green:0.85 blue:1.0 alpha:1.0];
  BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.69 blue:0.79 alpha:1.0];
  uint64_t v4 = [MEMORY[0x263F825C8] colorWithRed:0.85 green:0.7 blue:1.0 alpha:1.0];
  char v5 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  id v6 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  uint64_t v7 = objc_msgSend(v0, "initWithObjects:", v9, v1, v2, v3, v4, v5, v6, 0);
  uint64_t v8 = (void *)PDFTextColors_array;
  PDFTextColors_arradouble y = v7;
}

+ (id)PDFTextColorForMarkupStyle:(unint64_t)a3
{
  uint64_t v4 = [a1 PDFTextColors];
  if ([v4 count] <= a3)
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"Annotations", (uint64_t)"markupStyle (%lu) is out of range", v5, v6, v7, v8, v9, a3);
    a3 = 0;
  }
  id v10 = [v4 objectAtIndexedSubscript:a3];

  return v10;
}

+ (id)PDFTextBorderColors
{
  if (PDFTextBorderColors_pred != -1) {
    dispatch_once(&PDFTextBorderColors_pred, &__block_literal_global_873);
  }
  v2 = (void *)PDFTextBorderColors_array;

  return v2;
}

void __36__PDFAnnotation_PDFTextBorderColors__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF980]);
  id v9 = [MEMORY[0x263F825C8] colorWithRed:0.9 green:0.79 blue:0.39 alpha:1.0];
  uint64_t v1 = [MEMORY[0x263F825C8] colorWithRed:0.65 green:0.8 blue:0.38 alpha:1.0];
  v2 = [MEMORY[0x263F825C8] colorWithRed:0.57 green:0.71 blue:0.85 alpha:1.0];
  BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.85 green:0.59 blue:0.67 alpha:1.0];
  uint64_t v4 = [MEMORY[0x263F825C8] colorWithRed:0.71 green:0.59 blue:0.84 alpha:1.0];
  uint64_t v5 = [MEMORY[0x263F825C8] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
  uint64_t v6 = [MEMORY[0x263F825C8] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
  uint64_t v7 = objc_msgSend(v0, "initWithObjects:", v9, v1, v2, v3, v4, v5, v6, 0);
  uint64_t v8 = (void *)PDFTextBorderColors_array;
  PDFTextBorderColors_arradouble y = v7;
}

+ (id)PDFTextBorderColorForMarkupStyle:(unint64_t)a3
{
  uint64_t v4 = [a1 PDFTextBorderColors];
  if ([v4 count] <= a3)
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"Annotations", (uint64_t)"markupStyle (%lu) is out of range", v5, v6, v7, v8, v9, a3);
    a3 = 0;
  }
  id v10 = [v4 objectAtIndexedSubscript:a3];

  return v10;
}

+ (id)PDFFormFieldBackgroundColor
{
  v2 = [MEMORY[0x263F825C8] systemBlueColor];
  BOOL v3 = [v2 colorWithAlphaComponent:0.12];

  return v3;
}

+ (id)PDFMarkupStyleLabels
{
  if (PDFMarkupStyleLabels_pred != -1) {
    dispatch_once(&PDFMarkupStyleLabels_pred, &__block_literal_global_875);
  }
  v2 = (void *)PDFMarkupStyleLabels_array;

  return v2;
}

void __37__PDFAnnotation_PDFMarkupStyleLabels__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF980]);
  PDFKitLocalizedString(@"Yellow");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = PDFKitLocalizedString(@"Green");
  v2 = PDFKitLocalizedString(@"Blue");
  BOOL v3 = PDFKitLocalizedString(@"Pink");
  uint64_t v4 = PDFKitLocalizedString(@"Purple");
  uint64_t v5 = PDFKitLocalizedString(@"Underline");
  uint64_t v6 = PDFKitLocalizedString(@"Strikethrough");
  uint64_t v7 = objc_msgSend(v0, "initWithObjects:", v9, v1, v2, v3, v4, v5, v6, 0);
  uint64_t v8 = (void *)PDFMarkupStyleLabels_array;
  PDFMarkupStyleLabels_arradouble y = v7;
}

+ (id)PDFAnnotationKeysWithStringValues
{
  if (PDFAnnotationKeysWithStringValues_pred != -1) {
    dispatch_once(&PDFAnnotationKeysWithStringValues_pred, &__block_literal_global_895);
  }
  v2 = (void *)PDFAnnotationKeysWithStringValues_array;

  return v2;
}

uint64_t __50__PDFAnnotation_PDFAnnotationKeysWithStringValues__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"/Contents", @"/DA", @"/NM", @"/T", @"/AC", @"/CA", @"/RC", @"/TU", 0);
  uint64_t v1 = PDFAnnotationKeysWithStringValues_array;
  PDFAnnotationKeysWithStringValues_arradouble y = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFAnnotationKeysForRedactionDiscoverability
{
  if (PDFAnnotationKeysForRedactionDiscoverability_pred != -1) {
    dispatch_once(&PDFAnnotationKeysForRedactionDiscoverability_pred, &__block_literal_global_897);
  }
  v2 = (void *)PDFAnnotationKeysForRedactionDiscoverability_set;

  return v2;
}

uint64_t __61__PDFAnnotation_PDFAnnotationKeysForRedactionDiscoverability__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"/P", @"/IC", @"/LE", @"/Border", 0);
  uint64_t v1 = PDFAnnotationKeysForRedactionDiscoverability_set;
  PDFAnnotationKeysForRedactionDiscoverability_set = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)PDFKitAnnotationUndoManagerDisplayNames
{
  if (PDFKitAnnotationUndoManagerDisplayNames_pred != -1) {
    dispatch_once(&PDFKitAnnotationUndoManagerDisplayNames_pred, &__block_literal_global_900);
  }
  v2 = (void *)PDFKitAnnotationUndoManagerDisplayNames_array;

  return v2;
}

void __56__PDFAnnotation_PDFKitAnnotationUndoManagerDisplayNames__block_invoke()
{
  uint64_t v0 = (void *)PDFKitAnnotationUndoManagerDisplayNames_array;
  PDFKitAnnotationUndoManagerDisplayNames_arradouble y = (uint64_t)&unk_26C52E628;
}

+ (id)PresentableStringForAnnotationKey:(id)a3
{
  id v3 = a3;
  if (PresentableStringForAnnotationKey__onceToken != -1) {
    dispatch_once(&PresentableStringForAnnotationKey__onceToken, &__block_literal_global_909);
  }
  uint64_t v4 = [(id)PresentableStringForAnnotationKey__strings objectForKeyedSubscript:v3];
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = @"Annotation Property";
  }

  return v5;
}

void __51__PDFAnnotation_PresentableStringForAnnotationKey___block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"/Rect";
  uint64_t v0 = PDFKitLocalizedString(@"Bounds");
  v6[0] = v0;
  v5[1] = @"/Contents";
  uint64_t v1 = PDFKitLocalizedString(@"Contents");
  v6[1] = v1;
  v5[2] = @"/QuadPoints";
  v2 = PDFKitLocalizedString(@"Range");
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  uint64_t v4 = (void *)PresentableStringForAnnotationKey__strings;
  PresentableStringForAnnotationKey__strings = v3;
}

+ (id)detectedFormFieldDefaultFontName
{
  return @"Helvetica";
}

+ (double)detectedFormFieldDefaultFontSize
{
  return 11.0;
}

+ (id)createDetectedTextFieldWithBounds:(CGRect)a3 font:(id)a4 textContentType:(id)a5 page:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc_init((Class)[a6 annotationSubclassForSubtype:@"/FreeText"]);
  [v14 setValue:MEMORY[0x263EFFA88] forAnnotationKey:@"/AAPL:SFF"];
  [v14 setAutoFillTextContentType:v12];

  uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", x, y, width, height);
  [v14 setValue:v15 forAnnotationKey:@"/Rect"];

  [v14 setValue:@"/FreeText" forAnnotationKey:@"/Subtype"];
  [v14 setFont:v13];

  double v16 = [MEMORY[0x263F825C8] blackColor];
  [v14 setFontColor:v16];

  double v17 = [NSNumber numberWithInteger:0];
  [v14 setValue:v17 forAnnotationKey:@"/Q"];

  return v14;
}

- (CRNormalizedQuad)boundingQuad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  uint64_t v4 = [WeakRetained document];
  uint64_t v5 = [v4 renderingProperties];

  if (!v5) {
    uint64_t v5 = objc_opt_new();
  }
  objc_msgSend(WeakRetained, "boundsForBox:", objc_msgSend(v5, "displayBox"));
  double v7 = v6;
  double v9 = v8;
  CGAffineTransformMakeTranslation(&v21, 0.0, 1.0);
  CGAffineTransform v19 = v21;
  CGAffineTransformScale(&v20, &v19, 1.0 / v7, -1.0 / v9);
  CGAffineTransform v21 = v20;
  [(PDFAnnotation *)self bounds];
  CGAffineTransform v20 = v21;
  CGRect v24 = CGRectApplyAffineTransform(v23, &v20);
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  v19.a = 0.0;
  *(void *)&v19.b = &v19;
  *(void *)&v19.c = 0x2050000000;
  id v14 = (void *)getCRNormalizedQuadClass_softClass;
  *(void *)&v19.d = getCRNormalizedQuadClass_softClass;
  if (!getCRNormalizedQuadClass_softClass)
  {
    *(void *)&v20.a = MEMORY[0x263EF8330];
    *(void *)&v20.b = 3221225472;
    *(void *)&v20.c = __getCRNormalizedQuadClass_block_invoke;
    *(void *)&v20.d = &unk_264203C20;
    *(void *)&v20.tdouble x = &v19;
    __getCRNormalizedQuadClass_block_invoke((uint64_t)&v20);
    id v14 = *(void **)(*(void *)&v19.b + 24);
  }
  uint64_t v15 = v14;
  _Block_object_dispose(&v19, 8);
  id v16 = [v15 alloc];
  double v17 = objc_msgSend(v16, "initWithNormalizedBoundingBox:size:", x, y, width, height, v7, v9, *(void *)&v19.a);

  return (CRNormalizedQuad *)v17;
}

- (unint64_t)fieldSource
{
  return 4;
}

- (unint64_t)fieldType
{
  uint64_t v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v3 isEqualToString:@"/Widget"])
  {
    uint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
    if ([v4 isEqualToString:@"/Tx"])
    {
      unint64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"/Ch"])
    {
      unint64_t v5 = 2;
    }
    else
    {
      unint64_t v5 = -1;
    }
  }
  else if ([v3 isEqualToString:@"/FreeText"])
  {
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

- (NSString)fieldValue
{
  return 0;
}

- (unint64_t)layoutDirection
{
  return 0;
}

- (unint64_t)textContentType
{
  return self->_formContentType;
}

- (void)setTextContentType:(unint64_t)a3
{
  self->_formContentType = a3;
  if (a3 == 50)
  {
    self->_isDetectedSignature = 1;
  }
  else
  {
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2050000000;
    unint64_t v5 = (void *)getVKCFormRegionClass_softClass;
    uint64_t v13 = getVKCFormRegionClass_softClass;
    if (!getVKCFormRegionClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getVKCFormRegionClass_block_invoke;
      v9[3] = &unk_264203C20;
      v9[4] = &v10;
      __getVKCFormRegionClass_block_invoke((uint64_t)v9);
      unint64_t v5 = (void *)v11[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v10, 8);
    double v7 = [v6 autoFillContentTypeForCRContentType:a3];
    autoFillTextContentType = self->_autoFillTextContentType;
    self->_autoFillTextContentType = v7;
  }
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (unint64_t)maxCharacterCount
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_akAnnotationForCopying, 0);
  objc_storeStrong((id *)&self->_akAnnotationAdaptor, 0);
  objc_destroyWeak((id *)&self->_accessibilityNode);
  objc_storeStrong((id *)&self->_quadPoints, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_autoFillTextContentType, 0);
  objc_destroyWeak(&self->_control);
  objc_storeStrong((id *)&self->_widgetOnStateString, 0);
  objc_storeStrong((id *)&self->_pathLock, 0);
  objc_storeStrong((id *)&self->_popup, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_quadPointsIndexSet, 0);
  objc_storeStrong((id *)&self->_cachedAppearances, 0);
  objc_storeStrong((id *)&self->_internalPDFAnnotationDictionary, 0);
  objc_storeStrong((id *)&self->_PDFAnnotationKeyMapping, 0);
  objc_storeStrong((id *)&self->_PDFAnnotationDictionary, 0);
  objc_storeStrong((id *)&self->_pdfAnnotationUUID, 0);

  objc_destroyWeak((id *)&self->_page);
}

- (UIFont)font
{
  uint64_t v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/DA"];
  uint64_t v4 = [(PDFAnnotation *)self getFontFromAppearanceNSString:v3];

  return (UIFont *)v4;
}

- (void)setFont:(UIFont *)font
{
  id v6 = (id)[(UIFont *)font copy];
  uint64_t v4 = [(PDFAnnotation *)self fontColor];
  unint64_t v5 = [(PDFAnnotation *)self createDefaultAppearanceStringWithFont:v6 fontColor:v4];
  if (v5) {
    [(PDFAnnotation *)self setValue:v5 forAnnotationKey:@"/DA"];
  }
}

- (UIColor)fontColor
{
  uint64_t v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/DA"];
  uint64_t v4 = [(PDFAnnotation *)self getColorFromAppearanceNSString:v3];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] blackColor];
  }

  return (UIColor *)v4;
}

- (void)setFontColor:(UIColor *)fontColor
{
  id v7 = (id) [(UIColor *)fontColor copy];
  if (CGColorGetPattern((CGColorRef)[v7 CGColor]))
  {
    NSLog(&cfstr_PdfkitSetfontc.isa);
    uint64_t v4 = [MEMORY[0x263F825C8] clearColor];

    id v7 = (id)v4;
  }
  unint64_t v5 = [(PDFAnnotation *)self font];
  id v6 = [(PDFAnnotation *)self createDefaultAppearanceStringWithFont:v5 fontColor:v7];
  if (v6) {
    [(PDFAnnotation *)self setValue:v6 forAnnotationKey:@"/DA"];
  }
}

- (UIColor)interiorColor
{
  return (UIColor *)[(PDFAnnotation *)self valueForAnnotationKey:@"/IC"];
}

- (void)setInteriorColor:(UIColor *)interiorColor
{
  id v4 = (id)[(UIColor *)interiorColor copy];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/IC"];
}

- (NSTextAlignment)alignment
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Q"];
  uint64_t v3 = [v2 integerValue];

  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (void)setAlignment:(NSTextAlignment)alignment
{
  if ((unint64_t)(alignment - 1) > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_214423060[alignment - 1];
  }
  id v5 = [NSNumber numberWithInteger:v4];
  [(PDFAnnotation *)self setValue:v5 forAnnotationKey:@"/Q"];
}

- (CGPoint)startPoint
{
  uint64_t v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/L"];
  uint64_t v4 = [v3 objectAtIndex:0];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [v3 objectAtIndex:1];
  [v7 doubleValue];
  double v9 = PDFPointMake(v6, v8);
  double v11 = v10;

  [(PDFAnnotation *)self bounds];
  double v13 = v9 - v12;
  double v15 = v11 - v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)setStartPoint:(CGPoint)startPoint
{
  double y = startPoint.y;
  double x = startPoint.x;
  id v17 = [(PDFAnnotation *)self valueForAnnotationKey:@"/L"];
  if (!v17)
  {
    double v6 = [NSNumber numberWithDouble:0.0];
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, v6, v6, v6, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(PDFAnnotation *)self bounds];
  double v8 = x + v7;
  double v10 = y + v9;
  id v11 = objc_alloc(MEMORY[0x263EFF8C0]);
  double v12 = [NSNumber numberWithDouble:v8];
  double v13 = [NSNumber numberWithDouble:v10];
  double v14 = [v17 objectAtIndex:2];
  double v15 = [v17 objectAtIndex:3];
  double v16 = objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, 0);

  [(PDFAnnotation *)self setValue:v16 forAnnotationKey:@"/L"];
}

- (CGPoint)endPoint
{
  uint64_t v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/L"];
  uint64_t v4 = [v3 objectAtIndex:2];
  [v4 doubleValue];
  double v6 = v5;
  double v7 = [v3 objectAtIndex:3];
  [v7 doubleValue];
  double v9 = PDFPointMake(v6, v8);
  double v11 = v10;

  [(PDFAnnotation *)self bounds];
  double v13 = v9 - v12;
  double v15 = v11 - v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)setEndPoint:(CGPoint)endPoint
{
  double y = endPoint.y;
  double x = endPoint.x;
  id v17 = [(PDFAnnotation *)self valueForAnnotationKey:@"/L"];
  if (!v17)
  {
    double v6 = [NSNumber numberWithDouble:0.0];
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, v6, v6, v6, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(PDFAnnotation *)self bounds];
  double v8 = x + v7;
  double v10 = y + v9;
  id v11 = objc_alloc(MEMORY[0x263EFF8C0]);
  double v12 = [v17 objectAtIndex:0];
  double v13 = [v17 objectAtIndex:1];
  double v14 = [NSNumber numberWithDouble:v8];
  double v15 = [NSNumber numberWithDouble:v10];
  double v16 = objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, 0);

  [(PDFAnnotation *)self setValue:v16 forAnnotationKey:@"/L"];
}

- (PDFLineStyle)startLineStyle
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/LE"];
  if (!v2)
  {
    v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/None", 0);
  }
  uint64_t v3 = [v2 objectAtIndex:0];
  PDFLineStyle v4 = +[PDFAnnotation lineStyleFromName:v3];

  return v4;
}

- (void)setStartLineStyle:(PDFLineStyle)startLineStyle
{
  if ((unint64_t)startLineStyle < (kPDFLineStyleOpenArrow|kPDFLineStyleCircle))
  {
    uint64_t v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/LE"];
    if (!v5)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/None", 0);
    }
    id v10 = (id)v5;
    double v6 = +[PDFAnnotation nameForLineStyle:startLineStyle];
    id v7 = objc_alloc(MEMORY[0x263EFF8C0]);
    double v8 = [v10 objectAtIndex:1];
    double v9 = objc_msgSend(v7, "initWithObjects:", v6, v8, 0);

    [(PDFAnnotation *)self setValue:v9 forAnnotationKey:@"/LE"];
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"setStartLineStyle: %ld out of range", startLineStyle);
  }
}

- (PDFLineStyle)endLineStyle
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/LE"];
  if (!v2)
  {
    v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/None", 0);
  }
  uint64_t v3 = [v2 objectAtIndex:1];
  PDFLineStyle v4 = +[PDFAnnotation lineStyleFromName:v3];

  return v4;
}

- (void)setEndLineStyle:(PDFLineStyle)endLineStyle
{
  if ((unint64_t)endLineStyle < (kPDFLineStyleOpenArrow|kPDFLineStyleCircle))
  {
    uint64_t v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/LE"];
    if (!v5)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/None", 0);
    }
    id v10 = (id)v5;
    double v6 = +[PDFAnnotation nameForLineStyle:endLineStyle];
    id v7 = objc_alloc(MEMORY[0x263EFF8C0]);
    double v8 = [v10 objectAtIndex:0];
    double v9 = objc_msgSend(v7, "initWithObjects:", v8, v6, 0);

    [(PDFAnnotation *)self setValue:v9 forAnnotationKey:@"/LE"];
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"setEndLineStyle: %ld out of range", endLineStyle);
  }
}

- (PDFTextAnnotationIconType)iconType
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Name"];
  if ([v2 isEqualToString:@"/Comment"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconComment;
  }
  else if ([v2 isEqualToString:@"/Key"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconKey;
  }
  else if ([v2 isEqualToString:@"/Note"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconNote;
  }
  else if ([v2 isEqualToString:@"/Help"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconHelp;
  }
  else if ([v2 isEqualToString:@"/NewParagraph"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconNewParagraph;
  }
  else if ([v2 isEqualToString:@"/Paragraph"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconParagraph;
  }
  else if ([v2 isEqualToString:@"/Insert"])
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconInsert;
  }
  else
  {
    PDFTextAnnotationIconType v3 = kPDFTextAnnotationIconNote;
  }

  return v3;
}

- (void)setIconType:(PDFTextAnnotationIconType)iconType
{
  if ((unint64_t)iconType >= (kPDFTextAnnotationIconInsert|kPDFTextAnnotationIconKey)) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"setIconType: %ld out of range", iconType);
  }
  if ((unint64_t)iconType <= kPDFTextAnnotationIconInsert)
  {
    uint64_t v5 = off_2642048B0[iconType];
    [(PDFAnnotation *)self setValue:v5 forAnnotationKey:@"/Name"];
  }
}

- (NSArray)quadrilateralPoints
{
  PDFTextAnnotationIconType v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/QuadPoints"];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(PDFAnnotation *)self bounds];
  double v6 = v5;
  double v8 = v7;
  if ([v3 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v3 objectAtIndex:v9];
      [v10 PDFKitPDFPointValue];
      double v12 = v11;
      double v14 = v13;

      double v15 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", v12 - v6, v14 - v8);
      [v4 addObject:v15];

      ++v9;
    }
    while ([v3 count] > v9);
  }

  return (NSArray *)v4;
}

- (void)setQuadrilateralPoints:(NSArray *)quadrilateralPoints
{
  double v16 = quadrilateralPoints;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(PDFAnnotation *)self bounds];
  double v6 = v5;
  double v8 = v7;
  if ([(NSArray *)v16 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [(NSArray *)v16 objectAtIndex:v9];
      [v10 PDFKitPDFPointValue];
      double v12 = v11;
      double v14 = v13;

      double v15 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", v6 + v12, v8 + v14);
      [v4 addObject:v15];

      ++v9;
    }
    while ([(NSArray *)v16 count] > v9);
  }
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/QuadPoints"];
  [(PDFAnnotation *)self updateAnnotationEffect];
}

- (PDFMarkupType)markupType
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v2 isEqualToString:@"/Underline"])
  {
    PDFMarkupType v3 = kPDFMarkupTypeUnderline;
  }
  else if ([v2 isEqualToString:@"/StrikeOut"])
  {
    PDFMarkupType v3 = kPDFMarkupTypeStrikeOut;
  }
  else if ([v2 isEqualToString:@"/Redact"])
  {
    PDFMarkupType v3 = kPDFMarkupTypeRedact;
  }
  else
  {
    PDFMarkupType v3 = kPDFMarkupTypeHighlight;
  }

  return v3;
}

- (void)setMarkupType:(PDFMarkupType)markupType
{
  if ((unint64_t)markupType <= kPDFMarkupTypeUnderline) {
    [(PDFAnnotation *)self setValue:off_2642048E8[markupType] forAnnotationKey:@"/Subtype"];
  }
}

- (NSString)widgetFieldType
{
  return (NSString *)[(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
}

- (void)setWidgetFieldType:(NSString *)widgetFieldType
{
  id v5 = (id)[(NSString *)widgetFieldType copy];
  id v4 = [(PDFAnnotation *)self widgetFieldType];

  [(PDFAnnotation *)self setValue:v5 forAnnotationKey:@"/FT"];
  if (!v4) {
    [(PDFAnnotation *)self secondaryInit];
  }
}

- (PDFWidgetControlType)widgetControlType
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Ff"];
  unsigned int v3 = [v2 integerValue];

  if ((v3 & 0x8000) != 0) {
    return 1;
  }
  else {
    return (unint64_t)(~(v3 >> 15) & 2);
  }
}

- (void)setWidgetControlType:(PDFWidgetControlType)widgetControlType
{
  id v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Ff"];
  uint64_t v6 = [v5 integerValue];

  PDFWidgetControlType v7 = [(PDFAnnotation *)self widgetControlType];
  if (v7)
  {
    if (v7 == kPDFWidgetRadioButtonControl) {
      unint64_t v8 = v6 & 0xFFFFFFFFFFFF7FFFLL;
    }
    else {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = v6 & 0xFFFFFFFFFFFEFFFFLL;
  }
  uint64_t v9 = v8 | 0x10000;
  if (widgetControlType == kPDFWidgetRadioButtonControl) {
    v8 |= 0x8000uLL;
  }
  if (widgetControlType) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v9;
  }
  id v11 = [NSNumber numberWithInteger:v10];
  [(PDFAnnotation *)self setValue:v11 forAnnotationKey:@"/Ff"];
}

- (BOOL)_BOOLValueForAnnotationFlag:(unint64_t)a3 withDefaultValue:(BOOL)a4
{
  uint64_t v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/F"];
  PDFWidgetControlType v7 = v6;
  if (v6) {
    a4 = (a3 & ~[v6 unsignedIntegerValue]) == 0;
  }

  return a4;
}

- (void)_setBoolValue:(BOOL)a3 forAnnotationFlag:(unint64_t)a4
{
  unsigned int v4 = a4;
  BOOL v5 = a3;
  PDFWidgetControlType v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/F"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v5) {
    unint64_t v9 = v8 | v4;
  }
  else {
    unint64_t v9 = v8 & ~(unint64_t)v4;
  }
  id v10 = [NSNumber numberWithUnsignedInteger:v9];
  [(PDFAnnotation *)self setValue:v10 forAnnotationKey:@"/F"];
}

- (BOOL)isInvisible
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:1 withDefaultValue:0];
}

- (void)setInvisible:(BOOL)a3
{
}

- (BOOL)isHidden
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:2 withDefaultValue:0];
}

- (void)setHidden:(BOOL)a3
{
}

- (BOOL)shouldPrint
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:4 withDefaultValue:1];
}

- (void)setShouldPrint:(BOOL)shouldPrint
{
}

- (BOOL)shouldNotZoom
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:8 withDefaultValue:0];
}

- (void)setShouldNotZoom:(BOOL)a3
{
}

- (BOOL)shouldNotRotate
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:16 withDefaultValue:0];
}

- (void)setShouldNotRotate:(BOOL)a3
{
}

- (BOOL)shouldDisplay
{
  return ![(PDFAnnotation *)self _BOOLValueForAnnotationFlag:32 withDefaultValue:0];
}

- (void)setShouldDisplay:(BOOL)shouldDisplay
{
  [(PDFAnnotation *)self _setBoolValue:!shouldDisplay forAnnotationFlag:32];

  [(PDFAnnotation *)self updateAnnotationEffect];
}

- (BOOL)isReadOnlyAnnotation
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:64 withDefaultValue:0];
}

- (void)setReadOnlyAnnotation:(BOOL)a3
{
}

- (BOOL)isLocked
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:128 withDefaultValue:0];
}

- (void)setLocked:(BOOL)a3
{
}

- (BOOL)shouldToggleNoView
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:256 withDefaultValue:0];
}

- (void)setShouldToggleNoView:(BOOL)a3
{
}

- (BOOL)contentsLocked
{
  return [(PDFAnnotation *)self _BOOLValueForAnnotationFlag:512 withDefaultValue:0];
}

- (void)setContentsLocked:(BOOL)a3
{
}

- (BOOL)_BOOLValueForWidgetFieldFlag:(unint64_t)a3
{
  unsigned int v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Ff"];
  uint64_t v5 = [v4 integerValue];

  return (a3 & ~v5) == 0;
}

- (void)_setBoolValue:(BOOL)a3 forWidgetFieldFlag:(unint64_t)a4
{
  unsigned int v4 = a4;
  BOOL v5 = a3;
  PDFWidgetControlType v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Ff"];
  uint64_t v8 = [v7 integerValue];

  if (v5) {
    unint64_t v9 = v8 | v4;
  }
  else {
    unint64_t v9 = v8 & ~(unint64_t)v4;
  }
  id v10 = [NSNumber numberWithInteger:v9];
  [(PDFAnnotation *)self setValue:v10 forAnnotationKey:@"/Ff"];
}

- (BOOL)isMultiline
{
  return [(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:4096];
}

- (void)setMultiline:(BOOL)multiline
{
}

- (BOOL)isActivatableTextField
{
  unsigned int v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/AAPL:SFF"];

  if (v3) {
    return 1;
  }
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  uint64_t v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v5 isEqualToString:@"/Widget"]) {
    int v7 = [v6 isEqualToString:@"/Tx"] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  if ([(PDFAnnotation *)self shouldDisplay]) {
    BOOL v8 = [(PDFAnnotation *)self isHidden];
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = [(PDFAnnotation *)self shouldDisplay];
  int v10 = v9 & ![(PDFAnnotation *)self isReadOnly];
  if ((v7 | v8)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v10;
  }

  return v4;
}

- (BOOL)isPasswordField
{
  return [(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:0x2000];
}

- (BOOL)hasComb
{
  return [(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:0x1000000];
}

- (void)setComb:(BOOL)comb
{
}

- (NSInteger)maximumLength
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MaxLen"];
  NSInteger v3 = [v2 integerValue];

  return v3;
}

- (void)setMaximumLength:(NSInteger)maximumLength
{
  id v4 = [NSNumber numberWithInteger:maximumLength];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/MaxLen"];
}

- (NSString)widgetStringValue
{
  NSInteger v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v4 isEqualToString:@"/Widget"])
  {
    uint64_t v6 = [(PDFAnnotation *)self fieldName];
    if (v6)
    {
      int v7 = [(PDFAnnotation *)self page];
      BOOL v8 = [v7 document];
      BOOL v9 = [v8 formData];
      int v10 = [v9 stringValueForFieldNamed:v6];
    }
    else
    {
      int v10 = 0;
    }
    if ([v5 isEqualToString:@"/Ch"])
    {
      uint64_t v12 = [(PDFAnnotation *)self _textForValue:v10];

      int v10 = (void *)v12;
    }
    if (v10) {
      double v13 = v10;
    }
    else {
      double v13 = v3;
    }
    id v11 = v13;
  }
  else
  {
    id v11 = v3;
  }

  return (NSString *)v11;
}

- (void)setWidgetStringValue:(NSString *)widgetStringValue
{
  id v7 = (id)[(NSString *)widgetStringValue copy];
  id v4 = -[PDFAnnotation replaceTextWidgetWithString:](self, "replaceTextWidgetWithString:");
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/V"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v5 isEqualToString:@"/Widget"]
    && [(PDFAnnotation *)self isFullyConstructed])
  {
    uint64_t v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
    if ([v6 isEqualToString:@"/Ch"]) {
      [(PDFAnnotation *)self removeValueForAnnotationKey:@"/AP"];
    }
    [(PDFAnnotation *)self updateFormData];
  }
}

- (NSString)widgetDefaultStringValue
{
  NSInteger v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/DV"];
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if (!v3)
  {
    if ([v4 isEqualToString:@"/Widget"])
    {
      if ([v5 isEqualToString:@"/Tx"]) {
        NSInteger v3 = &stru_26C516768;
      }
      else {
        NSInteger v3 = 0;
      }
    }
    else
    {
      NSInteger v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (void)setWidgetDefaultStringValue:(NSString *)widgetDefaultStringValue
{
  id v4 = (id)[(NSString *)widgetDefaultStringValue copy];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/DV"];
}

- (BOOL)allowsToggleToOff
{
  PDFWidgetControlType v3 = [(PDFAnnotation *)self widgetControlType];
  if (v3) {
    LOBYTE(v3) = ![(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:0x4000];
  }
  return v3;
}

- (void)setAllowsToggleToOff:(BOOL)allowsToggleToOff
{
  BOOL v3 = allowsToggleToOff;
  if ([(PDFAnnotation *)self widgetControlType])
  {
    [(PDFAnnotation *)self _setBoolValue:!v3 forWidgetFieldFlag:0x4000];
  }
}

- (BOOL)radiosInUnison
{
  PDFWidgetControlType v3 = [(PDFAnnotation *)self widgetControlType];
  if (v3)
  {
    LOBYTE(v3) = [(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:0x2000000];
  }
  return v3;
}

- (void)setRadiosInUnison:(BOOL)radiosInUnison
{
  BOOL v3 = radiosInUnison;
  if ([(PDFAnnotation *)self widgetControlType])
  {
    [(PDFAnnotation *)self _setBoolValue:v3 forWidgetFieldFlag:0x2000000];
  }
}

- (BOOL)isReadOnly
{
  return [(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:1];
}

- (void)setReadOnly:(BOOL)readOnly
{
}

- (BOOL)isListChoice
{
  return ![(PDFAnnotation *)self _BOOLValueForWidgetFieldFlag:0x20000];
}

- (void)setListChoice:(BOOL)listChoice
{
}

- (NSArray)choices
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Opt"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v2 count])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [v2 objectAtIndex:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 addObject:v5];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = [v5 objectAtIndex:1];
          [v3 addObject:v6];
        }
      }

      ++v4;
    }
    while ([v2 count] > v4);
  }

  return (NSArray *)v3;
}

- (void)setChoices:(NSArray *)choices
{
  double v15 = choices;
  unint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Opt"];
  BOOL v5 = v4;
  if (v4
    && (uint64_t v6 = [v4 count], v6 == -[NSArray count](v15, "count"))
    && ([v5 objectAtIndex:0],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v5 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v5 objectAtIndex:v10];
        id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
        double v13 = [v11 objectAtIndex:0];
        [v12 addObject:v13];

        double v14 = [(NSArray *)v15 objectAtIndex:v10];
        [v12 addObject:v14];

        [v9 addObject:v12];
        ++v10;
      }
      while ([v5 count] > v10);
    }
    [(PDFAnnotation *)self setValue:v9 forAnnotationKey:@"/Opt"];
  }
  else
  {
    [(PDFAnnotation *)self setValue:v15 forAnnotationKey:@"/Opt"];
  }
}

- (NSArray)values
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Opt"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v2 count])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [v2 objectAtIndex:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v5 objectAtIndex:0];
        [v3 addObject:v6];
      }
      ++v4;
    }
    while ([v2 count] > v4);
  }

  return (NSArray *)v3;
}

- (void)setValues:(NSArray *)values
{
  double v13 = values;
  unint64_t v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Opt"];
  BOOL v5 = v4;
  if (v4 && (uint64_t v6 = [v4 count], v6 == -[NSArray count](v13, "count")))
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = [v5 objectAtIndex:v8];
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v11 = [(NSArray *)v13 objectAtIndex:v8];
        [v10 addObject:v11];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 addObject:v9];
        }
        else
        {
          id v12 = [v9 objectAtIndex:1];
          [v10 addObject:v12];
        }
        [v7 addObject:v10];

        ++v8;
      }
      while ([v5 count] > v8);
    }
    [(PDFAnnotation *)self setValue:v7 forAnnotationKey:@"/Opt"];
  }
  else
  {
    [(PDFAnnotation *)self setValue:v13 forAnnotationKey:@"/Opt"];
  }
}

- (id)_textForValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDFAnnotation *)self choices];
  uint64_t v6 = [(PDFAnnotation *)self values];
  id v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v8 = [v6 count];
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0;
  while (1)
  {
    id v11 = [v7 objectAtIndex:v10];
    int v12 = [v11 isEqualToString:v4];

    if (v12) {
      break;
    }
    if (v9 == ++v10) {
      goto LABEL_9;
    }
  }
  if ([v5 count] <= v10
    || ([v5 objectAtIndex:v10], (id v13 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_9:
    id v13 = v4;
  }

  return v13;
}

- (PDFWidgetCellState)buttonWidgetState
{
  id v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v3 isEqualToString:@"/Widget"]
    && [v4 isEqualToString:@"/Btn"])
  {
    BOOL v5 = [(PDFAnnotation *)self widgetOnStateString];
    uint64_t v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/V"];
    PDFWidgetCellState v7 = (unint64_t)[v6 isEqualToString:v5];
    uint64_t v8 = [(PDFAnnotation *)self fieldName];
    if (v8)
    {
      uint64_t v9 = [(PDFAnnotation *)self page];
      if (v9)
      {
        unint64_t v10 = v9;
        id v11 = [v9 document];
        if (v11)
        {
          int v12 = v11;
          id v13 = [v11 formData];
          double v14 = v13;
          if (v13)
          {
            double v15 = [v13 fieldNamed:v8];
            PDFWidgetCellState v16 = v7;
            if (v15)
            {
              id v19 = v15;
              double v18 = [v15 stringValue];
              PDFWidgetCellState v16 = (unint64_t)[v18 isEqualToString:v5];

              double v15 = v19;
            }

            goto LABEL_14;
          }
        }
      }
    }
    PDFWidgetCellState v16 = v7;
LABEL_14:

    goto LABEL_15;
  }
  PDFWidgetCellState v16 = kPDFWidgetMixedState;
LABEL_15:

  return v16;
}

- (void)setButtonWidgetState:(PDFWidgetCellState)buttonWidgetState
{
  id v8 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  BOOL v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/FT"];
  if ([v8 isEqualToString:@"/Widget"]
    && [v5 isEqualToString:@"/Btn"]
    && [(PDFAnnotation *)self widgetControlType])
  {
    if (buttonWidgetState)
    {
      uint64_t v6 = [(PDFAnnotation *)self widgetOnStateString];
      PDFWidgetCellState v7 = v6 ? v6 : @"Yes";
      [(PDFAnnotation *)self setValue:v7 forAnnotationKey:@"/V"];
    }
    else
    {
      [(PDFAnnotation *)self setValue:@"Off" forAnnotationKey:@"/V"];
    }
    if ([(PDFAnnotation *)self isFullyConstructed]) {
      [(PDFAnnotation *)self updateFormData];
    }
  }
}

- (void)setButtonWidgetStateString:(NSString *)buttonWidgetStateString
{
  id v4 = (id)[(NSString *)buttonWidgetStateString copy];
  [(PDFAnnotation *)self setWidgetOnStateString:v4];
}

- (BOOL)isOpen
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Open"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setOpen:(BOOL)open
{
  id v4 = [NSNumber numberWithBool:open];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/Open"];
}

- (NSArray)paths
{
  return (NSArray *)[(PDFAnnotation *)self valueForAnnotationKey:@"/InkList"];
}

- (PDFDestination)destination
{
  id v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if (![v3 isEqualToString:@"/Link"])
  {
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/A"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = [v4 destination];
  }
  else
  {
    uint64_t v5 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Dest"];
  }
  uint64_t v6 = (void *)v5;
LABEL_9:

LABEL_10:

  return (PDFDestination *)v6;
}

- (void)setDestination:(PDFDestination *)destination
{
  uint64_t v5 = destination;
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v4 isEqualToString:@"/Link"])
  {
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/A"];
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/Dest"];
    [(PDFAnnotation *)self setValue:v5 forAnnotationKey:@"/Dest"];
  }
}

- (NSURL)URL
{
  id v3 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v3 isEqualToString:@"/Link"])
  {
    id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/A"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v5 = [v4 URL];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSURL *)v5;
}

- (void)setURL:(NSURL *)URL
{
  id v8 = URL;
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/Subtype"];
  if ([v4 isEqualToString:@"/Link"])
  {
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/A"];
    [(PDFAnnotation *)self removeValueForAnnotationKey:@"/Dest"];
    uint64_t v5 = (void *)[(NSURL *)v8 copy];
    uint64_t v6 = [(PDFAnnotation *)self valueForAnnotationKey:@"/A"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v6 setURL:v5];
    }
    else
    {
      PDFWidgetCellState v7 = [[PDFActionURL alloc] initWithURL:v5];

      uint64_t v6 = v7;
    }
    [(PDFAnnotation *)self setValue:v6 forAnnotationKey:@"/A"];
  }
}

- (NSString)fieldName
{
  return (NSString *)[(PDFAnnotation *)self valueForAnnotationKey:@"/T"];
}

- (void)setFieldName:(NSString *)fieldName
{
  id v4 = (id)[(NSString *)fieldName copy];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/T"];
}

- (NSString)caption
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MK"];
  id v3 = [v2 caption];

  return (NSString *)v3;
}

- (void)setCaption:(NSString *)caption
{
  id v5 = (id)[(NSString *)caption copy];
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MK"];
  if (!v4)
  {
    id v4 = objc_alloc_init(PDFAppearanceCharacteristics);
    [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/MK"];
  }
  [(PDFAppearanceCharacteristics *)v4 setCaption:v5];
  [(PDFAnnotation *)self updateAnnotationEffect];
}

- (UIColor)backgroundColor
{
  v2 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MK"];
  id v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  id v5 = (id)[(UIColor *)backgroundColor copy];
  id v4 = [(PDFAnnotation *)self valueForAnnotationKey:@"/MK"];
  if (!v4)
  {
    id v4 = objc_alloc_init(PDFAppearanceCharacteristics);
    [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/MK"];
  }
  [(PDFAppearanceCharacteristics *)v4 setBackgroundColor:v5];
  [(PDFAnnotation *)self updateAnnotationEffect];
}

- (NSString)stampName
{
  return (NSString *)[(PDFAnnotation *)self valueForAnnotationKey:@"/Name"];
}

- (void)setStampName:(NSString *)stampName
{
  id v4 = (id)[(NSString *)stampName copy];
  [(PDFAnnotation *)self setValue:v4 forAnnotationKey:@"/Name"];
}

+ (PDFLineStyle)lineStyleFromName:(NSString *)name
{
  id v3 = name;
  if ([(NSString *)v3 isEqualToString:@"/Square"])
  {
    PDFLineStyle v4 = kPDFLineStyleSquare;
  }
  else if ([(NSString *)v3 isEqualToString:@"/Circle"])
  {
    PDFLineStyle v4 = kPDFLineStyleCircle;
  }
  else if ([(NSString *)v3 isEqualToString:@"/Diamond"])
  {
    PDFLineStyle v4 = kPDFLineStyleDiamond;
  }
  else if ([(NSString *)v3 isEqualToString:@"/OpenArrow"])
  {
    PDFLineStyle v4 = kPDFLineStyleOpenArrow;
  }
  else if ([(NSString *)v3 isEqualToString:@"/ClosedArrow"])
  {
    PDFLineStyle v4 = kPDFLineStyleClosedArrow;
  }
  else
  {
    PDFLineStyle v4 = kPDFLineStyleNone;
  }

  return v4;
}

+ (NSString)nameForLineStyle:(PDFLineStyle)style
{
  if ((unint64_t)(style - 1) > 4) {
    return (NSString *)@"/None";
  }
  else {
    return &off_264204900[style - 1]->isa;
  }
}

- (void)addBezierPath:(UIBezierPath *)path
{
  PDFLineStyle v4 = path;
  id v5 = [(PDFAnnotation *)self pathLock];
  [v5 lock];

  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  PDFWidgetCellState v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/InkList"];
  id v9 = [v6 arrayWithArray:v7];

  [(PDFAnnotation *)self releaseCGPathArray];
  [v9 addObject:v4];

  [(PDFAnnotation *)self setValue:v9 forAnnotationKey:@"/InkList"];
  id v8 = [(PDFAnnotation *)self pathLock];
  [v8 unlock];
}

- (void)removeBezierPath:(UIBezierPath *)path
{
  PDFLineStyle v4 = path;
  id v5 = [(PDFAnnotation *)self pathLock];
  [v5 lock];

  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  PDFWidgetCellState v7 = [(PDFAnnotation *)self valueForAnnotationKey:@"/InkList"];
  id v9 = [v6 arrayWithArray:v7];

  [(PDFAnnotation *)self releaseCGPathArray];
  [v9 removeObject:v4];

  [(PDFAnnotation *)self setValue:v9 forAnnotationKey:@"/InkList"];
  id v8 = [(PDFAnnotation *)self pathLock];
  [v8 unlock];
}

@end