@interface DOCOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC26DocumentManagerExecutables12DOCOperation)init;
- (void)cancel;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation DOCOperation

- (_TtC26DocumentManagerExecutables12DOCOperation)init
{
  return (_TtC26DocumentManagerExecutables12DOCOperation *)DOCOperation.init()();
}

- (void)start
{
  v2 = self;
  sub_22BE18A00();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  v2 = self;
  char v3 = sub_22BE19084();

  return v3 & 1;
}

- (void)setFinished:(BOOL)a3
{
  v4 = self;
  sub_22BE1923C(a3);
}

- (BOOL)isExecuting
{
  v2 = self;
  char v3 = sub_22BE19500();

  return v3 & 1;
}

- (void)setExecuting:(BOOL)a3
{
  v4 = self;
  sub_22BE196B8(a3);
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCOperation();
  id v2 = v3.receiver;
  [(DOCOperation *)&v3 cancel];
  sub_22BE19970();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables12DOCOperation_synchronizationQueue));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables12DOCOperation_callbackQueue));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC26DocumentManagerExecutables12DOCOperation_finishedBlock);

  sub_22BDE0E58(v3);
}

@end