@interface IMXMLParser
+ (id)sharedInstance;
- (BOOL)parseContext:(id)a3;
- (id)_newDataByTidyingData:(id)a3;
- (void)_setupTidy;
- (void)_teardownTidy;
- (void)invokedTidyAndSucceeded:(BOOL)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation IMXMLParser

+ (id)sharedInstance
{
  if (qword_1EB4A6710 != -1) {
    dispatch_once(&qword_1EB4A6710, &unk_1EF2BF800);
  }
  return (id)qword_1EB4A6678;
}

- (void)_setupTidy
{
  if (!self->_tidyDoc)
  {
    v3 = (_TidyDoc *)MEMORY[0x1A6228DC0]();
    self->_tidyDoc = v3;
    if (tidyOptSetBool(v3, TidyFixUri, no) == no
      || tidyOptSetInt(self->_tidyDoc, TidyWrapLen, 0) == no
      || tidyOptSetInt(self->_tidyDoc, TidyIndentSpaces, 0) == no
      || tidyOptSetInt(self->_tidyDoc, TidyTabSize, 4uLL) == no
      || tidyOptSetInt(self->_tidyDoc, TidyNewline, 0) == no
      || tidyOptSetInt(self->_tidyDoc, TidyIndentContent, 0) == no
      || tidyOptSetBool(self->_tidyDoc, TidyVertSpace, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyNumEntities, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyEscapeCdata, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyQuoteAmpersand, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyMark, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyDropPropAttrs, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyHideComments, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyIndentAttributes, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyXhtmlOut, yes) == no)
    {
      [(IMXMLParser *)self _teardownTidy];
    }
  }
}

- (void)_teardownTidy
{
  tidyDoc = self->_tidyDoc;
  if (tidyDoc)
  {
    MEMORY[0x1A6228E00](tidyDoc, a2);
    self->_tidyDoc = 0;
  }
}

- (id)_newDataByTidyingData:(id)a3
{
  [(IMXMLParser *)self _setupTidy];
  memset(&buf, 0, sizeof(buf));
  memset(&errbuf, 0, sizeof(errbuf));
  v5 = (byte *)[a3 bytes];
  LODWORD(a3) = [a3 length];
  int v6 = tidySetCharEncoding(self->_tidyDoc, "utf8");
  tidyBufAttach(&buf, v5, (uint)a3);
  if (v6 < 0
    || tidySetErrorBuffer(self->_tidyDoc, &errbuf) < 0
    || (MEMORY[0x1A6228DF0](self->_tidyDoc, &buf) & 0x80000000) != 0
    || tidyCleanAndRepair(self->_tidyDoc) < 0
    || tidyRunDiagnostics(self->_tidyDoc) > 1)
  {
    [(IMXMLParser *)self _teardownTidy];
    v8 = 0;
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    MEMORY[0x1A6228E20](self->_tidyDoc, &v10);
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v8 = (void *)[v7 initWithBytesNoCopy:v10.bp length:v10.size freeWhenDone:1];
    tidyBufDetach(&v10);
    tidyBufFree(&v10);
  }
  tidyBufDetach(&buf);
  tidyBufFree(&buf);
  tidyBufFree(&errbuf);
  return v8;
}

- (void)invokedTidyAndSucceeded:(BOOL)a3
{
  if (a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
    getpid();
    IMLogSimulateCrashForProcessAndPID();
  }
}

- (BOOL)parseContext:(id)a3
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v20 = sub_1A0826390;
  v21 = &unk_1E5A131F0;
  v22 = self;
  v16 = sub_1A082641C;
  v17 = &unk_1E5A10B08;
  v18 = self;
  uint64_t v5 = objc_msgSend(a3, "inContentAsData", MEMORY[0x1E4F143A8], 3221225472);
  self->_context = (IMXMLParserContext *)a3;
  int v6 = (const void *)[a3 name];
  int v7 = _IMWillLog();
  if (v7) {

  }
  CFDictionaryRef v8 = (const __CFDictionary *)qword_1E94FF7C0;
  if (!qword_1E94FF7C0)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
    CFDictionaryRef v8 = (const __CFDictionary *)CFMakeCollectable(Mutable);
    qword_1E94FF7C0 = (uint64_t)v8;
  }
  Value = (__CFDictionary *)CFDictionaryGetValue(v8, v6);
  self->_framespace = Value;
  if (!Value)
  {
    CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
    v12 = (__CFDictionary *)CFMakeCollectable(v11);
    self->_framespace = v12;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1E94FF7C0, v6, v12);
  }
  if (v20((uint64_t)v19, v5))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
    getpid();
    IMLogSimulateCrashForProcessAndPID();
    id v13 = [(IMXMLParser *)self _newDataByTidyingData:v5];
    if (v13)
    {
      v16((uint64_t)&v15);
      if (v7) {

      }
      uint64_t v5 = v20((uint64_t)v19, (uint64_t)v13);
      [(IMXMLParser *)self invokedTidyAndSucceeded:v5];
    }
    else
    {

      LOBYTE(v5) = 0;
    }
  }
  v16((uint64_t)&v15);
  if (v7) {
    [IMParserResultsForLogging(self->_context) length];
  }
  self->_context = 0;
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  CFMutableDictionaryRef v11 = (void *)MEMORY[0x1A6228190](self, a2, a3);
  context = self->_context;
  framespace = self->_framespace;
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a4);
  CFStringUppercase(MutableCopy, 0);
  Class Value = (Class)CFDictionaryGetValue(framespace, MutableCopy);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v19 = sub_1A08268D8;
  v20 = &unk_1E5A13218;
  v21 = context;
  if (!Value)
  {
    Class Value = sub_1A08268D8((uint64_t)v18, (uint64_t)MutableCopy);
    if (!Value)
    {
      Class Value = v19((uint64_t)v18, @"Default");
      if (!Value) {
        Class Value = (Class)objc_opt_class();
      }
    }
    CFDictionarySetValue(framespace, MutableCopy, Value);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  v16 = (IMXMLParserFrame *)objc_alloc_init(Value);
  if (self->_topFrame) {
    -[NSMutableArray addObject:](self->_otherFrames, "addObject:");
  }
  self->_topFrame = v16;
  [(IMXMLParserFrame *)v16 parser:self context:self->_context didStartElement:a4 namespaceURI:a5 qualifiedName:a6 attributes:a7];
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  TidyBuffer v10 = (void *)MEMORY[0x1A6228190](self, a2, a3);
  [(IMXMLParserFrame *)self->_topFrame parser:self context:self->_context didEndElement:a4 namespaceURI:a5 qualifiedName:a6];

  CFMutableDictionaryRef v11 = (IMXMLParserFrame *)[(NSMutableArray *)self->_otherFrames lastObject];
  self->_topFrame = v11;
  if (v11) {
    [(NSMutableArray *)self->_otherFrames removeLastObject];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  int v6 = (void *)MEMORY[0x1A6228190](self, a2, a3);
  [(IMXMLParserFrame *)self->_topFrame parser:self context:self->_context foundCharacters:a4];
}

- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4
{
  int v6 = (void *)MEMORY[0x1A6228190](self, a2, a3);
  [(IMXMLParserFrame *)self->_topFrame parser:self context:self->_context foundIgnorableWhitespace:a4];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

@end