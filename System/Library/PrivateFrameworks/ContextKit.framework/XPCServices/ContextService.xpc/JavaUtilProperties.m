@interface JavaUtilProperties
+ (const)__metadata;
+ (id)__annotations_saveWithJavaIoOutputStream_withNSString_;
- (JavaUtilProperties)init;
- (JavaUtilProperties)initWithJavaUtilProperties:(id)a3;
- (id)getPropertyWithNSString:(id)a3;
- (id)getPropertyWithNSString:(id)a3 withNSString:(id)a4;
- (id)propertyNames;
- (id)stringPropertyNames;
- (id)substitutePredefinedEntriesWithNSString:(id)a3;
- (void)dealloc;
- (void)dumpStringWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5;
- (void)listToAppendableWithJavaLangAppendable:(id)a3;
- (void)listWithJavaIoPrintStream:(id)a3;
- (void)listWithJavaIoPrintWriter:(id)a3;
- (void)loadFromXMLWithJavaIoInputStream:(id)a3;
- (void)load__WithJavaIoInputStream:(id)a3;
- (void)load__WithJavaIoReader:(id)a3;
- (void)saveWithJavaIoOutputStream:(id)a3 withNSString:(id)a4;
- (void)selectPropertiesWithJavaUtilHashtable:(id)a3 withBoolean:(BOOL)a4;
- (void)storeToXMLWithJavaIoOutputStream:(id)a3 withNSString:(id)a4;
- (void)storeToXMLWithJavaIoOutputStream:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
- (void)storeWithJavaIoOutputStream:(id)a3 withNSString:(id)a4;
- (void)storeWithJavaIoWriter:(id)a3 withNSString:(id)a4;
@end

@implementation JavaUtilProperties

- (JavaUtilProperties)init
{
  return self;
}

- (JavaUtilProperties)initWithJavaUtilProperties:(id)a3
{
  return self;
}

- (void)dumpStringWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5
{
}

- (id)getPropertyWithNSString:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilProperties;
  id v5 = -[JavaUtilHashtable getWithId:](&v8, "getWithId:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), v5))
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  else
  {
    defaults = self->defaults_;
    if (defaults) {
      return [(JavaUtilProperties *)defaults getPropertyWithNSString:a3];
    }
    else {
      return 0;
    }
  }
  return v5;
}

- (id)getPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)JavaUtilProperties;
  id v7 = -[JavaUtilHashtable getWithId:](&v10, "getWithId:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), v7))
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  else
  {
    defaults = self->defaults_;
    if (defaults) {
      id v7 = [(JavaUtilProperties *)defaults getPropertyWithNSString:a3];
    }
    else {
      id v7 = 0;
    }
  }
  if (v7) {
    return v7;
  }
  else {
    return a4;
  }
}

- (void)listWithJavaIoPrintStream:(id)a3
{
}

- (void)listWithJavaIoPrintWriter:(id)a3
{
}

