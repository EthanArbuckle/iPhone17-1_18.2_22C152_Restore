@interface MUCGPDFStampAnnotationAdaptor
+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4;
@end

@implementation MUCGPDFStampAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v5)
  {
    uint64_t CGPDFDictionary = CGPDFAnnotationGetCGPDFDictionary();
    id v5 = (id)objc_opt_new();
    +[MUPDFAnnotationAdaptorHelper migrateAKRectangularShapeAnnotationPropertiesTo:v5 fromAnnotationDictionary:CGPDFDictionary ofPDFPage:a4];
    [v5 setShouldUsePlaceholderText:0];
    [v5 setEditsDisableAppearanceOverride:0];
  }
  return v5;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  v7 = [v5 dictionary];
  [v7 setObject:@"/Annot" forKey:@"/Type"];
  [v7 setObject:@"/Stamp" forKey:@"/Subtype"];
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:v6 forPage:a4 toDictionary:v7];
  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:v6 toDictionary:v7];
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:v6 toDictionary:v7];
  +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:v6 toDictionary:v7];
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:v6 toDictionary:v7];
  +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:v6 forPage:a4 toDictionary:v7];
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:v6 toAnnotationDictionary:v7];

  return v7;
}

@end