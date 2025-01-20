@interface QLPreviewReply(PDFSupport)
- (id)updateFromDocumentCreationBlock;
@end

@implementation QLPreviewReply(PDFSupport)

- (id)updateFromDocumentCreationBlock
{
  id v2 = [a1 documentCreationBlock];

  if (v2)
  {
    v3 = [a1 documentCreationBlock];
    id v7 = 0;
    v4 = ((void (**)(void, void *, id *))v3)[2](v3, a1, &v7);
    id v2 = v7;

    v5 = [v4 dataRepresentation];
    [a1 updateWithPDFData:v5];
  }

  return v2;
}

@end