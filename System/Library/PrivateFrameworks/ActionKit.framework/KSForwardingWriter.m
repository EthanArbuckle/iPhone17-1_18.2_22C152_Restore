@interface KSForwardingWriter
- (KSForwardingWriter)init;
- (KSForwardingWriter)initWithOutputWriter:(id)a3;
- (void)close;
- (void)dealloc;
- (void)writeString:(id)a3;
@end

@implementation KSForwardingWriter

- (void).cxx_destruct
{
}

- (void)writeString:(id)a3
{
}

- (void)close
{
  writer = self->_writer;
  self->_writer = 0;
}

- (void)dealloc
{
  [(KSForwardingWriter *)self close];
  if (self->_writer)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"KSForwardingWriter.m" lineNumber:52 description:@"-close failed to dispose of output writer"];
  }
  v5.receiver = self;
  v5.super_class = (Class)KSForwardingWriter;
  [(KSForwardingWriter *)&v5 dealloc];
}

- (KSForwardingWriter)init
{
  return [(KSForwardingWriter *)self initWithOutputWriter:0];
}

- (KSForwardingWriter)initWithOutputWriter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KSForwardingWriter;
  v6 = [(KSForwardingWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_writer, a3);
  }

  return v7;
}

@end