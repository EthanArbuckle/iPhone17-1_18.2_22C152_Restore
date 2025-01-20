@interface MTRErrorHolder
- (ChipError)error;
- (MTRErrorHolder)initWithError:(ChipError *)a3;
@end

@implementation MTRErrorHolder

- (MTRErrorHolder)initWithError:(ChipError *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTRErrorHolder;
  v4 = [(MTRErrorHolder *)&v9 init];
  v5 = (MTRErrorHolder *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->mError;
    *((void *)v4 + 3) = *(void *)&a3->mLine;
    *(_OWORD *)(v4 + 8) = v6;
    v7 = v4;
  }

  return v5;
}

- (ChipError)error
{
  *retstr = *(ChipError *)&self->mFile;
  return self;
}

@end