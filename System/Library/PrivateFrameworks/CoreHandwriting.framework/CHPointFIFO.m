@interface CHPointFIFO
- (CHPointFIFO)initWithFIFO:(id)a3;
- (void)clear;
- (void)emitPoint:(CHPointFIFO *)self;
- (void)flush;
@end

@implementation CHPointFIFO

- (CHPointFIFO)initWithFIFO:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPointFIFO;
  v6 = [(CHPointFIFO *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nextFIFO, a3);
  }

  return v7;
}

- (void)emitPoint:(CHPointFIFO *)self
{
  if (self) {
    self = self->_nextFIFO;
  }
  objc_msgSend_addPoint_(self, a2, v2, v3, v4, v5);
}

- (void)flush
{
  objc_msgSend_flush(self->_nextFIFO, a2, v2, v3, v4, v5);
}

- (void)clear
{
  objc_msgSend_clear(self->_nextFIFO, a2, v2, v3, v4, v5);
}

- (void).cxx_destruct
{
}

@end