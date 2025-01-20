@interface LibcoreNetUriCodec
+ (const)__metadata;
+ (id)decodeWithNSString:(id)a3;
+ (id)decodeWithNSString:(id)a3 withBoolean:(BOOL)a4 withJavaNioCharsetCharset:(id)a5 withBoolean:(BOOL)a6;
+ (int)hexToIntWithChar:(unsigned __int16)a3;
+ (void)appendHexWithJavaLangStringBuilder:(id)a3 withByte:(char)a4;
+ (void)appendHexWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4 withJavaNioCharsetCharset:(id)a5;
+ (void)validateSimpleWithNSString:(id)a3 withNSString:(id)a4;
- (BOOL)isRetainedWithChar:(unsigned __int16)a3;
- (id)encodeWithNSString:(id)a3 withJavaNioCharsetCharset:(id)a4;
- (id)validateWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withNSString:(id)a6;
- (void)appendEncodedWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4;
- (void)appendEncodedWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4 withJavaNioCharsetCharset:(id)a5 withBoolean:(BOOL)a6;
- (void)appendPartiallyEncodedWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4;
@end

@implementation LibcoreNetUriCodec

- (BOOL)isRetainedWithChar:(unsigned __int16)a3
{
  return 0;
}

- (id)validateWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withNSString:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  if (a4 < a5)
  {
    if (a3)
    {
      uint64_t v10 = *(void *)&a4;
      while (1)
      {
        id v11 = [a3 charAtWithInt:v10];
        BOOL v12 = (v11 - 48) >= 0xA
           && (unsigned __int16)(((unsigned __int16)v11 & 0xFFDF) - 65) >= 0x1Au;
        if (v12 && (int v13 = (int)v11, ![(LibcoreNetUriCodec *)self isRetainedWithChar:v11]))
        {
          if (v13 != 37)
          {
            v27 = @"Illegal character in ";
LABEL_36:
            CFStringRef v28 = JreStrcat("$$", v14, v15, v16, v17, v18, v19, v20, v27);
            goto LABEL_38;
          }
          if ((int)v10 + 2 >= (int)v6)
          {
            v27 = @"Incomplete % sequence in ";
            goto LABEL_36;
          }
          unsigned int v22 = [a3 charAtWithInt:(v10 + 1)];
          int v23 = v22 - 48;
          if (v22 - 48 > 9)
          {
            if (v22 - 97 > 5)
            {
              if (v22 - 65 >= 6) {
                int v23 = -1;
              }
              else {
                int v23 = v22 - 55;
              }
            }
            else
            {
              int v23 = v22 - 87;
            }
          }
          unsigned int v24 = [a3 charAtWithInt:(v10 + 2)];
          int v25 = v24 - 48;
          if (v24 - 48 > 9)
          {
            if (v24 - 97 > 5)
            {
              if (v24 - 65 >= 6) {
                int v25 = -1;
              }
              else {
                int v25 = v24 - 55;
              }
            }
            else
            {
              int v25 = v24 - 87;
            }
          }
          if (v23 == -1 || v25 == -1)
          {
            [a3 substring:v10 endIndex:(v10 + 3)];
            CFStringRef v28 = JreStrcat("$$$$", v29, v30, v31, v32, v33, v34, v35, @"Invalid % sequence: ");
LABEL_38:
            v36 = new_JavaNetURISyntaxException_initWithNSString_withNSString_withInt_(a3, (uint64_t)v28, v10);
            objc_exception_throw(v36);
          }
          int v21 = 3;
        }
        else
        {
          int v21 = 1;
        }
        uint64_t v10 = (v10 + v21);
        if ((int)v10 >= (int)v6) {
          goto LABEL_29;
        }
      }
    }
LABEL_33:
    JreThrowNullPointerException();
  }
LABEL_29:
  if (!a3) {
    goto LABEL_33;
  }
  return [a3 substring:v7 endIndex:v6];
}

+ (void)validateSimpleWithNSString:(id)a3 withNSString:(id)a4
{
}

- (void)appendEncodedWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4 withJavaNioCharsetCharset:(id)a5 withBoolean:(BOOL)a6
{
}

- (id)encodeWithNSString:(id)a3 withJavaNioCharsetCharset:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = new_JavaLangStringBuilder_initWithInt_([a3 length] + 16);
  sub_10018013C(self, v7, a3, (uint64_t)a4, 0);
  return [(JavaLangStringBuilder *)v7 description];
}

- (void)appendEncodedWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4
{
  if ((atomic_load_explicit(JavaNioCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = JavaNioCharsetStandardCharsets_UTF_8_;
  sub_10018013C(self, a3, a4, v7, 0);
}

- (void)appendPartiallyEncodedWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4
{
  if ((atomic_load_explicit(JavaNioCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = JavaNioCharsetStandardCharsets_UTF_8_;
  sub_10018013C(self, a3, a4, v7, 1);
}

+ (id)decodeWithNSString:(id)a3 withBoolean:(BOOL)a4 withJavaNioCharsetCharset:(id)a5 withBoolean:(BOOL)a6
{
  return LibcoreNetUriCodec_decodeWithNSString_withBoolean_withJavaNioCharsetCharset_withBoolean_(a3, a4, (uint64_t)a5, a6);
}

+ (int)hexToIntWithChar:(unsigned __int16)a3
{
  if ((a3 - 65) >= 6) {
    int v3 = -1;
  }
  else {
    int v3 = a3 - 55;
  }
  if ((a3 - 97) <= 5) {
    int v4 = a3 - 87;
  }
  else {
    int v4 = v3;
  }
  if ((a3 - 48) <= 9) {
    return a3 - 48;
  }
  else {
    return v4;
  }
}

+ (id)decodeWithNSString:(id)a3
{
  return LibcoreNetUriCodec_decodeWithNSString_(a3);
}

+ (void)appendHexWithJavaLangStringBuilder:(id)a3 withNSString:(id)a4 withJavaNioCharsetCharset:(id)a5
{
}

+ (void)appendHexWithJavaLangStringBuilder:(id)a3 withByte:(char)a4
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004075B0;
}

@end