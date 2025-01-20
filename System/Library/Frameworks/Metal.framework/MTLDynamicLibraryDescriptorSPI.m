@interface MTLDynamicLibraryDescriptorSPI
- (BOOL)isEqual:(id)a3;
- (MTLLibrary)library;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)options;
- (void)dealloc;
- (void)setLibrary:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation MTLDynamicLibraryDescriptorSPI

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v17 = v5;
    uint64_t v18 = v4;
    uint64_t v19 = v3;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      library = self->_library;
      if (library == (MTLLibrary *)[a3 library]
        || (int v12 = -[MTLLibrary isEqual:](self->_library, "isEqual:", [a3 library])) != 0)
      {
        url = self->_url;
        if (url == (NSURL *)objc_msgSend(a3, "url", v6, v17, v18, v19, v7, v8)
          || (int v12 = -[NSURL isEqual:](self->_url, "isEqual:", [a3 url])) != 0)
        {
          unint64_t options = self->_options;
          LOBYTE(v12) = options == [a3 options];
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDynamicLibraryDescriptorSPI;
  [(MTLDynamicLibraryDescriptorSPI *)&v3 dealloc];
}

- (unint64_t)hash
{
  bzero(v4, 0x18uLL);
  v4[0] = [(MTLLibrary *)[(MTLDynamicLibraryDescriptorSPI *)self library] hash];
  v4[1] = [(NSURL *)[(MTLDynamicLibraryDescriptorSPI *)self url] hash];
  v4[2] = [(MTLDynamicLibraryDescriptorSPI *)self options];
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 setLibrary:self->_library];
    v6[1] = [(NSURL *)self->_url copyWithZone:a3];
    v6[3] = self->_options;
  }
  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (MTLLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

@end