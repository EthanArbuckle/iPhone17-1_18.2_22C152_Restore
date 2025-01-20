@interface MUCGPDFTextWidgetAnnotationAdaptor
+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4;
@end

@implementation MUCGPDFTextWidgetAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (v5) {
    goto LABEL_35;
  }
  CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
  CGPDFInteger v16 = 0;
  CGPDFDictionaryRef value = 0;
  CGPDFStringRef string = 0;
  id v5 = (id)objc_opt_new();
  [v5 setTextIsFixedWidth:1];
  [v5 setTextIsFixedHeight:0];
  +[MUPDFAnnotationAdaptorHelper migrateAKStrokedAnnotationPropertiesTo:v5 fromAnnotationDictionary:CGPDFDictionary ofPDFPage:a4];
  +[MUPDFAnnotationAdaptorHelper migrateAKFilledAnnotationPropertiesTo:v5 fromAnnotationDictionary:CGPDFDictionary ofPDFPage:a4];
  +[MUPDFAnnotationAdaptorHelper migrateAKRectangularShapeAnnotationPropertiesTo:v5 fromAnnotationDictionary:CGPDFDictionary ofPDFPage:a4];
  if (!CGPDFDictionaryGetDictionary(CGPDFDictionary, "Parent", &value)) {
    CGPDFDictionaryRef value = 0;
  }
  v7 = +[MUPDFAnnotationAdaptorHelper getFullFieldNameFromAnnotationDictionary:CGPDFDictionary];
  [v5 setFieldName:v7];

  if (!CGPDFDictionaryGetInteger(CGPDFDictionary, "Ff", &v16) && value) {
    CGPDFDictionaryGetInteger(value, "Ff", &v16);
  }
  if (CGPDFDictionaryGetString(CGPDFDictionary, "V", &string) || value && CGPDFDictionaryGetString(value, "V", &string)) {
    v8 = (__CFString *)CGPDFStringCopyTextString(string);
  }
  else {
    v8 = 0;
  }
  if (CGPDFDictionaryGetString(CGPDFDictionary, "DV", &string)
    || value && CGPDFDictionaryGetString(value, "DV", &string))
  {
    v9 = (__CFString *)CGPDFStringCopyTextString(string);
    if (v9) {
      [v5 setCustomPlaceholderText:v9];
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (CGPDFDictionaryGetString(CGPDFDictionary, "DA", &string))
  {
    CGPDFDictionaryRef v11 = CGPDFDictionary;
LABEL_23:
    +[MUPDFAnnotationAdaptorHelper readDefaultAppearanceStringFromPDFDictionary:v11 ofPage:a4 toDictionary:v10];
    goto LABEL_24;
  }
  if (value && CGPDFDictionaryGetString(value, "DA", &string))
  {
    CGPDFDictionaryRef v11 = value;
    goto LABEL_23;
  }
LABEL_24:
  if (CGPDFDictionaryGetString(CGPDFDictionary, "Q", &string))
  {
    CGPDFDictionaryRef v12 = CGPDFDictionary;
  }
  else
  {
    if (!value || !CGPDFDictionaryGetString(value, "Q", &string)) {
      goto LABEL_30;
    }
    CGPDFDictionaryRef v12 = value;
  }
  +[MUPDFAnnotationAdaptorHelper readQuaddingFromPDFDictionary:v12 toDictionary:v10];
LABEL_30:
  if ([(__CFString *)v8 length])
  {
    v13 = (void *)[MEMORY[0x263F24C58] newTextStorageOriginalFontSavvyWithString:v8 attributes:v10];
    [v5 setAnnotationText:v13];
  }
  else if (![(__CFString *)v9 length])
  {
    [v5 setShouldUsePlaceholderText:0];
  }
  [v5 setTypingAttributes:v10];
  objc_msgSend(v5, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
  [v5 setOriginalModelBaseScaleFactor:1.0];
  [MEMORY[0x263F24BB8] adjustAnnotationBoundsToFitText:v5];
  [v5 setOriginalExifOrientation:0];
  [v5 setOriginalModelBaseScaleFactor:0.0];

LABEL_35:
  return v5;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5 = a3;
  v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = (void *)MEMORY[0x263EFF9A0];
    id v9 = v5;
    v10 = [v8 dictionary];
    [v10 setValue:@"/Annot" forKey:@"/Type"];
    [v10 setValue:@"/Widget" forKey:@"/Subtype"];
    +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:v9 forPage:a4 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addDefaultAppearanceStreamOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addBorderStyleOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addQuaddingOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:v9 toDictionary:v10];
    [v10 setObject:@"/Tx" forKey:@"/FT"];
    +[MUPDFAnnotationAdaptorHelper addTextOfAnnotation:v9 toDictionary:v10 forKey:@"/V" canUsePlaceholder:0];
    CGPDFDictionaryRef v11 = [v9 customPlaceholderText];
    +[MUPDFAnnotationAdaptorHelper addString:v11 toDictionary:v10 forKey:@"/DV"];

    CGPDFDictionaryRef v12 = [v9 fieldName];
    +[MUPDFAnnotationAdaptorHelper addString:v12 toDictionary:v10 forKey:@"/T"];

    +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:v9 forPage:a4 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addAKAnnotation:v9 toAnnotationDictionary:v10];
  }
  else
  {
    NSLog(&cfstr_SUnexpectedPar.isa, "+[MUCGPDFTextWidgetAnnotationAdaptor _concreteDictionaryRepresentationOfAKAnnotation:forPage:]", v5);
    v10 = 0;
  }

  return v10;
}

@end