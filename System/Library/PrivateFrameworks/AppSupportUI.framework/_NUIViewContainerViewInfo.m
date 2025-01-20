@interface _NUIViewContainerViewInfo
- (_NUIViewContainerViewInfo)init;
- (double)resetCaches;
- (id).cxx_construct;
@end

@implementation _NUIViewContainerViewInfo

- (double)resetCaches
{
  if (a1)
  {
    *(void *)(a1 + 16) = *(void *)(a1 + 8);
    char v1 = *(unsigned char *)(a1 + 144);
    *(unsigned char *)(a1 + 144) = v1 & 0xF7;
    if ((v1 & 0x10) == 0)
    {
      double result = 1.79769313e308;
      *(void *)(a1 + 128) = 0x7FEFFFFFFFFFFFFFLL;
    }
    if ((v1 & 0x20) == 0)
    {
      double result = 1.79769313e308;
      *(void *)(a1 + 136) = 0x7FEFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (_NUIViewContainerViewInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)_NUIViewContainerViewInfo;
  double result = [(_NUIViewContainerViewInfo *)&v4 init];
  if (result)
  {
    result->_minSize = (CGSize)*MEMORY[0x1E4F1DB30];
    result->_maxSize = (CGSize)vdupq_n_s64(0x40C3880000000000uLL);
    *(_OWORD *)&result->_alignmentInsets.top = NUIContainerViewInsetsUseDefault;
    *(_OWORD *)&result->_alignmentInsets.bottom = unk_1AE6757E8;
    result->_sizeCache.__end_ = result->_sizeCache.__begin_;
    char flags = (char)result->_flags;
    *(unsigned char *)&result->_char flags = flags & 0xF7;
    if ((flags & 0x10) == 0) {
      result->_baselines.baseLineFromTop = 1.79769313e308;
    }
    if ((flags & 0x20) == 0) {
      result->_baselines.baseLineFromBottom = 1.79769313e308;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  begin = self->_sizeCache.__begin_;
  if (begin)
  {
    self->_sizeCache.__end_ = begin;
    operator delete(begin);
  }
}

@end