- (void)listToAppendableWithJavaLangAppendable:(id)a3
{
  if (!a3)
  {
    v13 = new_JavaLangNullPointerException_initWithNSString_(@"out == null");
    objc_exception_throw(v13);
  }
  id v3 = a3;
  v4 = new_JavaLangStringBuilder_initWithInt_(0x50u);
  id v5 = [(JavaUtilProperties *)self propertyNames];
  if (!v5) {
    JreThrowNullPointerException();
  }
  v6 = &classRef_IOSArrayClass;
  while ([v5 hasMoreElements])
  {
    id v7 = [v5 nextElement];
    objc_opt_class();
    if (v7 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    [(JavaLangStringBuilder *)v4 appendWithNSString:v7];
    [(JavaLangStringBuilder *)v4 appendWithChar:61];
    objc_super v8 = (objc_class *)v6[213];
    v15.receiver = self;
    v15.super_class = v8;
    v9 = [(JavaUtilHashtable *)&v15 getWithId:v7];
    objc_opt_class();
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    else
    {
      id v10 = v3;
      v11 = v6;
      v12 = self;
      do
      {
        v12 = v12->defaults_;
        if (!v12) {
          JreThrowNullPointerException();
        }
        v9 = [(JavaUtilHashtable *)v12 getWithId:v7];
        objc_opt_class();
      }
      while (!v9);
      v6 = v11;
      id v3 = v10;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    if ((int)[(__CFString *)v9 length] >= 41)
    {
      [(JavaLangStringBuilder *)v4 appendWithNSString:[(__CFString *)v9 substring:0 endIndex:37]];
      v9 = @"...";
    }
    [(JavaLangStringBuilder *)v4 appendWithNSString:v9];
    [(JavaLangStringBuilder *)v4 appendWithNSString:JavaLangSystem_lineSeparator()];
    objc_msgSend(v3, "appendWithJavaLangCharSequence:", -[JavaLangStringBuilder description](v4, "description"));
    [(JavaLangAbstractStringBuilder *)v4 setLengthWithInt:0];
  }
}

- (void)load__WithJavaIoInputStream:(id)a3
{
  objc_sync_enter(self);
  if (!a3)
  {
    id v5 = new_JavaLangNullPointerException_initWithNSString_(@"in == null");
    objc_exception_throw(v5);
  }
  [(JavaUtilProperties *)self load__WithJavaIoReader:new_JavaIoInputStreamReader_initWithJavaIoInputStream_withNSString_(a3, @"ISO-8859-1")];
  objc_sync_exit(self);
}

- (void)load__WithJavaIoReader:(id)a3
{
  objc_sync_enter(self);
  if (!a3)
  {
    v36 = new_JavaLangNullPointerException_initWithNSString_(@"in == null");
    objc_exception_throw(v36);
  }
  v4 = +[IOSCharArray arrayWithLength:40];
  id v5 = new_JavaIoBufferedReader_initWithJavaIoReader_(a3);
  uint64_t v6 = 0;
  uint64_t v39 = 0;
  uint64_t v7 = 0;
  char v8 = 1;
  uint64_t v9 = 0xFFFFFFFFLL;
  while (1)
  {
    uint64_t v10 = v9;
    unsigned int v11 = [(JavaIoBufferedReader *)v5 read];
    unsigned __int16 v12 = v11;
    if (v11 == -1) {
      break;
    }
    if (v7 == v4->super.size_)
    {
      v13 = +[IOSCharArray arrayWithLength:2 * (int)v7];
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v4, 0, v13, 0, v7);
      v4 = v13;
    }
    if (v6 == 1)
    {
      unsigned int v15 = 0;
      if (v12 > 0x65u)
      {
        switch(v12)
        {
          case 'n':
            unsigned int v15 = 0;
            unsigned __int16 v12 = 10;
            goto LABEL_71;
          case 'o':
          case 'p':
          case 'q':
          case 's':
            goto LABEL_71;
          case 'r':
            unsigned int v15 = 0;
            unsigned __int16 v12 = 13;
            goto LABEL_71;
          case 't':
            unsigned int v15 = 0;
            unsigned __int16 v12 = 9;
            goto LABEL_71;
          case 'u':
            uint64_t v39 = 0;
            uint64_t v6 = 2;
            break;
          default:
            if (v12 == 102)
            {
              unsigned int v15 = 0;
              unsigned __int16 v12 = 12;
            }
            goto LABEL_71;
        }
      }
      else if (v12 == 10)
      {
        uint64_t v6 = 5;
      }
      else
      {
        uint64_t v6 = 3;
        if (v12 != 13)
        {
          if (v12 == 98)
          {
            unsigned int v15 = 0;
            unsigned __int16 v12 = 8;
          }
LABEL_71:
          if (v15 == 4) {
            uint64_t v6 = 0;
          }
          else {
            uint64_t v6 = v15;
          }
          if (v15 == 4) {
            uint64_t v9 = v7;
          }
          else {
            uint64_t v9 = v10;
          }
          uint64_t v23 = (int)v7;
          uint64_t size = v4->super.size_;
          if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, (int)v7);
          }
          char v8 = 0;
          uint64_t v7 = (v7 + 1);
          *((_WORD *)&v4->super.size_ + v23 + 2) = v12;
        }
      }
    }
    else if (v6 == 2)
    {
      int v14 = JavaLangCharacter_digitWithChar_withInt_(v12, 16);
      if (v14 < 0)
      {
        if ((int)v39 <= 4)
        {
          v35 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Invalid Unicode sequence: illegal character");
          objc_exception_throw(v35);
        }
        goto LABEL_20;
      }
      uint64_t v6 = 2;
      LODWORD(v39) = v39 + 1;
      WORD2(v39) = v14 + 16 * WORD2(v39);
      if ((int)v39 >= 4)
      {
LABEL_20:
        uint64_t v18 = v4->super.size_;
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v7);
        }
        uint64_t v6 = 0;
        uint64_t v17 = 0;
        uint64_t v16 = (v7 + 1);
        *((_WORD *)&v4->super.size_ + (int)v7 + 2) = WORD2(v39);
        uint64_t v7 = v16;
        if (v12 == 10) {
          goto LABEL_23;
        }
      }
    }
    else
    {
      uint64_t v16 = v7;
      uint64_t v17 = v6;
LABEL_23:
      if (v12 <= 0x22u)
      {
        switch(v12)
        {
          case 0xAu:
            uint64_t v6 = 5;
            uint64_t v7 = v16;
            if (v17 != 3)
            {
LABEL_59:
              if ((int)v16 > 0
                || (v6 = 0, v7 = 0, char v8 = 1, v9 = 0xFFFFFFFFLL, !(v16 | v10)))
              {
                if (v10 == -1) {
                  uint64_t v21 = v16;
                }
                else {
                  uint64_t v21 = v10;
                }
                v22 = +[NSString stringWithCharacters:v4 offset:0 length:v16];
                char v8 = 1;
                uint64_t v9 = 0xFFFFFFFFLL;
                [(JavaUtilHashtable *)self putWithId:[(NSString *)v22 substring:0 endIndex:v21] withId:[(NSString *)v22 substring:v21]];
                uint64_t v6 = 0;
                uint64_t v7 = 0;
              }
            }
            break;
          case 0xDu:
            goto LABEL_59;
          case 0x21u:
LABEL_31:
            if ((v8 & 1) == 0) {
              goto LABEL_43;
            }
            while (1)
            {
              unsigned int v19 = [(JavaIoBufferedReader *)v5 read];
              if (v19 == -1) {
                break;
              }
              char v8 = 1;
              if ((unsigned __int16)v19 == 10 || (unsigned __int16)v19 == 13) {
                goto LABEL_81;
              }
            }
            char v8 = 1;
LABEL_81:
            uint64_t v6 = v17;
            uint64_t v7 = v16;
            break;
          default:
            goto LABEL_43;
        }
      }
      else if (v12 > 0x3Cu)
      {
        if (v12 == 61) {
          goto LABEL_42;
        }
        if (v12 != 92) {
          goto LABEL_43;
        }
        if (v17 == 4) {
          uint64_t v9 = v16;
        }
        else {
          uint64_t v9 = v9;
        }
        uint64_t v6 = 1;
        uint64_t v7 = v16;
      }
      else
      {
        if (v12 == 35) {
          goto LABEL_31;
        }
        if (v12 == 58)
        {
LABEL_42:
          uint64_t v6 = 0;
          uint64_t v7 = v16;
          uint64_t v9 = v16;
          if (v10 != -1) {
            goto LABEL_43;
          }
        }
        else
        {
LABEL_43:
          if (!JavaLangCharacter_isWhitespaceWithChar_(v12)) {
            goto LABEL_51;
          }
          uint64_t v7 = 0;
          uint64_t v17 = v17 == 3 ? 5 : v17;
          uint64_t v6 = v17;
          uint64_t v9 = v10;
          if (v16)
          {
            uint64_t v6 = v17;
            uint64_t v7 = v16;
            uint64_t v9 = v10;
            if (v16 != v10)
            {
              uint64_t v6 = v17;
              uint64_t v7 = v16;
              uint64_t v9 = v10;
              if (v17 != 5)
              {
                uint64_t v9 = 0xFFFFFFFFLL;
                uint64_t v6 = 4;
                uint64_t v7 = v16;
                if (v10 != -1)
                {
LABEL_51:
                  if (v17 == 3 || v17 == 5) {
                    unsigned int v15 = 0;
                  }
                  else {
                    unsigned int v15 = v17;
                  }
                  LODWORD(v7) = v16;
                  goto LABEL_71;
                }
              }
            }
          }
        }
      }
    }
  }
  if (v6 == 2 && (int)v39 <= 4)
  {
    v37 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Invalid Unicode sequence: expected format \\uxxxx");
    objc_exception_throw(v37);
  }
  if ((int)v7 > 0 && v9 == -1) {
    uint64_t v26 = v7;
  }
  else {
    uint64_t v26 = v9;
  }
  if ((v26 & 0x80000000) == 0)
  {
    v27 = +[NSString stringWithCharacters:v4 offset:0 length:v7];
    id v28 = [(NSString *)v27 substring:0 endIndex:v26];
    v30 = [(NSString *)v27 substring:v26];
    v40 = v30;
    if (v6 == 1)
    {
      JreStrAppendStrong(&v40, "$", v29, (uint64_t)v30, v31, v32, v33, v34, &stru_1004A24B8);
      v30 = v40;
    }
    [(JavaUtilHashtable *)self putWithId:v28 withId:v30];
  }
  objc_sync_exit(self);
}

