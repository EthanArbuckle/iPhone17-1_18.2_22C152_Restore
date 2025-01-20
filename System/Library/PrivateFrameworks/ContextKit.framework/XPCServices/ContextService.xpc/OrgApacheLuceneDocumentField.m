@interface OrgApacheLuceneDocumentField
+ (id)translateFieldTypeWithOrgApacheLuceneDocumentField_StoreEnum:(id)a3 withOrgApacheLuceneDocumentField_IndexEnum:(id)a4 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a5;
- (NSString)description;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneDocumentFieldType:(id)a7;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withJavaIoReader:(id)a4;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withJavaIoReader:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withJavaIoReader:(id)a4 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a5;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentField_StoreEnum:(id)a5 withOrgApacheLuceneDocumentField_IndexEnum:(id)a6;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentField_StoreEnum:(id)a5 withOrgApacheLuceneDocumentField_IndexEnum:(id)a6 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a7;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a5;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneDocumentFieldType:(id)a4;
- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5;
- (float)boost;
- (id)binaryValue;
- (id)fieldType;
- (id)name;
- (id)numericValue;
- (id)readerValue;
- (id)stringValue;
- (id)tokenStreamValue;
- (id)tokenStreamWithOrgApacheLuceneAnalysisAnalyzer:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)tokenStream;
- (void)dealloc;
- (void)setBoostWithFloat:(float)a3;
- (void)setByteValueWithByte:(char)a3;
- (void)setBytesValueWithByteArray:(id)a3;
- (void)setBytesValueWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)setDoubleValueWithDouble:(double)a3;
- (void)setFloatValueWithFloat:(float)a3;
- (void)setIntValueWithInt:(int)a3;
- (void)setLongValueWithLong:(int64_t)a3;
- (void)setReaderValueWithJavaIoReader:(id)a3;
- (void)setShortValueWithShort:(signed __int16)a3;
- (void)setStringValueWithNSString:(id)a3;
- (void)setTokenStreamWithOrgApacheLuceneAnalysisTokenStream:(id)a3;
@end

@implementation OrgApacheLuceneDocumentField

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneDocumentFieldType:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withJavaIoReader:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneDocumentFieldType:(id)a7
{
  v10 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(a4, a5, a6);
  OrgApacheLuceneDocumentField_initWithNSString_withOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneDocumentFieldType_((uint64_t)self, a3, v10, a7);
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentFieldType:(id)a5
{
  return self;
}

- (id)stringValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  id fieldsData = self->fieldsData_;
  if (!fieldsData) {
    JreThrowNullPointerException();
  }
  return [fieldsData description];
}

- (id)readerValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id fieldsData = self->fieldsData_;
  objc_opt_class();
  if (fieldsData && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return fieldsData;
}

- (id)tokenStreamValue
{
  return self->tokenStream_;
}

- (void)setStringValueWithNSString:(id)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!*p_fieldsData) {
      JreThrowNullPointerException();
    }
    objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
    CFStringRef v12 = JreStrcat("$$$", v5, v6, v7, v8, v9, v10, v11, @"cannot change value type from ");
LABEL_9:
    v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  if (!a3)
  {
    CFStringRef v12 = @"value cannot be null";
    goto LABEL_9;
  }
  JreStrongAssign(p_fieldsData, a3);
}

- (void)setReaderValueWithJavaIoReader:(id)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v12 = JreStrcat("$$$", v5, v6, v7, v8, v9, v10, v11, @"cannot change value type from ");
      v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
      objc_exception_throw(v13);
    }
    JreThrowNullPointerException();
  }
  JreStrongAssign(p_fieldsData, a3);
}

- (void)setBytesValueWithByteArray:(id)a3
{
  v4 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_(a3);
  [(OrgApacheLuceneDocumentField *)self setBytesValueWithOrgApacheLuceneUtilBytesRef:v4];
}

