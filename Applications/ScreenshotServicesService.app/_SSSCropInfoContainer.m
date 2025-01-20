@interface _SSSCropInfoContainer
- (SSSCropInfo)cropInfo;
- (void)setCropInfo:(SSSCropInfo *)a3;
@end

@implementation _SSSCropInfoContainer

- (SSSCropInfo)cropInfo
{
  CGPoint v3 = *(CGPoint *)&self->currentRect.origin.y;
  retstr->totalSize = *(CGSize *)&self->totalSize.height;
  retstr->currentRect.origin = v3;
  retstr->currentRect.size = *(CGSize *)&self->currentRect.size.height;
  return self;
}

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGSize totalSize = a3->totalSize;
  CGPoint origin = a3->currentRect.origin;
  self->_cropInfo.currentRect.size = a3->currentRect.size;
  self->_cropInfo.currentRect.CGPoint origin = origin;
  self->_cropInfo.CGSize totalSize = totalSize;
}

@end