- (id)propertyNames
{
  id v3 = new_JavaUtilHashtable_init();
  sub_100229760(self, v3, 0);
  return [(JavaUtilHashtable *)v3 keys];
}

- (id)stringPropertyNames
{
  id v3 = new_JavaUtilHashtable_init();
  sub_100229760(self, v3, 1);
  id v4 = [(JavaUtilHashtable *)v3 keySet];
  return JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(v4);
}

- (void)selectPropertiesWithJavaUtilHashtable:(id)a3 withBoolean:(BOOL)a4
{
}

- (void)saveWithJavaIoOutputStream:(id)a3 withNSString:(id)a4
{
}

- (void)storeWithJavaIoOutputStream:(id)a3 withNSString:(id)a4
{
  objc_sync_enter(self);
  [(JavaUtilProperties *)self storeWithJavaIoWriter:new_JavaIoOutputStreamWriter_initWithJavaIoOutputStream_withNSString_(a3, @"ISO-8859-1") withNSString:a4];
  objc_sync_exit(self);
}

- (void)storeWithJavaIoWriter:(id)a3 withNSString:(id)a4
{
  objc_sync_enter(self);
  if (a4)
  {
    if (a3)
    {
      [a3 writeWithNSString:@"#"];
      [a3 writeWithNSString:a4];
      [a3 writeWithNSString:JavaLangSystem_lineSeparator()];
      goto LABEL_5;
    }
LABEL_21:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_21;
  }
LABEL_5:
  [a3 writeWithNSString:@"#"];
  objc_msgSend(a3, "writeWithNSString:", -[JavaUtilDate description](new_JavaUtilDate_init(), "description"));
  [a3 writeWithNSString:JavaLangSystem_lineSeparator()];
  uint64_t v7 = new_JavaLangStringBuilder_initWithInt_(0xC8u);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(JavaUtilHashtable *)self entrySet];
  uint64_t v9 = v8;
  if (!v8) {
    JreThrowNullPointerException();
  }
  id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v13) {
          JreThrowNullPointerException();
        }
        id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) getKey];
        objc_opt_class();
        if (v14 && (objc_opt_isKindOfClass() & 1) == 0
          || (sub_100228A64(v7, v14, 1),
              [(JavaLangStringBuilder *)v7 appendWithChar:61],
              id v15 = [v13 getValue],
              objc_opt_class(),
              v15)
          && (objc_opt_isKindOfClass() & 1) == 0)
        {
          JreThrowClassCastException();
        }
        sub_100228A64(v7, v15, 0);
        [(JavaLangStringBuilder *)v7 appendWithNSString:JavaLangSystem_lineSeparator()];
        objc_msgSend(a3, "writeWithNSString:", -[JavaLangStringBuilder description](v7, "description"));
        [(JavaLangAbstractStringBuilder *)v7 setLengthWithInt:0];
      }
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  [a3 flush];
  objc_sync_exit(self);
}

