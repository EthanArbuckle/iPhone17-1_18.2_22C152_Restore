@interface NSURLDirectoryEnumerator
- (BOOL)isEnumeratingDirectoryPostOrder;
- (NSURLDirectoryEnumerator)initWithURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 errorHandler:(id)a6;
- (id)directoryAttributes;
- (id)errorHandler;
- (id)fileAttributes;
- (id)nextObject;
- (unint64_t)level;
- (void)dealloc;
- (void)setErrorHandler:(id)a3;
- (void)skipDescendants;
@end

@implementation NSURLDirectoryEnumerator

- (id)nextObject
{
  v9[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  v9[0] = 0;
  if (self->shouldContinue)
  {
    uint64_t v3 = MEMORY[0x185305BD0](self->_enumerator, v9, &cf);
    if ((unint64_t)(v3 - 1) < 2)
    {
      self->isPostOrderDirectory = 0;
    }
    else if (v3 == 3)
    {
      self->isPostOrderDirectory = 0;
      if (self->_errorHandler)
      {
        v4 = (void *)[(id)cf userInfo];
        if (![v4 objectForKey:@"NSURL"])
        {
          uint64_t v5 = [v4 objectForKey:@"NSFilePath"];
          if (v5) {
            [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
          }
        }
        int v6 = (*((uint64_t (**)(void))self->_errorHandler + 2))();
        self->shouldContinue = v6;
        if (v6) {
          v9[0] = [(NSURLDirectoryEnumerator *)self nextObject];
        }
      }
      if (cf) {
        CFRelease(cf);
      }
    }
    else if (v3 == 4)
    {
      self->isPostOrderDirectory = 1;
    }
  }
  return (id)v9[0];
}

uint64_t __88__NSURLDirectoryEnumerator_initWithURL_includingPropertiesForKeys_options_errorHandler___block_invoke()
{
  return 1;
}

- (NSURLDirectoryEnumerator)initWithURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 errorHandler:(id)a6
{
  if (!a4 && !a5) {
    a4 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1D6B8]];
  }
  unint64_t v10 = (a5 & 1 | (2 * ((a5 >> 2) & 1)) & 0xFFFFFFFFFFFFFFF7 | (8 * ((a5 >> 1) & 1))) ^ 1;
  if ((a5 & 8) != 0) {
    v10 |= 0x30uLL;
  }
  v11 = (__CFURLEnumerator *)MEMORY[0x185305BB0](*MEMORY[0x1E4F1CFB0], a3, a5 & 0x80000000 | (((a5 >> 4) & 1) << 6) | v10, a4);
  self->_enumerator = v11;
  if (v11)
  {
    if (a6) {
      id v12 = a6;
    }
    else {
      id v12 = &__block_literal_global_227;
    }
    [(NSURLDirectoryEnumerator *)self setErrorHandler:v12];
    self->shouldContinue = 1;
  }
  else
  {

    return 0;
  }
  return self;
}

- (void)setErrorHandler:(id)a3
{
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  enumerator = self->_enumerator;
  if (enumerator) {
    CFRelease(enumerator);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSURLDirectoryEnumerator;
  [(NSURLDirectoryEnumerator *)&v4 dealloc];
}

- (void)skipDescendants
{
}

- (unint64_t)level
{
}

- (id)fileAttributes
{
  return 0;
}

- (id)directoryAttributes
{
  return 0;
}

- (BOOL)isEnumeratingDirectoryPostOrder
{
  return self->isPostOrderDirectory;
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

@end