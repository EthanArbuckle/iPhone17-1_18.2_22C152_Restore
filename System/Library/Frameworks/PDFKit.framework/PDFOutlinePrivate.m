@interface PDFOutlinePrivate
@end

@implementation PDFOutlinePrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->children, 0);
  objc_destroyWeak((id *)&self->parent);
  objc_storeStrong((id *)&self->action, 0);
  objc_storeStrong((id *)&self->title, 0);

  objc_destroyWeak((id *)&self->document);
}

@end