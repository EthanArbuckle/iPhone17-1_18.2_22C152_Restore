@interface DTLeaksServicePreservedGraphFile
- (NSDictionary)metaDict;
- (int)fd;
- (unint64_t)size;
- (unint64_t)token;
- (void)dealloc;
- (void)setFd:(int)a3;
- (void)setMetaDict:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation DTLeaksServicePreservedGraphFile

- (void)dealloc
{
  if ([(DTLeaksServicePreservedGraphFile *)self fd] != -1)
  {
    close([(DTLeaksServicePreservedGraphFile *)self fd]);
    [(DTLeaksServicePreservedGraphFile *)self setFd:0xFFFFFFFFLL];
  }
  v3.receiver = self;
  v3.super_class = (Class)DTLeaksServicePreservedGraphFile;
  [(DTLeaksServicePreservedGraphFile *)&v3 dealloc];
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSDictionary)metaDict
{
  return self->_metaDict;
}

- (void)setMetaDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end