- (void)loadFromXMLWithJavaIoInputStream:(id)a3
{
  objc_sync_enter(self);
  if (!a3)
  {
    uint64_t v7 = new_JavaLangNullPointerException_initWithNSString_(@"in == null");
    objc_exception_throw(v7);
  }
  XMLReader = OrgXmlSaxHelpersXMLReaderFactory_createXMLReader();
  if (!XMLReader) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = [JavaUtilProperties__1 alloc];
  JreStrongAssign((id *)&v6->this$0_, self);
  OrgXmlSaxHelpersDefaultHandler_init(v6);
  [(OrgXmlSaxHelpersParserAdapter *)XMLReader setContentHandlerWithOrgXmlSaxContentHandler:v6];
  [(OrgXmlSaxHelpersParserAdapter *)XMLReader parseWithOrgXmlSaxInputSource:new_OrgXmlSaxInputSource_initWithJavaIoInputStream_((uint64_t)a3)];
  objc_sync_exit(self);
}

- (void)storeToXMLWithJavaIoOutputStream:(id)a3 withNSString:(id)a4
{
}

- (void)storeToXMLWithJavaIoOutputStream:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  objc_sync_enter(self);
  if (!a3)
  {
    CFStringRef v19 = @"os == null";
    goto LABEL_27;
  }
  if (!a5)
  {
    CFStringRef v19 = @"encoding == null";
LABEL_27:
    v20 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v19);
    objc_exception_throw(v20);
  }
  id v8 = JavaNioCharsetCharset_forNameWithNSString_((__CFString *)a5);
  if (!v8) {
    JreThrowNullPointerException();
  }
  uint64_t v9 = (__CFString *)[v8 name];
  id v10 = new_JavaIoPrintStream_initWithJavaIoOutputStream_withBoolean_withNSString_(a3, 0, v9);
  [(JavaIoPrintStream *)v10 printWithNSString:@"<?xml version=\"1.0\" encoding=\""];
  [(JavaIoPrintStream *)v10 printWithNSString:v9];
  [(JavaIoPrintStream *)v10 printlnWithNSString:@"\"?>"];
  [(JavaIoPrintStream *)v10 printWithNSString:@"<!DOCTYPE properties SYSTEM \""];
  [(JavaIoPrintStream *)v10 printWithNSString:off_10055D760];
  [(JavaIoPrintStream *)v10 printlnWithNSString:@"\">"];
  [(JavaIoPrintStream *)v10 printlnWithNSString:@"<properties>"];
  if (a4)
  {
    [(JavaIoPrintStream *)v10 printWithNSString:@"<comment>"];
    [(JavaIoPrintStream *)v10 printWithNSString:sub_10022A150(a4)];
    [(JavaIoPrintStream *)v10 printlnWithNSString:@"</comment>"];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [(JavaUtilHashtable *)self entrySet];
  unsigned __int16 v12 = v11;
  if (!v11) {
    JreThrowNullPointerException();
  }
  id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (!v16) {
          JreThrowNullPointerException();
        }
        id v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) getKey];
        objc_opt_class();
        if (v17 && (objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        id v18 = [v16 getValue];
        objc_opt_class();
        if (v18 && (objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        [(JavaIoPrintStream *)v10 printWithNSString:@"<entry key=\""];
        [(JavaIoPrintStream *)v10 printWithNSString:sub_10022A150(v17)];
        [(JavaIoPrintStream *)v10 printWithNSString:@"\">"];
        [(JavaIoPrintStream *)v10 printWithNSString:sub_10022A150(v18)];
        [(JavaIoPrintStream *)v10 printlnWithNSString:@"</entry>"];
      }
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  [(JavaIoPrintStream *)v10 printlnWithNSString:@"</properties>"];
  [(JavaIoPrintStream *)v10 flush];
  objc_sync_exit(self);
}

- (id)substitutePredefinedEntriesWithNSString:(id)a3
{
  return sub_10022A150(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilProperties;
  [(JavaUtilHashtable *)&v3 dealloc];
}

+ (id)__annotations_saveWithJavaIoOutputStream_withNSString_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004522D8;
}

@end