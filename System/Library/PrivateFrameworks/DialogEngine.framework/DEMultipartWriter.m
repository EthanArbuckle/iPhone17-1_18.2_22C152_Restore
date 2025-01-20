@interface DEMultipartWriter
- (BOOL)partClosed;
- (DEMultipartWriter)init;
- (DEMultipartWriter)initWithWriter:(id)a3;
- (DEWriter)writer;
- (void)close;
- (void)closeMessage;
- (void)dealloc;
- (void)newPart;
- (void)setPartClosed:(BOOL)a3;
- (void)setWriter:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DEMultipartWriter

- (void).cxx_destruct
{
}

- (void)setPartClosed:(BOOL)a3
{
  self->_partClosed = a3;
}

- (BOOL)partClosed
{
  return self->_partClosed;
}

- (void)setWriter:(id)a3
{
}

- (DEWriter)writer
{
  return self->_writer;
}

- (void)writeData:(id)a3
{
}

- (void)newPart
{
  [(DEMultipartWriter *)self close];
  writer = self->_writer;
  v4 = +[DEMultipartUtil getBoundaryData];
  [(DEWriter *)writer writeData:v4];

  self->_partClosed = 0;
}

- (void)close
{
  if (!self->_partClosed)
  {
    writer = self->_writer;
    v4 = +[DEMultipartUtil getPartEndData];
    [(DEWriter *)writer writeData:v4];

    self->_partClosed = 1;
  }
}

- (void)closeMessage
{
  if (self->_writer)
  {
    [(DEMultipartWriter *)self close];
    writer = self->_writer;
    v4 = +[DEMultipartUtil getMessageEndData];
    [(DEWriter *)writer writeData:v4];

    [(DEWriter *)self->_writer close];
    v5 = self->_writer;
    self->_writer = 0;
  }
}

- (void)dealloc
{
  writer = self->_writer;
  if (writer)
  {
    [(DEWriter *)writer close];
    v4 = self->_writer;
    self->_writer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DEMultipartWriter;
  [(DEMultipartWriter *)&v5 dealloc];
}

- (DEMultipartWriter)init
{
  return [(DEMultipartWriter *)self initWithWriter:0];
}

- (DEMultipartWriter)initWithWriter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DEMultipartWriter;
  v6 = [(DEMultipartWriter *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_writer, a3);
    v7->_partClosed = 0;
    writer = v7->_writer;
    v9 = +[DEMultipartUtil getBoundaryData];
    [(DEWriter *)writer writeData:v9];

    v10 = v7;
  }

  return v7;
}

@end