- (void)setBytesValueWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v15 = JreStrcat("$$$", v8, v9, v10, v11, v12, v13, v14, @"cannot change value type from ");
      goto LABEL_15;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  type = self->type_;
  if (!type) {
    goto LABEL_12;
  }
  id v7 = [(OrgApacheLuceneDocumentFieldType *)type indexOptions];
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v7 != (id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
  {
    CFStringRef v15 = @"cannot set a BytesRef value on an indexed field";
    goto LABEL_15;
  }
  if (!a3)
  {
    CFStringRef v15 = @"value cannot be null";
LABEL_15:
    v16 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  JreStrongAssign(p_fieldsData, a3);
}

- (void)setByteValueWithByte:(char)a3
{
  int v3 = a3;
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v13 = JreStrcat("$$$", v6, v7, v8, v9, v10, v11, v12, @"cannot change value type from ");
      uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    JreThrowNullPointerException();
  }
  uint64_t v5 = (void *)JavaLangByte_valueOfWithByte_(v3);
  JreStrongAssign(p_fieldsData, v5);
}

- (void)setShortValueWithShort:(signed __int16)a3
{
  int v3 = a3;
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v13 = JreStrcat("$$$", v6, v7, v8, v9, v10, v11, v12, @"cannot change value type from ");
      uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    JreThrowNullPointerException();
  }
  uint64_t v5 = JavaLangShort_valueOfWithShort_(v3);
  JreStrongAssign(p_fieldsData, v5);
}

- (void)setIntValueWithInt:(int)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v13 = JreStrcat("$$$", v6, v7, v8, v9, v10, v11, v12, @"cannot change value type from ");
      uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    JreThrowNullPointerException();
  }
  uint64_t v5 = JavaLangInteger_valueOfWithInt_(a3);
  JreStrongAssign(p_fieldsData, v5);
}

- (void)setLongValueWithLong:(int64_t)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v13 = JreStrcat("$$$", v6, v7, v8, v9, v10, v11, v12, @"cannot change value type from ");
      uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    JreThrowNullPointerException();
  }
  uint64_t v5 = JavaLangLong_valueOfWithLong_(a3);
  JreStrongAssign(p_fieldsData, v5);
}

- (void)setFloatValueWithFloat:(float)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v13 = JreStrcat("$$$", v6, v7, v8, v9, v10, v11, v12, @"cannot change value type from ");
      uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    JreThrowNullPointerException();
  }
  uint64_t v5 = JavaLangFloat_valueOfWithFloat_(a3);
  JreStrongAssign(p_fieldsData, v5);
}

- (void)setDoubleValueWithDouble:(double)a3
{
  p_id fieldsData = &self->fieldsData_;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*p_fieldsData)
    {
      objc_msgSend(objc_msgSend(*p_fieldsData, "getClass"), "getSimpleName");
      CFStringRef v13 = JreStrcat("$$$", v6, v7, v8, v9, v10, v11, v12, @"cannot change value type from ");
      uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    JreThrowNullPointerException();
  }
  uint64_t v5 = JavaLangDouble_valueOfWithDouble_(a3);
  JreStrongAssign(p_fieldsData, v5);
}

- (void)setTokenStreamWithOrgApacheLuceneAnalysisTokenStream:(id)a3
{
  type = self->type_;
  if (!type) {
    JreThrowNullPointerException();
  }
  id v6 = [(OrgApacheLuceneDocumentFieldType *)type indexOptions];
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v6 == (id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0]
    || ![(OrgApacheLuceneDocumentFieldType *)self->type_ tokenized])
  {
    CFStringRef v7 = @"TokenStream fields must be indexed and tokenized";
    goto LABEL_13;
  }
  if ([(OrgApacheLuceneDocumentFieldType *)self->type_ numericType])
  {
    CFStringRef v7 = @"cannot set private TokenStream on numeric fields";
LABEL_13:
    uint64_t v8 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v7);
    objc_exception_throw(v8);
  }
  JreStrongAssign((id *)&self->tokenStream_, a3);
}

- (id)name
{
  return self->name_;
}

- (float)boost
{
  return self->boost_;
}

