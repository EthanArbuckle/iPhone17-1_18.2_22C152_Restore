@interface SGMonochrome
+ (id)stringByExtractingPlainTextFromHTML:(id)a3;
+ (id)stringByExtractingPlainTextFromHTML:(id)a3 tableDelimiters:(BOOL)a4 stripLinks:(BOOL)a5;
@end

@implementation SGMonochrome

+ (id)stringByExtractingPlainTextFromHTML:(id)a3
{
  return +[SGMonochrome stringByExtractingPlainTextFromHTML:a3 tableDelimiters:0 stripLinks:0];
}

+ (id)stringByExtractingPlainTextFromHTML:(id)a3 tableDelimiters:(BOOL)a4 stripLinks:(BOOL)a5
{
  id v7 = a3;
  if (!v7)
  {
    v16 = 0;
    goto LABEL_27;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1CB79B230]();
  if (stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__onceToken != -1) {
    dispatch_once(&stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__onceToken, &__block_literal_global_3362);
  }
  v10 = objc_msgSend((id)stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__htmlNodeRegex, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  if (![v10 count] || (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v11 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v12 = [@"<html>" stringByAppendingString:v8];

    v8 = (void *)v12;
  }
  v13 = v8;
  CStringPtr = CFStringGetCStringPtr(v13, 0x8000100u);
  if (CStringPtr)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:CStringPtr length:strlen(CStringPtr) freeWhenDone:0];
  }
  else
  {
    v15 = [(__CFString *)v13 dataUsingEncoding:4];
  }
  id v17 = v15;
  v18 = (const char *)[v17 bytes];
  int v19 = [v17 length];
  memset(v38, 0, sizeof(v38));
  uint64_t v39 = 0;
  v20 = (UInt8 *)malloc_type_malloc(0x400uLL, 0xF7BB4A3uLL);
  if (!v20)
  {
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v31);
  }
  v21 = v20;
  bytes = v20;
  uint64_t v33 = 0x40000000000;
  int v34 = 2;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  int v37 = 0;
  memset((char *)v38 + 4, 255, 20);
  memset((char *)&v38[1] + 12, 0, 20);
  LOBYTE(v39) = a4;
  BYTE1(v39) = a5;
  if (v18)
  {
    PushParserCtxt = htmlCreatePushParserCtxt(0, 0, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
    if (PushParserCtxt)
    {
      v23 = PushParserCtxt;
      htmlCtxtUseOptions(PushParserCtxt, 2165089);
      htmlParseChunk(v23, v18, v19, 1);
      myDoc = v23->myDoc;
      if (myDoc)
      {
        xmlNodePtr RootElement = xmlDocGetRootElement(v23->myDoc);
        if (RootElement) {
          processTree((uint64_t)&bytes, (uint64_t)RootElement);
        }
        else {
          DWORD2(v38[2]) = 2;
        }
        xmlFreeDoc(myDoc);
      }
      else
      {
        DWORD2(v38[2]) = 1;
      }
      MEMORY[0x1CB79B070](v23);
      if (DWORD2(v38[2]))
      {
        v21 = bytes;
        goto LABEL_25;
      }
      if (v34 == 1)
      {
        int v28 = v33;
        if ((int)v33 >= 1) {
          int v29 = 1;
        }
        else {
          int v29 = v33;
        }
      }
      else
      {
        if (v34 != 2)
        {
          int v30 = v33;
          goto LABEL_40;
        }
        int v28 = v33;
        if ((int)v33 >= 2) {
          int v29 = 2;
        }
        else {
          int v29 = v33;
        }
      }
      int v30 = v28 - v29;
      LODWORD(v33) = v30;
LABEL_40:
      v16 = (__CFString *)CFStringCreateWithBytesNoCopy(0, bytes, v30, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
      goto LABEL_26;
    }
    int v26 = 4;
  }
  else
  {
    int v26 = 5;
  }
  DWORD2(v38[2]) = v26;
LABEL_25:
  free(v21);
  v16 = 0;
LABEL_26:
  free(*(void **)&v38[2]);
  CFRelease(v13);

LABEL_27:
  return v16;
}

uint64_t __79__SGMonochrome_stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks___block_invoke()
{
  stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__htmlNodeRegex = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"<html.*?>" options:1 error:0];
  return MEMORY[0x1F41817F8]();
}

@end