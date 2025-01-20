@interface AVMetadataEnumerator
+ (id)metadataEnumeratorWithArray:(id)a3 key:(id)a4 keySpace:(id)a5 locale:(id)a6;
+ (id)metadataEnumeratorWithMetadataReader:(OpaqueFigMetadataReader *)a3;
- (AVMetadataEnumerator)initWithArray:(id)a3 key:(id)a4 keySpace:(id)a5 locale:(id)a6;
- (AVMetadataEnumerator)initWithMetadataReader:(OpaqueFigMetadataReader *)a3;
- (AVMetadataEnumerator)initWithMetadataReader:(OpaqueFigMetadataReader *)a3 array:(id)a4 key:(id)a5 keySpace:(id)a6 locale:(id)a7;
- (id)nextObject;
- (void)_setArrayEnumerator:(id)a3;
- (void)_setKey:(id)a3;
- (void)_setKeySpace:(id)a3;
- (void)_setLocale:(id)a3;
- (void)_setMetadataReader:(OpaqueFigMetadataReader *)a3;
- (void)dealloc;
@end

@implementation AVMetadataEnumerator

+ (id)metadataEnumeratorWithMetadataReader:(OpaqueFigMetadataReader *)a3
{
  v3 = [[AVMetadataEnumerator alloc] initWithMetadataReader:a3];
  return v3;
}

+ (id)metadataEnumeratorWithArray:(id)a3 key:(id)a4 keySpace:(id)a5 locale:(id)a6
{
  v6 = [[AVMetadataEnumerator alloc] initWithArray:a3 key:a4 keySpace:a5 locale:a6];
  return v6;
}

- (AVMetadataEnumerator)initWithMetadataReader:(OpaqueFigMetadataReader *)a3
{
  return [(AVMetadataEnumerator *)self initWithMetadataReader:a3 array:0 key:0 keySpace:0 locale:0];
}

- (AVMetadataEnumerator)initWithArray:(id)a3 key:(id)a4 keySpace:(id)a5 locale:(id)a6
{
  return [(AVMetadataEnumerator *)self initWithMetadataReader:0 array:a3 key:a4 keySpace:a5 locale:a6];
}

- (AVMetadataEnumerator)initWithMetadataReader:(OpaqueFigMetadataReader *)a3 array:(id)a4 key:(id)a5 keySpace:(id)a6 locale:(id)a7
{
  v18.receiver = self;
  v18.super_class = (Class)AVMetadataEnumerator;
  v12 = [(AVMetadataEnumerator *)&v18 init];
  if (v12)
  {
    if (a3)
    {
      uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      v15 = *(uint64_t (**)(OpaqueFigMetadataReader *, void, void))(v14 + 40);
      if (v15)
      {
        uint64_t v16 = v15(a3, 0, 0);
        v12->_count = v16;
        if (v16 > 0)
        {
          [(AVMetadataEnumerator *)v12 _setMetadataReader:a3];
          goto LABEL_11;
        }
      }
      else
      {
        v12->_count = 0;
      }
    }
    else if (a4)
    {
      -[AVMetadataEnumerator _setArrayEnumerator:](v12, "_setArrayEnumerator:", [a4 objectEnumerator]);
LABEL_11:
      [(AVMetadataEnumerator *)v12 _setKey:a5];
      [(AVMetadataEnumerator *)v12 _setKeySpace:a6];
      [(AVMetadataEnumerator *)v12 _setLocale:a7];
      return v12;
    }

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  [(AVMetadataEnumerator *)self _setKey:0];
  [(AVMetadataEnumerator *)self _setKeySpace:0];
  [(AVMetadataEnumerator *)self _setLocale:0];
  [(AVMetadataEnumerator *)self _setArrayEnumerator:0];
  [(AVMetadataEnumerator *)self _setMetadataReader:0];
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataEnumerator;
  [(AVMetadataEnumerator *)&v3 dealloc];
}

- (void)_setMetadataReader:(OpaqueFigMetadataReader *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  reader = self->_reader;
  if (reader) {
    CFRelease(reader);
  }
  self->_reader = a3;
}

- (void)_setArrayEnumerator:(id)a3
{
  id v5 = a3;

  self->_arrayEnumerator = (NSEnumerator *)a3;
}

- (void)_setKey:(id)a3
{
  id v5 = a3;

  self->_key = a3;
}

- (void)_setKeySpace:(id)a3
{
  id v5 = a3;

  self->_keySpace = (NSString *)a3;
}

- (void)_setLocale:(id)a3
{
  id v5 = a3;

  self->_locale = (NSLocale *)a3;
}

- (id)nextObject
{
  id v3 = 0;
  while (1)
  {
    if (self->_reader)
    {
      int64_t index = self->_index;
      if (index < self->_count)
      {
        id v3 = [[AVMetadataItem alloc] _initWithReader:self->_reader itemIndex:self->_index];
        int64_t index = self->_index;
      }
      self->_int64_t index = index + 1;
      goto LABEL_6;
    }
    if (self->_arrayEnumerator) {
      break;
    }
LABEL_6:
    if (!v3) {
      return v3;
    }
LABEL_7:
    id key = self->_key;
    if (!key || objc_msgSend(key, "isEqual:", objc_msgSend(v3, "key")))
    {
      keySpace = self->_keySpace;
      if (!keySpace || -[NSString isEqualToString:](keySpace, "isEqualToString:", [v3 keySpace]))
      {
        locale = self->_locale;
        if (!locale
          || AVNSLocalesMatchAccordingToRFC4647FilteringRules(locale, (void *)[v3 locale]))
        {
          return v3;
        }
      }
    }
  }
  while (1)
  {
    id v3 = [(NSEnumerator *)self->_arrayEnumerator nextObject];
    if (!v3) {
      return v3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
  }
}

@end