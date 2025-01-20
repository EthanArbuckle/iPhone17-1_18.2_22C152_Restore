@interface PDFFormFieldPrivateVars
@end

@implementation PDFFormFieldPrivateVars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->defaultStringValue, 0);
  objc_storeStrong((id *)&self->stringValue, 0);
  objc_storeStrong((id *)&self->fieldName, 0);

  objc_destroyWeak((id *)&self->document);
}

@end