- (void)setBoostWithFloat:(float)a3
{
  if (a3 != 1.0)
  {
    type = self->type_;
    if (!type) {
      JreThrowNullPointerException();
    }
    id v6 = [(OrgApacheLuceneDocumentFieldType *)type indexOptions];
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v6 == (id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0]
      || [(OrgApacheLuceneDocumentFieldType *)self->type_ omitNorms])
    {
      CFStringRef v7 = new_JavaLangIllegalArgumentException_initWithNSString_(@"You cannot set an index-time boost on an unindexed field, or one that omits norms");
      objc_exception_throw(v7);
    }
  }
  self->boost_ = a3;
}

- (id)numericValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id fieldsData = self->fieldsData_;
  objc_opt_class();
  if (fieldsData && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return fieldsData;
}

- (id)binaryValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id fieldsData = self->fieldsData_;
  objc_opt_class();
  if (fieldsData && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return fieldsData;
}

- (NSString)description
{
  int v3 = new_JavaLangStringBuilder_init();
  type = self->type_;
  if (!type) {
    JreThrowNullPointerException();
  }
  [(JavaLangStringBuilder *)v3 appendWithNSString:[(OrgApacheLuceneDocumentFieldType *)type description]];
  [(JavaLangStringBuilder *)v3 appendWithChar:60];
  [(JavaLangStringBuilder *)v3 appendWithNSString:self->name_];
  [(JavaLangStringBuilder *)v3 appendWithChar:58];
  if (self->fieldsData_) {
    -[JavaLangStringBuilder appendWithId:](v3, "appendWithId:");
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:62];
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)fieldType
{
  return self->type_;
}

- (id)tokenStreamWithOrgApacheLuceneAnalysisAnalyzer:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)tokenStream
{
  id v7 = [(OrgApacheLuceneDocumentField *)self fieldType];
  if (!v7) {
    goto LABEL_59;
  }
  id v8 = [v7 indexOptions];
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v8 == (id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0]) {
    return 0;
  }
  id v9 = [(OrgApacheLuceneDocumentField *)self fieldType];
  if (!v9) {
    goto LABEL_59;
  }
  id v10 = [v9 numericType];
  if (v10)
  {
    uint64_t v11 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (tokenStream)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_60;
      }
      unsigned int v12 = [tokenStream getPrecisionStep];
      type = self->type_;
      if (type)
      {
        if (v12 == [(OrgApacheLuceneDocumentFieldType *)type numericPrecisionStep])
        {
          objc_opt_class();
          goto LABEL_15;
        }
LABEL_14:
        tokenStream = new_OrgApacheLuceneAnalysisNumericTokenStream_initWithInt_([(OrgApacheLuceneDocumentFieldType *)self->type_ numericPrecisionStep]);
        objc_opt_class();
        if (!tokenStream)
        {
          int v14 = 1;
LABEL_32:
          id fieldsData = self->fieldsData_;
          objc_opt_class();
          if (!fieldsData || (objc_opt_isKindOfClass() & 1) != 0)
          {
            switch([v11 ordinal])
            {
              case 0u:
                if (v14 || !fieldsData) {
                  goto LABEL_59;
                }
                objc_msgSend(tokenStream, "setIntValueWithInt:", objc_msgSend(fieldsData, "intValue"));
                break;
              case 1u:
                if (v14 || !fieldsData) {
                  goto LABEL_59;
                }
                objc_msgSend(tokenStream, "setLongValueWithLong:", objc_msgSend(fieldsData, "longLongValue"));
                break;
              case 2u:
                if (v14 || !fieldsData) {
                  goto LABEL_59;
                }
                [fieldsData floatValue];
                objc_msgSend(tokenStream, "setFloatValueWithFloat:");
                break;
              case 3u:
                if (v14 || !fieldsData) {
                  goto LABEL_59;
                }
                [fieldsData doubleValue];
                objc_msgSend(tokenStream, "setDoubleValueWithDouble:");
                break;
              default:
                v30 = new_JavaLangAssertionError_initWithId_(@"Should never get here");
                goto LABEL_65;
            }
            return tokenStream;
          }
LABEL_60:
          JreThrowClassCastException();
        }
LABEL_15:
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_60;
        }
        int v14 = 0;
        goto LABEL_32;
      }
    }
