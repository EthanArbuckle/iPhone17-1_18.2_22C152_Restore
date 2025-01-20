@interface EQKitLayoutElementaryStackCarryRow
- (EQKitLayoutElementaryStackCarryRow)initWithChildren:(id)a3 decimalPoint:(unint64_t)a4 position:(int64_t)a5 followingSpace:(double)a6 crossouts:(const void *)a7;
- (id).cxx_construct;
- (int)crossoutAtColumnIndex:(unint64_t)a3;
@end

@implementation EQKitLayoutElementaryStackCarryRow

- (EQKitLayoutElementaryStackCarryRow)initWithChildren:(id)a3 decimalPoint:(unint64_t)a4 position:(int64_t)a5 followingSpace:(double)a6 crossouts:(const void *)a7
{
  v12.receiver = self;
  v12.super_class = (Class)EQKitLayoutElementaryStackCarryRow;
  v8 = [(EQKitLayoutElementaryStackDigitRow *)&v12 initWithChildren:a3 decimalPoint:a4 position:a5 followingSpace:a6];
  v9 = v8;
  if (v8)
  {
    p_mCrossouts = (char *)&v8->mCrossouts;
    if (&v9->mCrossouts != a7) {
      std::vector<EQKitTypes::Notation::Enum>::__assign_with_size[abi:ne180100]<EQKitTypes::Notation::Enum*,EQKitTypes::Notation::Enum*>(p_mCrossouts, *(char **)a7, *((void *)a7 + 1), (uint64_t)(*((void *)a7 + 1) - *(void *)a7) >> 2);
    }
  }
  return v9;
}

- (int)crossoutAtColumnIndex:(unint64_t)a3
{
  begin = self->mCrossouts.__begin_;
  if (a3 >= self->mCrossouts.__end_ - begin) {
    return 0;
  }
  else {
    return begin[a3];
  }
}

- (void).cxx_destruct
{
  p_mCrossouts = &self->mCrossouts;
  begin = self->mCrossouts.__begin_;
  if (begin)
  {
    p_mCrossouts->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end