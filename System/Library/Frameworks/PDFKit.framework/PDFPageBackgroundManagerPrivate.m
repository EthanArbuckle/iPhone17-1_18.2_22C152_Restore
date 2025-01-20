@interface PDFPageBackgroundManagerPrivate
@end

@implementation PDFPageBackgroundManagerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->workQueue, 0);
  for (uint64_t i = 48; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_destroyWeak((id *)&self->renderingProperties);

  objc_destroyWeak((id *)&self->documentDelegate);
}

@end