LABEL_59:
    JreThrowNullPointerException();
  }
  id v15 = [(OrgApacheLuceneDocumentField *)self fieldType];
  if (!v15) {
    goto LABEL_59;
  }
  if (([v15 tokenized] & 1) == 0)
  {
    if ([(OrgApacheLuceneDocumentField *)self stringValue])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = [OrgApacheLuceneDocumentField_StringTokenStream alloc];
        sub_10006A684((uint64_t)v18);
        tokenStream = v18;
      }
      objc_opt_class();
      if (!tokenStream) {
        goto LABEL_59;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_60;
      }
      objc_msgSend(tokenStream, "setValueWithNSString:", -[OrgApacheLuceneDocumentField stringValue](self, "stringValue"));
    }
    else
    {
      if (![(OrgApacheLuceneDocumentField *)self binaryValue])
      {
        CFStringRef v31 = @"Non-Tokenized Fields must have a String value";
LABEL_64:
        v30 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v31);
LABEL_65:
        objc_exception_throw(v30);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = [OrgApacheLuceneDocumentField_BinaryTokenStream alloc];
        sub_10006A4F4((uint64_t)v20);
        tokenStream = v20;
      }
      objc_opt_class();
      if (!tokenStream) {
        goto LABEL_59;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_60;
      }
      objc_msgSend(tokenStream, "setValueWithOrgApacheLuceneUtilBytesRef:", -[OrgApacheLuceneDocumentField binaryValue](self, "binaryValue"));
    }
    return tokenStream;
  }
  tokenStream = self->tokenStream_;
  if (tokenStream) {
    return tokenStream;
  }
  if ([(OrgApacheLuceneDocumentField *)self readerValue])
  {
    if (!a3) {
      goto LABEL_59;
    }
    id v16 = [(OrgApacheLuceneDocumentField *)self name];
    id v17 = [(OrgApacheLuceneDocumentField *)self readerValue];
    return [a3 tokenStreamWithNSString:v16 withJavaIoReader:v17];
  }
  if (![(OrgApacheLuceneDocumentField *)self stringValue])
  {
    CFStringRef v31 = JreStrcat("$@", v21, v22, v23, v24, v25, v26, v27, @"Field must have either TokenStream, String, Reader or Number value; got ");
    goto LABEL_64;
  }
  if (!a3) {
    goto LABEL_59;
  }
  id v28 = [(OrgApacheLuceneDocumentField *)self name];
  id v29 = [(OrgApacheLuceneDocumentField *)self stringValue];
  return [a3 tokenStreamWithNSString:v28 withNSString:v29];
}

+ (id)translateFieldTypeWithOrgApacheLuceneDocumentField_StoreEnum:(id)a3 withOrgApacheLuceneDocumentField_IndexEnum:(id)a4 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a5
{
  return OrgApacheLuceneDocumentField_translateFieldTypeWithOrgApacheLuceneDocumentField_StoreEnum_withOrgApacheLuceneDocumentField_IndexEnum_withOrgApacheLuceneDocumentField_TermVectorEnum_((uint64_t)a3, a4, a5);
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentField_StoreEnum:(id)a5 withOrgApacheLuceneDocumentField_IndexEnum:(id)a6
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentField_StoreEnum:(id)a5 withOrgApacheLuceneDocumentField_IndexEnum:(id)a6 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a7
{
  id v10 = OrgApacheLuceneDocumentField_translateFieldTypeWithOrgApacheLuceneDocumentField_StoreEnum_withOrgApacheLuceneDocumentField_IndexEnum_withOrgApacheLuceneDocumentField_TermVectorEnum_((uint64_t)a5, a6, a7);
  OrgApacheLuceneDocumentField_initWithNSString_withNSString_withOrgApacheLuceneDocumentFieldType_((uint64_t)self, a3, a4, v10);
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withJavaIoReader:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withJavaIoReader:(id)a4 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4 withOrgApacheLuceneDocumentField_TermVectorEnum:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentField)initWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneDocumentField;
  [(OrgApacheLuceneDocumentField *)&v3 dealloc];
}

@end