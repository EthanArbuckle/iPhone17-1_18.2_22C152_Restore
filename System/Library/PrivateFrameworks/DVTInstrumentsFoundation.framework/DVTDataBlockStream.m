@interface DVTDataBlockStream
- (BOOL)hasData;
- (BOOL)hasSpace;
- (BOOL)supportsPeek;
- (id).cxx_construct;
- (id)createNextStream:(id *)a3;
- (id)peek:(unint64_t)a3 error:(id *)a4;
- (id)read:(unint64_t)a3 error:(id *)a4;
- (int64_t)write:(id)a3 error:(id *)a4;
@end

@implementation DVTDataBlockStream

- (id)createNextStream:(id *)a3
{
  v3 = objc_alloc_init(DVTDataBlockStream);
  return v3;
}

- (id)read:(unint64_t)a3 error:(id *)a4
{
  if (*((void *)self + 3))
  {
    v4 = (char *)self + 8;
    id v5 = *(id *)(*((void *)self + 2) + 16);
    sub_2308E8CFC((uint64_t)v4);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)peek:(unint64_t)a3 error:(id *)a4
{
  if (*((void *)self + 3)) {
    return *(id *)(*((void *)self + 2) + 16);
  }
  __break(1u);
  return self;
}

- (BOOL)hasData
{
  return self->_records.__size_alloc_.__value_ != 0;
}

- (BOOL)hasSpace
{
  return 1;
}

- (int64_t)write:(id)a3 error:(id *)a4
{
  id v7 = a3;
  sub_2308E8DF4((uint64_t *)&self->_records, &v7);
  int64_t v5 = [v7 length];

  return v5;
}

- (BOOL)supportsPeek
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = (char *)self + 8;
  *((void *)self + 2) = (char *)self + 8;
  *((void *)self + 3) = 0;
  return self;
}

@end