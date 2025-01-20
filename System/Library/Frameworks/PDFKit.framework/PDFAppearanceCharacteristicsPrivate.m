@interface PDFAppearanceCharacteristicsPrivate
@end

@implementation PDFAppearanceCharacteristicsPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->downCaption, 0);
  objc_storeStrong((id *)&self->rolloverCaption, 0);
  objc_storeStrong((id *)&self->caption, 0);
  objc_storeStrong((id *)&self->borderColor, 0);

  objc_storeStrong((id *)&self->backgroundColor, 0);
}

@end