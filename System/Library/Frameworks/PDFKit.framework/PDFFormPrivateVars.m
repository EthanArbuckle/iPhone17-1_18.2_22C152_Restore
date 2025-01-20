@interface PDFFormPrivateVars
@end

@implementation PDFFormPrivateVars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fieldArray, 0);

  objc_destroyWeak((id *)&self->document);
}

@end