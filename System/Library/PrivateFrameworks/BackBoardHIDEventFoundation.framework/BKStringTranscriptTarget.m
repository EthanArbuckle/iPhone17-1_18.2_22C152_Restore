@interface BKStringTranscriptTarget
- (BKStringTranscriptTarget)init;
- (id)build;
- (void)writePrefix:(id)a3 label:(id)a4 args:(char *)a5;
- (void)writeString:(id)a3;
@end

@implementation BKStringTranscriptTarget

- (void).cxx_destruct
{
}

- (id)build
{
  return self->_string;
}

- (void)writePrefix:(id)a3 label:(id)a4 args:(char *)a5
{
  string = self->_string;
  v9 = (__CFString *)a4;
  CFStringAppendFormat((CFMutableStringRef)string, 0, (CFStringRef)a3);
  CFStringAppendFormatAndArguments((CFMutableStringRef)self->_string, 0, v9, a5);

  v10 = self->_string;

  CFStringAppend((CFMutableStringRef)v10, @"\n");
}

- (void)writeString:(id)a3
{
}

- (BKStringTranscriptTarget)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKStringTranscriptTarget;
  v2 = [(BKStringTranscriptTarget *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    string = v2->_string;
    v2->_string = v3;
  }
  return v2;
}

@end