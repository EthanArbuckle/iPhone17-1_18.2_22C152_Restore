@interface PDFBorderPrivateVars
@end

@implementation PDFBorderPrivateVars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dashPattern, 0);

  objc_destroyWeak((id *)&self->annotation);
}

@end