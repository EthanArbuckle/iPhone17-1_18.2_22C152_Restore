@interface PDFTilePoolPrivate
@end

@implementation PDFTilePoolPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->surfaces, 0);
  objc_storeStrong((id *)&self->workQueueThrottle, 0);

  objc_storeStrong((id *)&self->workQueue, 0);
}

@end