@interface CAMLParser
+ (id)parseContentsOfURL:(id)a3;
+ (id)parser;
- (BOOL)parseBytes:(const char *)a3 length:(unint64_t)a4;
- (BOOL)parseContentsOfURL:(id)a3;
- (BOOL)parseData:(id)a3;
- (BOOL)parseString:(id)a3;
- (CAMLParser)init;
- (CAMLParserDelegate)delegate;
- (NSError)error;
- (NSURL)baseURL;
- (id)attributeForKey:(id)a3 remove:(BOOL)a4;
- (id)didFailToLoadResourceFromURL:(id)a3;
- (id)elementValue;
- (id)objectById:(id)a3;
- (id)result;
- (id)willLoadResourceFromURL:(id)a3;
- (void)dealloc;
- (void)didLoadResource:(id)a3 fromURL:(id)a4;
- (void)parserError:(id)a3;
- (void)parserWarning:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementValue:(id)a3;
@end

@implementation CAMLParser

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  data = self->_data;
  if (data) {
    (*(void (**)(_CAMLParserData *, SEL))(*(void *)data + 8))(data, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMLParser;
  [(CAMLParser *)&v4 dealloc];
}

- (id)objectById:(id)a3
{
  id result = (id)*((void *)self->_data + 8);
  if (result)
  {
    id result = (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
    if (result) {
      return (id)*((void *)result + 1);
    }
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  data = self->_data;
  if (*((id *)data + 12) != a3)
  {
    *((void *)data + 12) = a3;
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xFD | v4;
    if (objc_opt_respondsToSelector()) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xFB | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xF7 | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 16;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xEF | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 32;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xDF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 64;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)data + 112) = *((unsigned char *)data + 112) & 0xBF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 0x80;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)data + 112) = v10 & 0x80 | *((unsigned char *)data + 112) & 0x7F;
  }
}

- (void)setBaseURL:(id)a3
{
}

- (id)result
{
  return (id)CAML::Context::result((CAML::Context *)self->_data);
}

- (BOOL)parseContentsOfURL:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v17 = 0;
  data = self->_data;
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:a3 options:0 error:&v17];
  uint64_t v7 = [NSString stringWithFormat:@"Unable to load CAPackage from URL: %@", a3];
  if (v17)
  {
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v18[0] = *MEMORY[0x1E4F28568];
    v18[1] = v8;
    v19[0] = v7;
    v19[1] = v17;
    char v9 = (const void *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    v17 = v9;
    if (v9) {
      CAML::Context::set_error((CAML::Context *)data, v9);
    }
  }
  if (!v6) {
    return 0;
  }
  uint64_t v10 = *((void *)data + 2);
  if (!v10)
  {
    CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, (CFURLRef)a3);
    if (PathComponent)
    {
      CFURLRef v12 = PathComponent;
      CAML::Context::set_base_url((CAML::Context *)data, PathComponent);
      CFRelease(v12);
    }
  }
  v13 = (const void *)*((void *)data + 3);
  CAML::Context::set_current_url((CAML::Context *)data, a3);
  BOOL v14 = [(CAMLParser *)self parseData:v6];
  CAML::Context::set_current_url((CAML::Context *)data, v13);
  if (!v10)
  {
    v15 = (const void *)*((void *)data + 2);
    if (v15)
    {
      CFRelease(v15);
      *((void *)data + 2) = 0;
    }
  }

  return v14;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];

  return [(CAMLParser *)self parseBytes:v5 length:v6];
}

- (BOOL)parseBytes:(const char *)a3 length:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v7 = (void *)MEMORY[0x185324A30](self, a2);
  pthread_mutex_lock(&parser_mutex);
  while (1)
  {
    uint64_t v8 = parser_wip;
    if (!parser_wip) {
      break;
    }
    uint64_t v9 = parser_wip;
    while (*(const char **)v9 != a3)
    {
      uint64_t v9 = *(void *)(v9 + 8);
      if (!v9) {
        goto LABEL_8;
      }
    }
    pthread_cond_wait(&parser_cond, &parser_mutex);
  }
LABEL_8:
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v11 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
  void *v11 = a3;
  v11[1] = v8;
  parser_wip = (uint64_t)v11;
  pthread_mutex_unlock(&parser_mutex);
  data = self->_data;
  v13 = (const void *)*((void *)data + 4);
  if (v13)
  {
    CFRelease(v13);
    *((void *)data + 4) = 0;
  }
  BOOL v14 = (xmlParserCtxt *)*((void *)data + 1);
  if (!v14)
  {
    if (CAML::Context::_sax_vtable_once[0] != -1) {
      dispatch_once_f(CAML::Context::_sax_vtable_once, 0, (dispatch_function_t)CAML::Context::create_sax_vtable);
    }
    PushParserCtxt = xmlCreatePushParserCtxt((xmlSAXHandlerPtr)CAML::Context::_sax_vtable, data, 0, 0, 0);
    *((void *)data + 1) = PushParserCtxt;
    if (!PushParserCtxt)
    {
      BOOL v16 = 0;
      goto LABEL_16;
    }
    xmlCtxtUseOptions(PushParserCtxt, 2);
    CAML::Context::push_state((uint64_t)data, 1, 0, 0, 0);
    BOOL v14 = (xmlParserCtxt *)*((void *)data + 1);
  }
  xmlParseChunk(v14, a3, v4, 0);
  BOOL v16 = *((void *)data + 4) == 0;
