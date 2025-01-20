@interface BWDeferredDictionaryIntermediate
+ (BOOL)supportsSecureCoding;
- (BWDeferredDictionaryIntermediate)initWithCoder:(id)a3;
- (BWDeferredDictionaryIntermediate)initWithDictionary:(id)a3 tag:(id)a4 URL:(id)a5;
- (NSDictionary)dictionary;
- (id)archive:(int *)a3;
- (id)description;
- (id)fetchWithCustomClassesAndRetain:(id)a3 err:(int *)a4;
- (int)flush;
- (int)setArchive:(id)a3;
- (int)setURL:(id)a3 prefetchQueue:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWDeferredDictionaryIntermediate

- (BWDeferredDictionaryIntermediate)initWithDictionary:(id)a3 tag:(id)a4 URL:(id)a5
{
  if (a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)BWDeferredDictionaryIntermediate;
    v7 = [(BWDeferredIntermediate *)&v9 initWithTag:a4 URL:a5];
    if (v7) {
      v7->_dictionary = (NSDictionary *)a3;
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (id)fetchWithCustomClassesAndRetain:(id)a3 err:(int *)a4
{
  id v14 = 0;
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (self->_dictionary) {
    goto LABEL_7;
  }
  id v8 = +[BWDeferredContainer buildArchiveClasses:a3];
  if (self->super.super._prefetching) {
    pthread_cond_wait(&self->super.super._cv, p_lock);
  }
  archive = self->super._archive;
  if (archive)
  {
    self->_dictionary = (NSDictionary *)+[BWDeferredContainer unarchiveObject:archive classes:v8 error:&v14];

    self->super._archive = 0;
  }
  else
  {
    URL = self->super.super._URL;
    if (URL)
    {
      v13 = (NSDictionary *)+[BWDeferredContainer unarchiveObjectWithURL:URL classes:v8 error:&v14];
      self->_dictionary = v13;
      if (v13) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  if (self->_dictionary)
  {
LABEL_7:
    int v10 = 0;
    goto LABEL_8;
  }
LABEL_13:
  if (v14) {
    [NSString stringWithFormat:@" due to error: %@", objc_msgSend(v14, "description")];
  }
  int v10 = -16134;
LABEL_8:
  pthread_mutex_unlock(p_lock);
  if (a4) {
    *a4 = v10;
  }
  return self->_dictionary;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredDictionaryIntermediate)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredDictionaryIntermediate;
  return [(BWDeferredIntermediate *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredDictionaryIntermediate;
  [(BWDeferredIntermediate *)&v3 encodeWithCoder:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredDictionaryIntermediate;
  [(BWDeferredDataIntermediate *)&v3 dealloc];
}

- (int)setURL:(id)a3 prefetchQueue:(id)a4
{
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (self->_dictionary)
  {
    FigDebugAssert3();
    int v8 = -16135;
  }
  else
  {
    -[BWDeferredDataIntermediate _setURL:prefetchQueue:]((uint64_t)self, a3, a4);
    int v8 = 0;
  }
  pthread_mutex_unlock(p_lock);
  return v8;
}

- (int)setArchive:(id)a3
{
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (*(_OWORD *)&self->super._archive != 0 || self->super.super._URL)
  {
    FigDebugAssert3();
    int v6 = -16135;
  }
  else
  {
    int v6 = 0;
    self->super._archive = (NSData *)[a3 copy];
  }
  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)archive:(int *)a3
{
  id v13 = 0;
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  dictionary = self->_dictionary;
  if (dictionary)
  {
    if (+[BWDeferredContainer archiveObject:dictionary error:&v13])
    {
      int v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      objc_super v9 = v8;
      if (v8)
      {
        CFAutorelease(v8);
        int v10 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v10 = -16133;
      }
    }
    else
    {
      LODWORD(v12) = 0;
      FigDebugAssert3();
      objc_msgSend(v13, "code", v12, v3);
      int v10 = FigSignalErrorAt();
      objc_super v9 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    objc_super v9 = 0;
    int v10 = -16136;
  }
  pthread_mutex_unlock(p_lock);
  if (a3) {
    *a3 = v10;
  }
  return v9;
}

- (int)flush
{
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (!self->super.super._URL) {
    goto LABEL_11;
  }
  if (!self->_dictionary)
  {
    if (!self->super.super._dirty) {
      goto LABEL_7;
    }
LABEL_11:
    FigDebugAssert3();
    int v5 = -16136;
    goto LABEL_8;
  }
  if (!self->super.super._dirty)
  {
LABEL_7:
    int v5 = 0;
    goto LABEL_8;
  }
  if (+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:"))
  {

    int v5 = 0;
    self->_dictionary = 0;
    self->super.super._dirty = 0;
  }
  else
  {
    LODWORD(v7) = 0;
    FigDebugAssert3();
    int v5 = objc_msgSend(0, "code", v7, v2);
  }
LABEL_8:
  pthread_mutex_unlock(p_lock);
  return v5;
}

- (id)description
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] string];
  objc_super v4 = (void *)MEMORY[0x1A6272C70]();
  int v5 = [(NSDictionary *)self->_dictionary description];
  if ([(NSString *)v5 length] >= 0x201) {
    int v5 = (NSString *)[NSString stringWithFormat:@"%@...}", -[NSString substringToIndex:](v5, "substringToIndex:", 512)];
  }
  [v3 appendFormat:@"<%@ %p>: tag:%@ dictionary:%@", objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), v5];
  int v6 = (void *)[v3 copy];
  return v6;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

@end