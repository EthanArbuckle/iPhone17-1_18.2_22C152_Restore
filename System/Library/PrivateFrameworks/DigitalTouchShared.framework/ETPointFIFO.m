@interface ETPointFIFO
- (ETPointFIFO)initWithFIFO:(id)a3;
- (ETPointFIFO)nextFIFO;
- (void)clear;
- (void)emitPoints:(ETPointFIFO *)self count:(SEL)a2;
- (void)flush;
- (void)setNextFIFO:(id)a3;
@end

@implementation ETPointFIFO

- (ETPointFIFO)initWithFIFO:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ETPointFIFO;
  v5 = [(ETPointFIFO *)&v7 init];
  if (v5) {
    [v4 setNextFIFO:v5];
  }

  return v5;
}

- (void)emitPoints:(ETPointFIFO *)self count:(SEL)a2
{
}

- (void)flush
{
}

- (void)clear
{
}

- (ETPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)setNextFIFO:(id)a3
{
}

- (void).cxx_destruct
{
}

@end