LABEL_16:
  pthread_mutex_lock(&parser_mutex);
  parser_wip = (uint64_t)x_list_remove((void *)parser_wip, (uint64_t)a3);
  pthread_cond_broadcast(&parser_cond);
  pthread_mutex_unlock(&parser_mutex);
  return v16;
}

- (NSError)error
{
  return (NSError *)*((void *)self->_data + 4);
}

+ (id)parser
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (CAMLParser)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CAMLParser;
  id v2 = [(CAMLParser *)&v9 init];
  if (v2)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    int v4 = (char *)malloc_type_zone_malloc(malloc_zone, 0x78uLL, 0x8BB15036uLL);
    uint64_t v5 = v4;
    if (v4)
    {
      *((void *)v4 + 9) = 0;
      *((void *)v4 + 10) = v2;
      *(_OWORD *)(v4 + 56) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 8) = 0u;
      *(void *)int v4 = &unk_1ED030738;
      *((void *)v4 + 11) = 0;
      *((void *)v4 + 12) = 0;
      *((void *)v4 + 13) = 0;
      v4[112] = 0;
      if (CAML::ObjCContext::_builtin_types_once != -1) {
        dispatch_once_f(&CAML::ObjCContext::_builtin_types_once, 0, (dispatch_function_t)CAML::ObjCContext::create_builtin_types);
      }
      uint64_t v6 = (int *)x_hash_table_new_((unint64_t (*)(uint64_t))x_string_hash, (BOOL (*)(uint64_t, uint64_t))x_string_compare, 0, 0, 0, 0);
      for (uint64_t i = 0; i != 192; i += 8)
        hash_table_modify(v6, *(void *)(*(void *)(CAML::ObjCContext::_builtin_types + i) + 8), *(void *)(CAML::ObjCContext::_builtin_types + i), 0);
      hash_table_modify(v6, (uint64_t)"NSString", *(void *)(CAML::ObjCContext::_builtin_types + 32), 0);
      *((void *)v5 + 13) = v6;
    }
    v2->_data = (_CAMLParserData *)v5;
  }
  return v2;
}

- (void)setElementValue:(id)a3
{
  v3 = (CAML::State *)*((void *)self->_data + 11);
  if (v3) {
    CAML::State::set_value(v3, a3);
  }
}

- (id)elementValue
{
  uint64_t v2 = *((void *)self->_data + 11);
  if (v2) {
    return *(id *)(v2 + 64);
  }
  else {
    return 0;
  }
}

- (void)parserWarning:(id)a3
{
  int v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  CAML::Context::warning((CAML::Context *)self->_data, "%s", (const char *)[v4 UTF8String]);
}

- (void)parserError:(id)a3
{
  int v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  CAML::Context::error((CAML::Context *)self->_data, "%s", (const char *)[v4 UTF8String]);
}

- (id)didFailToLoadResourceFromURL:(id)a3
{
  id result = (id)(*(uint64_t (**)(_CAMLParserData *, id))(*(void *)self->_data + 88))(self->_data, a3);
  if (result)
  {
    return result;
  }
  return result;
}

- (void)didLoadResource:(id)a3 fromURL:(id)a4
{
}

- (id)willLoadResourceFromURL:(id)a3
{
  id result = (id)(*(uint64_t (**)(_CAMLParserData *, id))(*(void *)self->_data + 72))(self->_data, a3);
  if (result)
  {
    id v4 = result;
    return v4;
  }
  return result;
}

- (id)attributeForKey:(id)a3 remove:(BOOL)a4
{
  id v4 = *(const char **)(*((void *)self->_data + 6) + 216);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = CAML::memq_(v4, (const char **)[a3 UTF8String], (const char *)a4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = NSString;

  return (id)[v7 stringWithUTF8String:v6];
}

- (BOOL)parseString:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  size_t v5 = strlen(v4);

  return [(CAMLParser *)self parseBytes:v4 length:v5];
}

- (CAMLParserDelegate)delegate
{
  return (CAMLParserDelegate *)*((void *)self->_data + 12);
}

- (NSURL)baseURL
{
  return (NSURL *)*((void *)self->_data + 2);
}

+ (id)parseContentsOfURL:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 parseContentsOfURL:a3];
  uint64_t v5 = [v4 error];
  if (v5)
  {
    NSLog(&cfstr_ErrorWhilePars.isa, a3, v5);
    id v6 = 0;
  }
  else
  {
    id v6 = (id)[v4 result];
  }

  return v6;
}

@end