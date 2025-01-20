@interface PDFActionPrivate
@end

@implementation PDFActionPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->nextActions, 0);

  objc_storeStrong((id *)&self->type, 0);
}

@end