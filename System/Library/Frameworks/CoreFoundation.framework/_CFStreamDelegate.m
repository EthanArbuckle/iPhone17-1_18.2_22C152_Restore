@interface _CFStreamDelegate
- (_CFStreamDelegate)initWithStreamEvents:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (void)dealloc;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation _CFStreamDelegate

- (_CFStreamDelegate)initWithStreamEvents:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  v14.receiver = self;
  v14.super_class = (Class)_CFStreamDelegate;
  v8 = [(_CFStreamDelegate *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_flags = a3;
    v8->_cb._rcb = a4;
    long long v10 = *(_OWORD *)&a5->var0;
    long long v11 = *(_OWORD *)&a5->var2;
    v8->_client.copyDescription = a5->var4;
    *(_OWORD *)&v8->_client.version = v10;
    *(_OWORD *)&v8->_client.retain = v11;
    retain = (uint64_t (*)(void *))v8->_client.retain;
    if (retain)
    {
      if (v8->_client.release) {
        v8->_client.info = (void *)retain(v8->_client.info);
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  release = (void (*)(void *, SEL))self->_client.release;
  if (release)
  {
    info = self->_client.info;
    if (info) {
      release(info, a2);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_CFStreamDelegate;
  [(_CFStreamDelegate *)&v5 dealloc];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  if ((self->_flags & a4) != 0) {
    ((void (*)(id, unint64_t, void *))self->_cb._rcb)(a3, a4, self->_client.info);
  }
}

@end