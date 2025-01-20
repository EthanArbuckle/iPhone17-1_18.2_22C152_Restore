@interface BSDescriptionStream
+ (id)descriptionForRootObject:(id)a3;
+ (id)descriptionForRootObject:(id)a3 withStyle:(id)a4;
- (BOOL)hasDebugStyle;
- (BOOL)hasSuccinctStyle;
- (BOOL)sortKeys;
- (BOOL)verboseSingleItemCollections;
- (BSDescriptionStream)init;
- (BSDescriptionStream)initWithDescriptionStyle:(id)a3;
- (id)appendBool:(BOOL)a3 withName:(id)a4;
- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5;
- (id)appendCString:(const char *)a3 withName:(id)a4;
- (id)appendClass:(Class)a3 withName:(id)a4;
- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5;
- (id)appendFlag:(int64_t)a3 withName:(id)a4;
- (id)appendFlag:(int64_t)a3 withName:(id)a4 skipIfNotSet:(BOOL)a5;
- (id)appendFloat:(double)a3 withName:(id)a4;
- (id)appendInt64:(int64_t)a3 withName:(id)a4;
- (id)appendInt:(int)a3 withName:(id)a4;
- (id)appendInteger:(int64_t)a3 withName:(id)a4;
- (id)appendObject:(id)a3 withName:(id)a4;
- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5;
- (id)appendPoint:(CGPoint)a3 withName:(id)a4;
- (id)appendPointer:(void *)a3 withName:(id)a4;
- (id)appendQueue:(id)a3 withName:(id)a4;
- (id)appendRect:(CGRect)a3 withName:(id)a4;
- (id)appendSelector:(SEL)a3 withName:(id)a4;
- (id)appendSize:(CGSize)a3 withName:(id)a4;
- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5;
- (id)appendUInt64:(unint64_t)a3 withName:(id)a4;
- (id)appendUInt64:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5;
- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4;
- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4;
- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5;
- (id)appendVersionedPID:(int64_t)a3 withName:(id)a4;
- (id)description;
- (id)style;
- (void)_appendDictionary:(__CFString *)a3 withName:(uint64_t)a4 itemBlock:;
- (void)_appendSectionWithTotalItemCount:(unint64_t)a3 truncatedItemCount:(__CFString *)a4 openDelimiter:(__CFString *)a5 closeDelimiter:(uint64_t)a6 block:;
- (void)_overlayStyle:(uint64_t)a3 block:;
- (void)_overrideCollectionLineBreaking:(char)a3 force:(uint64_t)a4 block:;
- (void)appendBodySectionWithName:(id)a3 block:(id)a4;
- (void)appendBodySectionWithName:(id)a3 openDelimiter:(id)a4 closeDelimiter:(id)a5 block:(id)a6;
- (void)appendBodySectionWithOpenDelimiter:(id)a3 closeDelimiter:(id)a4 block:(id)a5;
- (void)appendCollection:(id)a3 withName:(id)a4 itemBlock:(id)a5;
- (void)appendCustomFormatForValue:(id)a3 withCustomFormatForName:(id)a4;
- (void)appendCustomFormatWithName:(id)a3 block:(id)a4;
- (void)appendCustomFormatWithNameFromObjectDescription:(id)a3 block:(id)a4;
- (void)appendDictionary:(id)a3 withName:(id)a4 itemBlock:(id)a5;
- (void)appendFormat:(id)a3;
- (void)appendIntegerMap:(id)a3 withName:(id)a4 keyFormat:(int64_t)a5 valueBlock:(id)a6;
- (void)appendIntegerSet:(id)a3 withName:(id)a4 format:(int64_t)a5;
- (void)appendProem:(id)a3 block:(id)a4;
- (void)appendRightArrow;
- (void)appendString:(id)a3;
- (void)appendString:(id)a3 withName:(id)a4;
- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)overlayStyle:(id)a3 block:(id)a4;
- (void)sameLine:(id)a3;
- (void)setSortKeys:(BOOL)a3;
- (void)setVerboseSingleItemCollections:(BOOL)a3;
@end

@implementation BSDescriptionStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (id)appendInteger:(int64_t)a3 withName:(id)a4
{
  v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%td", (uint64_t)a4, v4, v5, v6, v7, a3);
  return v8;
}

+ (id)descriptionForRootObject:(id)a3
{
  uint64_t v4 = objc_alloc_init(BSDescriptionStream);
  uint64_t v5 = [(BSDescriptionStream *)v4 appendObject:a3 withName:0];
  uint64_t v6 = [v5 description];

  return v6;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return [(BSDescriptionStream *)self appendObject:a3 withName:a4 skipIfNil:0];
}

- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  if (a3 || !a5)
  {
    v8 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_13;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          uint64_t v14 = 2;
          goto LABEL_21;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        v16 = "; ";
        goto LABEL_26;
      case 2:
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t v12 = self->_appendBufferCount;
        v13 = self->_appendBuffer;
        if (v12 <= 1022)
        {
          v13[v12] = 32;
          uint64_t v14 = 1;
          goto LABEL_21;
        }
        v13[v12] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
        p_string = &self->_string;
        v16 = " ";
LABEL_26:
        int64_t *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
        break;
      case 3:
LABEL_13:
        int64_t v17 = self->_appendBufferCount;
        v18 = self->_appendBuffer;
        if (v17 > 1022)
        {
          v18[v17] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v18[v17] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_16;
      case 4:
LABEL_16:
        int64_t indentLevel = self->_indentLevel;
        if (indentLevel < 1) {
          break;
        }
        if (indentLevel >= 8) {
          int64_t indentLevel = 8;
        }
        v20 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
        size_t v21 = strlen(v20);
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t v22 = self->_appendBufferCount;
        if ((uint64_t)(v22 + v21) > 1023)
        {
          if (v22 >= 1)
          {
            self->_appendBuffer[v22] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            int64_t *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
        }
        else
        {
          uint64_t v14 = v21;
          memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_21:
          *p_appendBufferCount += v14;
        }
        break;
      default:
        goto LABEL_28;
    }
    self->_emitPhase = 0;
LABEL_28:
    if (!a4) {
      goto LABEL_60;
    }
    int64_t nameTruncation = v8->_nameTruncation;
    int64_t maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    CFIndex v26 = [a4 length];
    int64_t v27 = self->_appendBufferCount;
    if (v27 + 3 * v26 > 1023)
    {
      if (v27 >= 1)
      {
        self->_appendBuffer[v27] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v26 > 341)
      {
        [(NSMutableString *)self->_string appendString:a4];
        goto LABEL_43;
      }
      CFIndex usedBufLen = 0;
      v50.location = 0;
      v50.length = v26;
      CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v28 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v49.location = 0;
      v49.length = v26;
      CFStringGetBytes((CFStringRef)a4, v49, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
      CFIndex v28 = self->_appendBufferCount + usedBufLen;
    }
    self->_int64_t appendBufferCount = v28;
LABEL_43:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0) {
      v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    }
    else {
      v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    }
    unint64_t v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
    if (v30 < 2)
    {
      int64_t v34 = self->_appendBufferCount;
      v35 = self->_appendBuffer;
      if (v34 <= 1021)
      {
        *(_WORD *)&v35[v34] = 8250;
        uint64_t v33 = 2;
        goto LABEL_55;
      }
      v35[v34] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
      v38 = ": ";
    }
    else if (v30 == 2)
    {
      int64_t v36 = self->_appendBufferCount;
      v37 = &self->_appendBuffer[v36];
      if (v36 <= 1020)
      {
        v37[2] = 32;
        *(_WORD *)v37 = 15648;
        uint64_t v33 = 3;
        goto LABEL_55;
      }
      unsigned __int8 *v37 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v38 = " = ";
    }
    else
    {
      if (v30 != 3) {
        goto LABEL_60;
      }
      int64_t v31 = self->_appendBufferCount;
      v32 = self->_appendBuffer;
      if (v31 <= 1019)
      {
        *(_DWORD *)&v32[v31] = 540945696;
        uint64_t v33 = 4;
LABEL_55:
        self->_appendBufferCount += v33;
        goto LABEL_60;
      }
      v32[v31] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
      v38 = " -> ";
    }
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_60:
    int64_t valueTruncation = v8->_valueTruncation;
    int64_t maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      int64_t maximumValueLengthBeforeTruncation = 0;
      uint64_t v42 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v42 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

    if (a3)
    {
      CFIndex v43 = [a3 length];
      int64_t v44 = self->_appendBufferCount;
      if (3 * v43 + v44 > 1023)
      {
        if (v44 >= 1)
        {
          self->_appendBuffer[v44] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
        }
        if (v43 > 341)
        {
          [(NSMutableString *)self->_string appendString:a3];
          goto LABEL_78;
        }
        CFIndex usedBufLen = 0;
        v52.location = 0;
        v52.length = v43;
        CFStringGetBytes((CFStringRef)a3, v52, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
        CFIndex v45 = usedBufLen;
      }
      else
      {
        CFIndex usedBufLen = 0;
        v51.location = 0;
        v51.length = v43;
        CFStringGetBytes((CFStringRef)a3, v51, 0x8000100u, 0, 0, &self->_appendBuffer[v44], 1024 - v44, &usedBufLen);
        CFIndex v45 = self->_appendBufferCount + usedBufLen;
      }
    }
    else
    {
      int64_t v46 = self->_appendBufferCount;
      v47 = &self->_appendBuffer[v46];
      if (v46 > 1018)
      {
        unsigned __int8 *v47 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
        goto LABEL_78;
      }
      v47[4] = 62;
      *(_DWORD *)v47 = 1818848828;
      CFIndex v45 = self->_appendBufferCount + 5;
    }
    self->_int64_t appendBufferCount = v45;
LABEL_78:
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5
{
  if (a3 || !a5)
  {
    v8 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_13;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          uint64_t v14 = 2;
          goto LABEL_21;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        v16 = "; ";
        goto LABEL_26;
      case 2:
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t v12 = self->_appendBufferCount;
        v13 = self->_appendBuffer;
        if (v12 <= 1022)
        {
          v13[v12] = 32;
          uint64_t v14 = 1;
          goto LABEL_21;
        }
        v13[v12] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
        p_string = &self->_string;
        v16 = " ";
LABEL_26:
        int64_t *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
        break;
      case 3:
LABEL_13:
        int64_t v17 = self->_appendBufferCount;
        v18 = self->_appendBuffer;
        if (v17 > 1022)
        {
          v18[v17] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v18[v17] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_16;
      case 4:
LABEL_16:
        int64_t indentLevel = self->_indentLevel;
        if (indentLevel < 1) {
          break;
        }
        if (indentLevel >= 8) {
          int64_t indentLevel = 8;
        }
        v20 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
        size_t v21 = strlen(v20);
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t v22 = self->_appendBufferCount;
        if ((uint64_t)(v22 + v21) > 1023)
        {
          if (v22 >= 1)
          {
            self->_appendBuffer[v22] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            int64_t *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
        }
        else
        {
          uint64_t v14 = v21;
          memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_21:
          *p_appendBufferCount += v14;
        }
        break;
      default:
        goto LABEL_28;
    }
    self->_emitPhase = 0;
LABEL_28:
    if (!a4) {
      goto LABEL_60;
    }
    int64_t nameTruncation = v8->_nameTruncation;
    int64_t maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    CFIndex v26 = [a4 length];
    int64_t v27 = self->_appendBufferCount;
    if (v27 + 3 * v26 > 1023)
    {
      if (v27 >= 1)
      {
        self->_appendBuffer[v27] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v26 > 341)
      {
        [(NSMutableString *)self->_string appendString:a4];
        goto LABEL_43;
      }
      CFIndex usedBufLen = 0;
      v85.location = 0;
      v85.length = v26;
      CFStringGetBytes((CFStringRef)a4, v85, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v28 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v84.location = 0;
      v84.length = v26;
      CFStringGetBytes((CFStringRef)a4, v84, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
      CFIndex v28 = self->_appendBufferCount + usedBufLen;
    }
    self->_int64_t appendBufferCount = v28;
LABEL_43:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0) {
      v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    }
    else {
      v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    }
    unint64_t v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
    if (v30 < 2)
    {
      int64_t v34 = self->_appendBufferCount;
      v35 = self->_appendBuffer;
      if (v34 <= 1021)
      {
        *(_WORD *)&v35[v34] = 8250;
        uint64_t v33 = 2;
        goto LABEL_55;
      }
      v35[v34] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
      v38 = ": ";
    }
    else if (v30 == 2)
    {
      int64_t v36 = self->_appendBufferCount;
      v37 = &self->_appendBuffer[v36];
      if (v36 <= 1020)
      {
        v37[2] = 32;
        *(_WORD *)v37 = 15648;
        uint64_t v33 = 3;
        goto LABEL_55;
      }
      unsigned __int8 *v37 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v38 = " = ";
    }
    else
    {
      if (v30 != 3) {
        goto LABEL_60;
      }
      int64_t v31 = self->_appendBufferCount;
      v32 = self->_appendBuffer;
      if (v31 <= 1019)
      {
        *(_DWORD *)&v32[v31] = 540945696;
        uint64_t v33 = 4;
LABEL_55:
        self->_appendBufferCount += v33;
        goto LABEL_60;
      }
      v32[v31] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
      v38 = " -> ";
    }
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_60:
    int64_t valueTruncation = v8->_valueTruncation;
    int64_t maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      int64_t maximumValueLengthBeforeTruncation = 0;
      uint64_t v42 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v42 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

    if (!a3)
    {
      int64_t v46 = self->_appendBufferCount;
      v47 = &self->_appendBuffer[v46];
      if (v46 > 1018)
      {
        unsigned __int8 *v47 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
LABEL_143:
        self->_emitPhase = 1;
        BSDescribeTruncationCommit((uint64_t)self);
        goto LABEL_144;
      }
      v47[4] = 62;
      *(_DWORD *)v47 = 1818848828;
      CFIndex v45 = self->_appendBufferCount + 5;
LABEL_83:
      self->_int64_t appendBufferCount = v45;
      goto LABEL_143;
    }
    if (_NSIsNSString())
    {
      CFIndex v43 = [a3 length];
      int64_t v44 = self->_appendBufferCount;
      if (3 * v43 + v44 > 1023)
      {
        if (v44 >= 1)
        {
          self->_appendBuffer[v44] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
        }
        if (v43 > 341)
        {
          [(NSMutableString *)self->_string appendString:a3];
          goto LABEL_143;
        }
        CFIndex usedBufLen = 0;
        v87.location = 0;
        v87.length = v43;
        CFStringGetBytes((CFStringRef)a3, v87, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
        CFIndex v45 = usedBufLen;
      }
      else
      {
        CFIndex usedBufLen = 0;
        v86.location = 0;
        v86.length = v43;
        CFStringGetBytes((CFStringRef)a3, v86, 0x8000100u, 0, 0, &self->_appendBuffer[v44], 1024 - v44, &usedBufLen);
        CFIndex v45 = self->_appendBufferCount + usedBufLen;
      }
      goto LABEL_83;
    }
    if (_NSIsNSNumber())
    {
      id v48 = a3;
      int v49 = *(char *)[v48 objCType];
      if (v49 > 80)
      {
        switch(v49)
        {
          case 'c':
            goto LABEL_102;
          case 'd':
            int64_t v50 = self->_appendBufferCount;
            if (v50 >= 1)
            {
              self->_appendBuffer[v50] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            string = self->_string;
            [v48 doubleValue];
            v53 = @"%0.16g";
            goto LABEL_124;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_116;
          case 'f':
            int64_t v63 = self->_appendBufferCount;
            if (v63 >= 1)
            {
              self->_appendBuffer[v63] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            string = self->_string;
            [v48 floatValue];
            double v52 = v64;
            v53 = @"%0.7g";
LABEL_124:
            -[NSMutableString appendFormat:](string, "appendFormat:", v53, *(void *)&v52);
            goto LABEL_142;
          case 'i':
            int64_t v65 = self->_appendBufferCount;
            if (v65 >= 1)
            {
              self->_appendBuffer[v65] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            v55 = self->_string;
            uint64_t v56 = [v48 intValue];
            goto LABEL_128;
          case 'l':
            int64_t v66 = self->_appendBufferCount;
            if (v66 >= 1)
            {
              self->_appendBuffer[v66] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            v55 = self->_string;
            uint64_t v56 = [v48 longValue];
            v58 = @"%ld";
            goto LABEL_141;
          case 'q':
            int64_t v67 = self->_appendBufferCount;
            if (v67 >= 1)
            {
              self->_appendBuffer[v67] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            v55 = self->_string;
            uint64_t v56 = [v48 longLongValue];
            v58 = @"%lld";
            goto LABEL_141;
          case 's':
            int64_t v68 = self->_appendBufferCount;
            if (v68 >= 1)
            {
              self->_appendBuffer[v68] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            v55 = self->_string;
            uint64_t v56 = [v48 shortValue];
            v58 = @"%hi";
            goto LABEL_141;
          default:
            if (v49 == 81)
            {
              int64_t v69 = self->_appendBufferCount;
              if (v69 >= 1)
              {
                self->_appendBuffer[v69] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_int64_t appendBufferCount = 0;
              }
              v55 = self->_string;
              uint64_t v56 = [v48 unsignedLongLongValue];
              v58 = @"%llu";
            }
            else
            {
              if (v49 != 83) {
                goto LABEL_116;
              }
              int64_t v60 = self->_appendBufferCount;
              if (v60 >= 1)
              {
                self->_appendBuffer[v60] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_int64_t appendBufferCount = 0;
              }
              v55 = self->_string;
              uint64_t v56 = [v48 unsignedShortValue];
              v58 = @"%hu";
            }
            break;
        }
        goto LABEL_141;
      }
      if (v49 > 72)
      {
        if (v49 == 73)
        {
          int64_t v61 = self->_appendBufferCount;
          if (v61 >= 1)
          {
            self->_appendBuffer[v61] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          v55 = self->_string;
          uint64_t v56 = [v48 unsignedIntValue];
          goto LABEL_115;
        }
        if (v49 == 76)
        {
          int64_t v57 = self->_appendBufferCount;
          if (v57 >= 1)
          {
            self->_appendBuffer[v57] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          v55 = self->_string;
          uint64_t v56 = [v48 unsignedLongValue];
          v58 = @"%lu";
          goto LABEL_141;
        }
      }
      else
      {
        if (v49 == 66)
        {
LABEL_102:
          int64_t v59 = self->_appendBufferCount;
          if (v59 >= 1)
          {
            self->_appendBuffer[v59] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          v55 = self->_string;
          uint64_t v56 = [v48 charValue];
LABEL_128:
          v58 = @"%d";
          goto LABEL_141;
        }
        if (v49 == 67)
        {
          int64_t v54 = self->_appendBufferCount;
          if (v54 >= 1)
          {
            self->_appendBuffer[v54] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          v55 = self->_string;
          uint64_t v56 = [v48 unsignedCharValue];
LABEL_115:
          v58 = @"%u";
LABEL_141:
          -[NSMutableString appendFormat:](v55, "appendFormat:", v58, v56);
LABEL_142:

          goto LABEL_143;
        }
      }
LABEL_116:
      int64_t v62 = self->_appendBufferCount;
      if (v62 >= 1)
      {
        self->_appendBuffer[v62] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      -[NSMutableString appendFormat:](self->_string, "appendFormat:", @"<***unknown type:%s>", [v48 objCType]);
      goto LABEL_142;
    }
    if (objc_opt_respondsToSelector())
    {
      [a3 appendDescriptionToStream:self];
      goto LABEL_143;
    }
    if (objc_opt_respondsToSelector())
    {
      [a3 appendDescriptionToFormatter:self];
      goto LABEL_143;
    }
    if (_NSIsNSDictionary())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v79 = 3221225472;
      v80 = __BSDescribeAppendObjectDescription_block_invoke;
      v81 = &unk_1E5446820;
      v82 = self;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:]((uint64_t)self, a3, 0, (uint64_t)&usedBufLen);
      goto LABEL_143;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BSDescriptionStream *)self appendIntegerSet:a3 withName:0 format:0];
      goto LABEL_143;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v79 = 3221225472;
      v80 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v81 = &unk_1E5446848;
      v82 = self;
      [(BSDescriptionStream *)self appendIntegerMap:a3 withName:0 keyFormat:0 valueBlock:&usedBufLen];
      goto LABEL_143;
    }
    if (objc_opt_respondsToSelector())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v79 = 3221225472;
      v80 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v81 = &unk_1E5446848;
      v82 = self;
      [(BSDescriptionStream *)self appendCollection:a3 withName:0 itemBlock:&usedBufLen];
      goto LABEL_143;
    }
    if (self->_forceSuccinct || (style = self->_style, style->_verbosity == 2))
    {
      if (objc_opt_respondsToSelector())
      {
        v73 = [a3 succinctDescription];
        goto LABEL_158;
      }
      style = self->_style;
    }
    if (style->_debugging == 2) {
      [a3 debugDescription];
    }
    else {
    v73 = [a3 description];
    }
LABEL_158:
    v74 = v73;
    CFIndex v75 = [(__CFString *)v73 length];
    int64_t v76 = self->_appendBufferCount;
    if (v76 + 3 * v75 > 1023)
    {
      if (v76 >= 1)
      {
        self->_appendBuffer[v76] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v75 > 341)
      {
        [(NSMutableString *)self->_string appendString:v74];
        goto LABEL_166;
      }
      CFIndex usedBufLen = 0;
      v89.location = 0;
      v89.length = v75;
      CFStringGetBytes(v74, v89, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v77 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v88.location = 0;
      v88.length = v75;
      CFStringGetBytes(v74, v88, 0x8000100u, 0, 0, &self->_appendBuffer[v76], 1024 - v76, &usedBufLen);
      CFIndex v77 = self->_appendBufferCount + usedBufLen;
    }
    self->_int64_t appendBufferCount = v77;
LABEL_166:

    goto LABEL_143;
  }
LABEL_144:
  v70 = self;
  return self;
}

- (id)description
{
  int64_t appendBufferCount = self->_appendBufferCount;
  if (appendBufferCount >= 1)
  {
    self->_appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  string = self->_string;
  return string;
}

- (BSDescriptionStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)BSDescriptionStream;
  v2 = [(BSDescriptionStream *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    string = v2->_string;
    v2->_string = v3;

    uint64_t v5 = _BSDefaultDescriptionStyle();
    style = v2->_style;
    v2->_style = (BSDescriptionStyle *)v5;
  }
  return v2;
}

- (void)_appendDictionary:(__CFString *)a3 withName:(uint64_t)a4 itemBlock:
{
  if (!a1) {
    return;
  }
  if (a3)
  {
    objc_super v8 = *(id *)(a1 + 8);
    switch(*(void *)(a1 + 1104))
    {
      case 1:
        v9 = (void *)(a1 + 1040);
        uint64_t v10 = *(void *)(a1 + 1040);
        v11 = (const char *)(a1 + 16);
        if (*(void *)(*(void *)(a1 + 8) + 24) == 3)
        {
          if (v10 > 1022)
          {
            v11[v10] = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v11, 0x8000100u);
            *(void *)(a1 + 1040) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
          }
          else
          {
            v11[v10] = 59;
            ++*v9;
          }
          goto LABEL_13;
        }
        if (v10 <= 1021)
        {
          *(_WORD *)&v11[v10] = 8251;
          uint64_t v14 = 2;
          goto LABEL_21;
        }
        v11[v10] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v11, 0x8000100u);
        v15 = (CFMutableStringRef *)(a1 + 1064);
        v16 = "; ";
        goto LABEL_26;
      case 2:
        v9 = (void *)(a1 + 1040);
        uint64_t v12 = *(void *)(a1 + 1040);
        v13 = (const char *)(a1 + 16);
        if (v12 <= 1022)
        {
          v13[v12] = 32;
          uint64_t v14 = 1;
          goto LABEL_21;
        }
        v13[v12] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v13, 0x8000100u);
        v15 = (CFMutableStringRef *)(a1 + 1064);
        v16 = " ";
LABEL_26:
        void *v9 = 0;
        CFStringAppendCString(*v15, v16, 0x8000100u);
        break;
      case 3:
LABEL_13:
        uint64_t v17 = *(void *)(a1 + 1040);
        v18 = (const char *)(a1 + 16);
        if (v17 > 1022)
        {
          v18[v17] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v18, 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
        }
        else
        {
          v18[v17] = 10;
          ++*(void *)(a1 + 1040);
        }
        goto LABEL_16;
      case 4:
LABEL_16:
        uint64_t v19 = *(void *)(a1 + 1072);
        if (v19 < 1) {
          break;
        }
        if (v19 >= 8) {
          uint64_t v19 = 8;
        }
        v20 = (const char *)*((void *)&sIndentSpaceStrings + v19);
        size_t v21 = strlen(v20);
        v9 = (void *)(a1 + 1040);
        uint64_t v22 = *(void *)(a1 + 1040);
        if ((uint64_t)(v22 + v21) > 1023)
        {
          if (v22 >= 1)
          {
            *(unsigned char *)(a1 + 16 + v22) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            void *v9 = 0;
          }
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v20, 0x8000100u);
        }
        else
        {
          uint64_t v14 = v21;
          memcpy((void *)(a1 + v22 + 16), v20, v21);
LABEL_21:
          *v9 += v14;
        }
        break;
      default:
        goto LABEL_28;
    }
    *(void *)(a1 + 1104) = 0;
LABEL_28:
    uint64_t v23 = v8[6];
    uint64_t v24 = v8[7];
    if (v23 < 2 || v24 < 1)
    {
      uint64_t v24 = 0;
      uint64_t v26 = 1096;
    }
    else
    {
      *(void *)(a1 + 1096) = v23;
      *(void *)(a1 + 1080) = *(void *)(a1 + 1040) + [*(id *)(a1 + 1064) length];
      uint64_t v26 = 1088;
    }
    *(void *)(a1 + v26) = v24;
    CFIndex v27 = [(__CFString *)a3 length];
    uint64_t v28 = *(void *)(a1 + 1040);
    if (v28 + 3 * v27 > 1023)
    {
      if (v28 >= 1)
      {
        *(unsigned char *)(a1 + 16 + v28) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
        *(void *)(a1 + 1040) = 0;
      }
      if (v27 > 341)
      {
        [*(id *)(a1 + 1064) appendString:a3];
LABEL_42:
        BSDescribeTruncationCommit(a1);
        if (*(uint64_t *)(a1 + 1048) <= 0) {
          unint64_t v30 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
        }
        else {
          unint64_t v30 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
        }
        unint64_t v31 = *(void *)(*(void *)(a1 + 8) + *v30);
        if (v31 < 2)
        {
          uint64_t v35 = *(void *)(a1 + 1040);
          int64_t v36 = (const char *)(a1 + 16);
          if (v35 <= 1021)
          {
            *(_WORD *)&v36[v35] = 8250;
            uint64_t v34 = 2;
            goto LABEL_54;
          }
          v36[v35] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v36, 0x8000100u);
          v39 = ": ";
        }
        else if (v31 == 2)
        {
          uint64_t v37 = *(void *)(a1 + 1040);
          uint64_t v38 = a1 + 16 + v37;
          if (v37 <= 1020)
          {
            *(unsigned char *)(v38 + 2) = 32;
            *(_WORD *)uint64_t v38 = 15648;
            uint64_t v34 = 3;
            goto LABEL_54;
          }
          *(unsigned char *)uint64_t v38 = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          v39 = " = ";
        }
        else
        {
          if (v31 != 3) {
            goto LABEL_59;
          }
          uint64_t v32 = *(void *)(a1 + 1040);
          uint64_t v33 = (const char *)(a1 + 16);
          if (v32 <= 1019)
          {
            *(_DWORD *)&v33[v32] = 540945696;
            uint64_t v34 = 4;
LABEL_54:
            *(void *)(a1 + 1040) += v34;
            goto LABEL_59;
          }
          v33[v32] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v33, 0x8000100u);
          v39 = " -> ";
        }
        *(void *)(a1 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v39, 0x8000100u);
LABEL_59:
        uint64_t v40 = 0;
        uint64_t v41 = v8[8];
        uint64_t v42 = 1096;
        if (v41 >= 2)
        {
          uint64_t v43 = v8[9];
          if (v43 >= 1)
          {
            *(void *)(a1 + 1096) = v41;
            *(void *)(a1 + 1080) = *(void *)(a1 + 1040) + [*(id *)(a1 + 1064) length];
            uint64_t v42 = 1088;
            uint64_t v40 = v43;
          }
        }
        *(void *)(a1 + v42) = v40;

        goto LABEL_63;
      }
      CFIndex usedBufLen = 0;
      v53.location = 0;
      v53.length = v27;
      CFStringGetBytes(a3, v53, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
      CFIndex v29 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v52.location = 0;
      v52.length = v27;
      CFStringGetBytes(a3, v52, 0x8000100u, 0, 0, (UInt8 *)(a1 + v28 + 16), 1024 - v28, &usedBufLen);
      CFIndex v29 = *(void *)(a1 + 1040) + usedBufLen;
    }
    *(void *)(a1 + 1040) = v29;
    goto LABEL_42;
  }
LABEL_63:
  uint64_t v44 = [a2 count];
  uint64_t v45 = *(void *)(a1 + 8);
  if (*(void *)(v45 + 80) == 2)
  {
    uint64_t v46 = *(void *)(v45 + 96);
    BOOL v47 = v46 < v44;
    if (v46 < v44) {
      unint64_t v48 = v46 + 1;
    }
    else {
      unint64_t v48 = v44;
    }
  }
  else
  {
    BOOL v47 = 0;
    unint64_t v48 = v44;
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke;
  v49[3] = &unk_1E5446670;
  v49[4] = a1;
  v49[5] = a2;
  BOOL v50 = v47;
  v49[6] = a4;
  v49[7] = v48;
  -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:](a1, v44, v48, @"{", @"}", (uint64_t)v49);
  if (a3)
  {
    *(void *)(a1 + 1104) = 1;
    BSDescribeTruncationCommit(a1);
  }
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  CFStringRef v8 = @"%llu";
  if (a5 == 1) {
    CFStringRef v8 = @"0x%llX";
  }
  v9 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, v8, (uint64_t)a4, a5, v5, v6, v7, a3);
  return v9;
}

- (void)appendRightArrow
{
  int64_t appendBufferCount = self->_appendBufferCount;
  appendBuffer = self->_appendBuffer;
  if (appendBufferCount > 1019)
  {
    appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, " -> ", 0x8000100u);
  }
  else
  {
    *(_DWORD *)&appendBuffer[appendBufferCount] = 540945696;
    self->_appendBufferCount += 4;
  }
  self->_emitPhase = 0;
}

- (void)appendBodySectionWithName:(id)a3 openDelimiter:(id)a4 closeDelimiter:(id)a5 block:(id)a6
{
  if (!a3) {
    goto LABEL_62;
  }
  v11 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v17 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v19 = "; ";
      goto LABEL_25;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v15 = self->_appendBufferCount;
      v16 = self->_appendBuffer;
      if (v15 <= 1022)
      {
        v16[v15] = 32;
        uint64_t v17 = 1;
        goto LABEL_20;
      }
      v16[v15] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v16, 0x8000100u);
      p_string = &self->_string;
      uint64_t v19 = " ";
LABEL_25:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v19, 0x8000100u);
      break;
    case 3:
LABEL_12:
      int64_t v20 = self->_appendBufferCount;
      size_t v21 = self->_appendBuffer;
      if (v20 > 1022)
      {
        v21[v20] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v21, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v21[v20] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      uint64_t v23 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v24 = strlen(v23);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v25 = self->_appendBufferCount;
      if ((uint64_t)(v25 + v24) > 1023)
      {
        if (v25 >= 1)
        {
          self->_appendBuffer[v25] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v23, 0x8000100u);
      }
      else
      {
        uint64_t v17 = v24;
        memcpy(&self->_appendBuffer[v25], v23, v24);
LABEL_20:
        *p_appendBufferCount += v17;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  int64_t nameTruncation = v11->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v11->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    int64_t maximumNameLengthBeforeTruncation = 0;
    uint64_t v29 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v29 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v29) = (Class)maximumNameLengthBeforeTruncation;
  CFIndex v30 = [a3 length];
  int64_t v31 = self->_appendBufferCount;
  if (v31 + 3 * v30 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v49.location = 0;
    v49.length = v30;
    CFStringGetBytes((CFStringRef)a3, v49, 0x8000100u, 0, 0, &self->_appendBuffer[v31], 1024 - v31, &usedBufLen);
    CFIndex v32 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_int64_t appendBufferCount = v32;
    goto LABEL_41;
  }
  if (v31 >= 1)
  {
    self->_appendBuffer[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  if (v30 <= 341)
  {
    CFIndex usedBufLen = 0;
    v50.location = 0;
    v50.length = v30;
    CFStringGetBytes((CFStringRef)a3, v50, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v32 = usedBufLen;
    goto LABEL_39;
  }
  [(NSMutableString *)self->_string appendString:a3];
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    uint64_t v33 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    uint64_t v33 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v34 = *(unint64_t *)((char *)&self->_style->super.isa + *v33);
  if (v34 < 2)
  {
    int64_t v38 = self->_appendBufferCount;
    v39 = self->_appendBuffer;
    if (v38 <= 1021)
    {
      *(_WORD *)&v39[v38] = 8250;
      uint64_t v37 = 2;
      goto LABEL_53;
    }
    v39[v38] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v39, 0x8000100u);
    uint64_t v42 = ": ";
  }
  else if (v34 == 2)
  {
    int64_t v40 = self->_appendBufferCount;
    uint64_t v41 = &self->_appendBuffer[v40];
    if (v40 <= 1020)
    {
      v41[2] = 32;
      *(_WORD *)uint64_t v41 = 15648;
      uint64_t v37 = 3;
      goto LABEL_53;
    }
    *uint64_t v41 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v42 = " = ";
  }
  else
  {
    if (v34 != 3) {
      goto LABEL_58;
    }
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = self->_appendBuffer;
    if (v35 <= 1019)
    {
      *(_DWORD *)&v36[v35] = 540945696;
      uint64_t v37 = 4;
LABEL_53:
      self->_appendBufferCount += v37;
      goto LABEL_58;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    uint64_t v42 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v42, 0x8000100u);
LABEL_58:
  uint64_t v43 = 0;
  int64_t valueTruncation = v11->_valueTruncation;
  uint64_t v45 = 1096;
  if (valueTruncation >= 2)
  {
    uint64_t maximumValueLengthBeforeTruncation = v11->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v45 = 1088;
      uint64_t v43 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v45) = v43;

LABEL_62:
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __84__BSDescriptionStream_appendBodySectionWithName_openDelimiter_closeDelimiter_block___block_invoke;
  v47[3] = &unk_1E54465D0;
  v47[4] = self;
  v47[5] = a4;
  v47[6] = a5;
  v47[7] = a6;
  -[BSDescriptionStream _overrideCollectionLineBreaking:force:block:](self, 3, 0, (uint64_t)v47);
  if (a3)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

- (void)appendCollection:(id)a3 withName:(id)a4 itemBlock:(id)a5
{
  int v9 = _NSIsNSSet();
  if (!a4) {
    goto LABEL_62;
  }
  uint64_t v10 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v16 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v18 = "; ";
      goto LABEL_25;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v14 = self->_appendBufferCount;
      int64_t v15 = self->_appendBuffer;
      if (v14 <= 1022)
      {
        v15[v14] = 32;
        uint64_t v16 = 1;
        goto LABEL_20;
      }
      v15[v14] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v15, 0x8000100u);
      p_string = &self->_string;
      v18 = " ";
LABEL_25:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v18, 0x8000100u);
      break;
    case 3:
LABEL_12:
      int64_t v19 = self->_appendBufferCount;
      int64_t v20 = self->_appendBuffer;
      if (v19 > 1022)
      {
        v20[v19] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v20, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v20[v19] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      uint64_t v22 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v23 = strlen(v22);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v24 = self->_appendBufferCount;
      if ((uint64_t)(v24 + v23) > 1023)
      {
        if (v24 >= 1)
        {
          self->_appendBuffer[v24] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v22, 0x8000100u);
      }
      else
      {
        uint64_t v16 = v23;
        memcpy(&self->_appendBuffer[v24], v22, v23);
LABEL_20:
        *p_appendBufferCount += v16;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  int64_t nameTruncation = v10->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v10->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    int64_t maximumNameLengthBeforeTruncation = 0;
    uint64_t v28 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v28 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v28) = (Class)maximumNameLengthBeforeTruncation;
  CFIndex v29 = [a4 length];
  int64_t v30 = self->_appendBufferCount;
  if (v30 + 3 * v29 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v57.location = 0;
    v57.length = v29;
    CFStringGetBytes((CFStringRef)a4, v57, 0x8000100u, 0, 0, &self->_appendBuffer[v30], 1024 - v30, &usedBufLen);
    CFIndex v31 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_int64_t appendBufferCount = v31;
    goto LABEL_41;
  }
  if (v30 >= 1)
  {
    self->_appendBuffer[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  if (v29 <= 341)
  {
    CFIndex usedBufLen = 0;
    v58.location = 0;
    v58.length = v29;
    CFStringGetBytes((CFStringRef)a4, v58, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v31 = usedBufLen;
    goto LABEL_39;
  }
  [(NSMutableString *)self->_string appendString:a4];
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v32 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v32 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v33 = *(unint64_t *)((char *)&self->_style->super.isa + *v32);
  if (v33 < 2)
  {
    int64_t v37 = self->_appendBufferCount;
    int64_t v38 = self->_appendBuffer;
    if (v37 <= 1021)
    {
      *(_WORD *)&v38[v37] = 8250;
      uint64_t v36 = 2;
      goto LABEL_53;
    }
    v38[v37] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v38, 0x8000100u);
    uint64_t v41 = ": ";
  }
  else if (v33 == 2)
  {
    int64_t v39 = self->_appendBufferCount;
    int64_t v40 = &self->_appendBuffer[v39];
    if (v39 <= 1020)
    {
      v40[2] = 32;
      *(_WORD *)int64_t v40 = 15648;
      uint64_t v36 = 3;
      goto LABEL_53;
    }
    *int64_t v40 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v41 = " = ";
  }
  else
  {
    if (v33 != 3) {
      goto LABEL_58;
    }
    int64_t v34 = self->_appendBufferCount;
    int64_t v35 = self->_appendBuffer;
    if (v34 <= 1019)
    {
      *(_DWORD *)&v35[v34] = 540945696;
      uint64_t v36 = 4;
LABEL_53:
      self->_appendBufferCount += v36;
      goto LABEL_58;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    uint64_t v41 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v41, 0x8000100u);
LABEL_58:
  uint64_t v42 = 0;
  int64_t valueTruncation = v10->_valueTruncation;
  uint64_t v44 = 1096;
  if (valueTruncation >= 2)
  {
    uint64_t maximumValueLengthBeforeTruncation = v10->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v44 = 1088;
      uint64_t v42 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v44) = v42;

LABEL_62:
  uint64_t v46 = [a3 count];
  style = self->_style;
  if (style->_collectionTruncationStyle == 2)
  {
    int64_t maximumItemCountForTruncation = style->_maximumItemCountForTruncation;
    BOOL v49 = maximumItemCountForTruncation < v46;
    if (maximumItemCountForTruncation < v46) {
      unint64_t v50 = maximumItemCountForTruncation + 1;
    }
    else {
      unint64_t v50 = v46;
    }
  }
  else
  {
    BOOL v49 = 0;
    unint64_t v50 = v46;
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke;
  v53[3] = &unk_1E54465F8;
  if (v9) {
    CFRange v51 = CFSTR("(");
  }
  else {
    CFRange v51 = @"[";
  }
  v53[4] = a3;
  v53[5] = self;
  char v54 = v9;
  BOOL v55 = v49;
  if (v9) {
    CFRange v52 = @"");
  }
  else {
    CFRange v52 = @"]";
  }
  v53[6] = a5;
  v53[7] = v50;
  -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:]((uint64_t)self, v46, v50, v51, v52, (uint64_t)v53);
  if (a4)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

- (void)appendProem:(id)a3 block:(id)a4
{
  ++self->_proemNestCount;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__BSDescriptionStream_appendProem_block___block_invoke;
  v5[3] = &unk_1E5446788;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  -[BSDescriptionStream _overrideCollectionLineBreaking:force:block:](self, 2, 1, (uint64_t)v5);
  --self->_proemNestCount;
}

void __41__BSDescriptionStream_appendProem_block___block_invoke(int8x16_t *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__BSDescriptionStream_appendProem_block___block_invoke_2;
  v2[3] = &unk_1E5446788;
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  uint64_t v4 = a1[3].i64[0];
  if (v1.i64[0]) {
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:](v1.i64[0], -1, 0xFFFFFFFFFFFFFFFFLL, @"<", @">", (uint64_t)v2);
  }
}

- (void)_appendSectionWithTotalItemCount:(unint64_t)a3 truncatedItemCount:(__CFString *)a4 openDelimiter:(__CFString *)a5 closeDelimiter:(uint64_t)a6 block:
{
  if (a1)
  {
    uint64_t v12 = *(void *)(a1 + 1104);
    if (v12 == 1)
    {
      uint64_t v12 = 0;
      *(void *)(a1 + 1104) = 0;
    }
    uint64_t v13 = *(void *)(a1 + 1112);
    *(void *)(a1 + 1112) = a3;
    if (!a3
      || (uint64_t v14 = *(void *)(*(void *)(a1 + 8) + 24), v14 != 3) && !*(unsigned char *)(a1 + 1057) && (a3 < 2 || v14 == 2))
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __110__BSDescriptionStream__appendSectionWithTotalItemCount_truncatedItemCount_openDelimiter_closeDelimiter_block___block_invoke;
      v50[3] = &unk_1E54467B0;
      BOOL v51 = a2 != a3;
      v50[7] = a6;
      v50[8] = a2;
      v50[4] = a1;
      v50[5] = a4;
      v50[6] = a5;
      -[BSDescriptionStream _overrideCollectionLineBreaking:force:block:]((void *)a1, 2, 0, (uint64_t)v50);
LABEL_87:
      *(void *)(a1 + 1112) = v13;
      return;
    }
    if (v12 != 4)
    {
      if (v12 != 3)
      {
        if (v12 != 2) {
          goto LABEL_30;
        }
        uint64_t v15 = *(void *)(a1 + 1040);
        uint64_t v16 = (const char *)(a1 + 16);
        if (v15 <= 1022)
        {
          v16[v15] = 32;
          uint64_t v17 = *(void *)(a1 + 1040) + 1;
LABEL_24:
          *(void *)(a1 + 1040) = v17;
          goto LABEL_29;
        }
        v16[v15] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v16, 0x8000100u);
        *(void *)(a1 + 1040) = 0;
        int64_t v20 = *(__CFString **)(a1 + 1064);
        size_t v21 = " ";
        goto LABEL_28;
      }
      uint64_t v18 = *(void *)(a1 + 1040);
      int64_t v19 = (const char *)(a1 + 16);
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v19, 0x8000100u);
        *(void *)(a1 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++*(void *)(a1 + 1040);
      }
    }
    uint64_t v22 = *(void *)(a1 + 1072);
    if (v22 < 1)
    {
LABEL_29:
      *(void *)(a1 + 1104) = 0;
LABEL_30:
      if (a2 != a3)
      {
        uint64_t v27 = *(void *)(a1 + 1040);
        uint64_t v28 = a1 + 16;
        if (v27 > 1022)
        {
          *(unsigned char *)(v28 + v27) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "|", 0x8000100u);
          uint64_t v29 = *(void *)(a1 + 1040);
        }
        else
        {
          *(unsigned char *)(v28 + v27) = 124;
          uint64_t v29 = *(void *)(a1 + 1040) + 1;
          *(void *)(a1 + 1040) = v29;
        }
        if (v29 >= 1)
        {
          *(unsigned char *)(v28 + v29) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(void *)(a1 + 1040) = 0;
        }
        objc_msgSend(*(id *)(a1 + 1064), "appendFormat:", @"%d", a2);
        uint64_t v30 = *(void *)(a1 + 1040);
        if (v30 > 1021)
        {
          *(unsigned char *)(v28 + v30) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "| ", 0x8000100u);
        }
        else
        {
          *(_WORD *)(v28 + v30) = 8316;
          *(void *)(a1 + 1040) += 2;
        }
      }
      CFIndex v31 = [(__CFString *)a4 length];
      uint64_t v32 = *(void *)(a1 + 1040);
      if (3 * v31 + v32 > 1023)
      {
        if (v32 >= 1)
        {
          *(unsigned char *)(a1 + 16 + v32) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(void *)(a1 + 1040) = 0;
        }
        if (v31 > 341)
        {
          [*(id *)(a1 + 1064) appendString:a4];
          CFIndex v33 = *(void *)(a1 + 1040);
LABEL_47:
          uint64_t v34 = a1 + 16;
          if (v33 > 1022)
          {
            *(unsigned char *)(v34 + v33) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *(void *)(a1 + 1040) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
          }
          else
          {
            *(unsigned char *)(v34 + v33) = 10;
            ++*(void *)(a1 + 1040);
          }
          *(void *)(a1 + 1104) = 4;
          ++*(void *)(a1 + 1072);
          (*(void (**)(uint64_t))(a6 + 16))(a6);
          uint64_t v35 = *(void *)(a1 + 1104);
          if (v35 == 3)
          {
            *(void *)(a1 + 1104) = 4;
            uint64_t v36 = *(void *)(a1 + 1072) - 1;
            *(void *)(a1 + 1072) = v36;
          }
          else
          {
            uint64_t v36 = *(void *)(a1 + 1072) - 1;
            *(void *)(a1 + 1072) = v36;
            switch(v35)
            {
              case 1:
                uint64_t v45 = *(void *)(a1 + 1040);
                if (*(void *)(*(void *)(a1 + 8) + 24) != 3)
                {
                  if (v45 <= 1021)
                  {
                    *(_WORD *)(v34 + v45) = 8251;
                    uint64_t v41 = *(void *)(a1 + 1040) + 2;
                    goto LABEL_71;
                  }
                  *(unsigned char *)(v34 + v45) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                  *(void *)(a1 + 1040) = 0;
                  uint64_t v43 = *(__CFString **)(a1 + 1064);
                  uint64_t v44 = "; ";
                  goto LABEL_76;
                }
                if (v45 > 1022)
                {
                  *(unsigned char *)(v34 + v45) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                  *(void *)(a1 + 1040) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
                  uint64_t v46 = *(void *)(a1 + 1040);
                }
                else
                {
                  *(unsigned char *)(v34 + v45) = 59;
                  uint64_t v46 = *(void *)(a1 + 1040) + 1;
                  *(void *)(a1 + 1040) = v46;
                }
                if (v46 > 1022)
                {
                  *(unsigned char *)(v34 + v46) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                  *(void *)(a1 + 1040) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
                }
                else
                {
                  *(unsigned char *)(v34 + v46) = 10;
                  ++*(void *)(a1 + 1040);
                }
                uint64_t v36 = *(void *)(a1 + 1072);
                break;
              case 4:
                break;
              case 2:
                uint64_t v42 = *(void *)(a1 + 1040);
                if (v42 <= 1022)
                {
                  *(unsigned char *)(v34 + v42) = 32;
                  uint64_t v41 = *(void *)(a1 + 1040) + 1;
                  goto LABEL_71;
                }
                *(unsigned char *)(v34 + v42) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                *(void *)(a1 + 1040) = 0;
                uint64_t v43 = *(__CFString **)(a1 + 1064);
                uint64_t v44 = " ";
LABEL_76:
                CFStringAppendCString(v43, v44, 0x8000100u);
                goto LABEL_77;
              default:
                goto LABEL_78;
            }
          }
          if (v36 < 1)
          {
LABEL_77:
            *(void *)(a1 + 1104) = 0;
LABEL_78:
            CFIndex v47 = [(__CFString *)a5 length];
            uint64_t v48 = *(void *)(a1 + 1040);
            if (3 * v47 + v48 > 1023)
            {
              if (v48 >= 1)
              {
                *(unsigned char *)(v34 + v48) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                *(void *)(a1 + 1040) = 0;
              }
              if (v47 > 341)
              {
                [*(id *)(a1 + 1064) appendString:a5];
                goto LABEL_86;
              }
              CFIndex usedBufLen = 0;
              v56.location = 0;
              v56.length = v47;
              CFStringGetBytes(a5, v56, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
              CFIndex v49 = usedBufLen;
            }
            else
            {
              CFIndex usedBufLen = 0;
              v55.location = 0;
              v55.length = v47;
              CFStringGetBytes(a5, v55, 0x8000100u, 0, 0, (UInt8 *)(v34 + v48), 1024 - v48, &usedBufLen);
              CFIndex v49 = *(void *)(a1 + 1040) + usedBufLen;
            }
            *(void *)(a1 + 1040) = v49;
LABEL_86:
            *(void *)(a1 + 1104) = 3;
            goto LABEL_87;
          }
          if (v36 >= 8) {
            uint64_t v36 = 8;
          }
          int64_t v37 = (const char *)*((void *)&sIndentSpaceStrings + v36);
          size_t v38 = strlen(v37);
          uint64_t v39 = *(void *)(a1 + 1040);
          if ((uint64_t)(v39 + v38) <= 1023)
          {
            size_t v40 = v38;
            memcpy((void *)(v34 + v39), v37, v38);
            uint64_t v41 = *(void *)(a1 + 1040) + v40;
LABEL_71:
            *(void *)(a1 + 1040) = v41;
            goto LABEL_77;
          }
          if (v39 >= 1)
          {
            *(unsigned char *)(v34 + v39) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *(void *)(a1 + 1040) = 0;
          }
          uint64_t v43 = *(__CFString **)(a1 + 1064);
          uint64_t v44 = v37;
          goto LABEL_76;
        }
        CFIndex usedBufLen = 0;
        v54.location = 0;
        v54.length = v31;
        CFStringGetBytes(a4, v54, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
        CFIndex v33 = usedBufLen;
      }
      else
      {
        CFIndex usedBufLen = 0;
        v53.location = 0;
        v53.length = v31;
        CFStringGetBytes(a4, v53, 0x8000100u, 0, 0, (UInt8 *)(a1 + v32 + 16), 1024 - v32, &usedBufLen);
        CFIndex v33 = *(void *)(a1 + 1040) + usedBufLen;
      }
      *(void *)(a1 + 1040) = v33;
      goto LABEL_47;
    }
    if (v22 >= 8) {
      uint64_t v22 = 8;
    }
    size_t v23 = (const char *)*((void *)&sIndentSpaceStrings + v22);
    size_t v24 = strlen(v23);
    uint64_t v25 = *(void *)(a1 + 1040);
    if ((uint64_t)(v25 + v24) <= 1023)
    {
      size_t v26 = v24;
      memcpy((void *)(a1 + v25 + 16), v23, v24);
      uint64_t v17 = *(void *)(a1 + 1040) + v26;
      goto LABEL_24;
    }
    if (v25 >= 1)
    {
      *(unsigned char *)(a1 + 16 + v25) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
      *(void *)(a1 + 1040) = 0;
    }
    int64_t v20 = *(__CFString **)(a1 + 1064);
    size_t v21 = v23;
LABEL_28:
    CFStringAppendCString(v20, v21, 0x8000100u);
    goto LABEL_29;
  }
}

- (void)_overrideCollectionLineBreaking:(char)a3 force:(uint64_t)a4 block:
{
  if (!a1) {
    return;
  }
  if (*(uint64_t *)(a1[1] + 24) < 2 || (a3 & 1) != 0)
  {
    if (a2 == 3)
    {
      id v6 = +[BSDescriptionStyle collectionLineBreakEachItemStyle];
      objc_msgSend(a1, "overlayStyle:block:");
      goto LABEL_11;
    }
    if (a2 == 2)
    {
      id v6 = +[BSDescriptionStyle collectionLineBreakNoneStyle];
      objc_msgSend(a1, "overlayStyle:block:");
LABEL_11:

      return;
    }
  }
  uint64_t v5 = *(void (**)(uint64_t))(a4 + 16);
  v5(a4);
}

CFIndex __110__BSDescriptionStream__appendSectionWithTotalItemCount_truncatedItemCount_openDelimiter_closeDelimiter_block___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(v2 + 1040);
    uint64_t v5 = v2 + 16;
    if (v4 > 1022)
    {
      *(unsigned char *)(v5 + v4) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(void *)(v2 + 1040) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), "|", 0x8000100u);
      uint64_t v6 = *(void *)(v2 + 1040);
    }
    else
    {
      *(unsigned char *)(v5 + v4) = 124;
      uint64_t v6 = *(void *)(v2 + 1040) + 1;
      *(void *)(v2 + 1040) = v6;
    }
    if (v6 >= 1)
    {
      *(unsigned char *)(v5 + v6) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(void *)(v2 + 1040) = 0;
    }
    objc_msgSend(*(id *)(v2 + 1064), "appendFormat:", @"%d", v3);
    uint64_t v7 = *(void *)(v2 + 1040);
    if (v7 > 1021)
    {
      *(unsigned char *)(v5 + v7) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(void *)(v2 + 1040) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), "| ", 0x8000100u);
    }
    else
    {
      *(_WORD *)(v5 + v7) = 8316;
      *(void *)(v2 + 1040) += 2;
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  CFStringRef v8 = *(__CFString **)(a1 + 40);
  CFIndex v10 = [(__CFString *)v8 length];
  uint64_t v11 = *(void *)(v9 + 1040);
  if (3 * v10 + v11 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v20.location = 0;
    v20.length = v10;
    CFStringGetBytes(v8, v20, 0x8000100u, 0, 0, (UInt8 *)(v9 + v11 + 16), 1024 - v11, &usedBufLen);
    CFIndex v12 = *(void *)(v9 + 1040) + usedBufLen;
LABEL_16:
    *(void *)(v9 + 1040) = v12;
    goto LABEL_18;
  }
  if (v11 >= 1)
  {
    *(unsigned char *)(v9 + 16 + v11) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v9 + 1064), (const char *)(v9 + 16), 0x8000100u);
    *(void *)(v9 + 1040) = 0;
  }
  if (v10 <= 341)
  {
    CFIndex usedBufLen = 0;
    v21.location = 0;
    v21.length = v10;
    CFStringGetBytes(v8, v21, 0x8000100u, 0, 0, (UInt8 *)(v9 + 16), 1024, &usedBufLen);
    CFIndex v12 = usedBufLen;
    goto LABEL_16;
  }
  [*(id *)(v9 + 1064) appendString:v8];
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(__CFString **)(a1 + 48);
  CFIndex v15 = [(__CFString *)v14 length];
  uint64_t v16 = *(void *)(v13 + 1040);
  if (3 * v15 + v16 > 1023)
  {
    if (v16 >= 1)
    {
      *(unsigned char *)(v13 + 16 + v16) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v13 + 1064), (const char *)(v13 + 16), 0x8000100u);
      *(void *)(v13 + 1040) = 0;
    }
    if (v15 > 341)
    {
      CFIndex result = [*(id *)(v13 + 1064) appendString:v14];
      goto LABEL_26;
    }
    CFIndex usedBufLen = 0;
    v23.location = 0;
    v23.length = v15;
    CFIndex result = CFStringGetBytes(v14, v23, 0x8000100u, 0, 0, (UInt8 *)(v13 + 16), 1024, &usedBufLen);
    CFIndex v18 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v22.location = 0;
    v22.length = v15;
    CFIndex result = CFStringGetBytes(v14, v22, 0x8000100u, 0, 0, (UInt8 *)(v13 + v16 + 16), 1024 - v16, &usedBufLen);
    CFIndex v18 = *(void *)(v13 + 1040) + usedBufLen;
  }
  *(void *)(v13 + 1040) = v18;
LABEL_26:
  *(void *)(*(void *)(a1 + 32) + 1104) = 2;
  return result;
}

- (void)overlayStyle:(id)a3 block:(id)a4
{
}

- (void)_overlayStyle:(uint64_t)a3 block:
{
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 8);
    if (v6 == (void *)a2)
    {
      uint64_t v11 = *(void (**)(uint64_t))(a3 + 16);
      v11(a3);
    }
    else
    {
      id v7 = v6;
      uint64_t v8 = -[BSDescriptionStyle _styleByOverlayingStyle:](*(CFSetRef **)(a1 + 8), a2);
      uint64_t v9 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v8;

      (*(void (**)(uint64_t))(a3 + 16))(a3);
      CFIndex v10 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v7;
    }
  }
}

uint64_t __41__BSDescriptionStream_appendProem_block___block_invoke_2(void *a1)
{
  if (!a1[4]) {
    goto LABEL_68;
  }
  uint64_t v2 = a1[5];
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(id *)(v2 + 8);
  switch(*(void *)(v2 + 1104))
  {
    case 1:
      uint64_t v6 = (void *)(v2 + 1040);
      uint64_t v7 = *(void *)(v2 + 1040);
      uint64_t v8 = (const char *)(v2 + 16);
      if (*(void *)(*(void *)(v2 + 8) + 24) == 3)
      {
        if (v7 > 1022)
        {
          v8[v7] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v8, 0x8000100u);
          *(void *)(v2 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), ";", 0x8000100u);
        }
        else
        {
          v8[v7] = 59;
          ++*v6;
        }
        goto LABEL_12;
      }
      if (v7 <= 1021)
      {
        *(_WORD *)&v8[v7] = 8251;
        uint64_t v11 = 2;
        goto LABEL_20;
      }
      v8[v7] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v8, 0x8000100u);
      CFIndex v12 = (CFMutableStringRef *)(v2 + 1064);
      uint64_t v13 = "; ";
      goto LABEL_25;
    case 2:
      uint64_t v6 = (void *)(v2 + 1040);
      uint64_t v9 = *(void *)(v2 + 1040);
      CFIndex v10 = (const char *)(v2 + 16);
      if (v9 <= 1022)
      {
        v10[v9] = 32;
        uint64_t v11 = 1;
        goto LABEL_20;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v10, 0x8000100u);
      CFIndex v12 = (CFMutableStringRef *)(v2 + 1064);
      uint64_t v13 = " ";
LABEL_25:
      *uint64_t v6 = 0;
      CFStringAppendCString(*v12, v13, 0x8000100u);
      break;
    case 3:
LABEL_12:
      uint64_t v14 = *(void *)(v2 + 1040);
      CFIndex v15 = (const char *)(v2 + 16);
      if (v14 > 1022)
      {
        v15[v14] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v15, 0x8000100u);
        *(void *)(v2 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v15[v14] = 10;
        ++*(void *)(v2 + 1040);
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      uint64_t v16 = *(void *)(v2 + 1072);
      if (v16 < 1) {
        break;
      }
      if (v16 >= 8) {
        uint64_t v16 = 8;
      }
      uint64_t v17 = (const char *)*((void *)&sIndentSpaceStrings + v16);
      size_t v18 = strlen(v17);
      uint64_t v6 = (void *)(v2 + 1040);
      uint64_t v19 = *(void *)(v2 + 1040);
      if ((uint64_t)(v19 + v18) > 1023)
      {
        if (v19 >= 1)
        {
          *(unsigned char *)(v2 + 16 + v19) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
          *uint64_t v6 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v17, 0x8000100u);
      }
      else
      {
        uint64_t v11 = v18;
        memcpy((void *)(v2 + v19 + 16), v17, v18);
LABEL_20:
        *v6 += v11;
      }
      break;
    default:
      goto LABEL_27;
  }
  *(void *)(v2 + 1104) = 0;
LABEL_27:
  if (!v4) {
    goto LABEL_59;
  }
  uint64_t v20 = v5[6];
  uint64_t v21 = v5[7];
  if (v20 < 2 || v21 < 1)
  {
    *(void *)(v2 + 1096) = 0;
  }
  else
  {
    *(void *)(v2 + 1096) = v20;
    *(void *)(v2 + 1080) = *(void *)(v2 + 1040) + [*(id *)(v2 + 1064) length];
    *(void *)(v2 + 1088) = v21;
  }
  CFIndex v23 = [(__CFString *)v4 length];
  uint64_t v24 = *(void *)(v2 + 1040);
  if (v24 + 3 * v23 > 1023)
  {
    if (v24 >= 1)
    {
      *(unsigned char *)(v2 + 16 + v24) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(void *)(v2 + 1040) = 0;
    }
    if (v23 > 341)
    {
      [*(id *)(v2 + 1064) appendString:v4];
      goto LABEL_42;
    }
    CFIndex usedBufLen = 0;
    v47.location = 0;
    v47.length = v23;
    CFStringGetBytes(v4, v47, 0x8000100u, 0, 0, (UInt8 *)(v2 + 16), 1024, &usedBufLen);
    CFIndex v25 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v46.location = 0;
    v46.length = v23;
    CFStringGetBytes(v4, v46, 0x8000100u, 0, 0, (UInt8 *)(v2 + v24 + 16), 1024 - v24, &usedBufLen);
    CFIndex v25 = *(void *)(v2 + 1040) + usedBufLen;
  }
  *(void *)(v2 + 1040) = v25;
LABEL_42:
  BSDescribeTruncationCommit(v2);
  if (*(uint64_t *)(v2 + 1048) <= 0) {
    size_t v26 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    size_t v26 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v27 = *(void *)(*(void *)(v2 + 8) + *v26);
  if (v27 < 2)
  {
    uint64_t v31 = *(void *)(v2 + 1040);
    uint64_t v32 = (const char *)(v2 + 16);
    if (v31 <= 1021)
    {
      *(_WORD *)&v32[v31] = 8250;
      uint64_t v30 = 2;
      goto LABEL_54;
    }
    v32[v31] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v32, 0x8000100u);
    uint64_t v35 = ": ";
LABEL_58:
    *(void *)(v2 + 1040) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v35, 0x8000100u);
    goto LABEL_59;
  }
  if (v27 == 2)
  {
    uint64_t v33 = *(void *)(v2 + 1040);
    uint64_t v34 = v2 + 16 + v33;
    if (v33 <= 1020)
    {
      *(unsigned char *)(v34 + 2) = 32;
      *(_WORD *)uint64_t v34 = 15648;
      uint64_t v30 = 3;
      goto LABEL_54;
    }
    *(unsigned char *)uint64_t v34 = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
    uint64_t v35 = " = ";
    goto LABEL_58;
  }
  if (v27 == 3)
  {
    uint64_t v28 = *(void *)(v2 + 1040);
    uint64_t v29 = (const char *)(v2 + 16);
    if (v28 <= 1019)
    {
      *(_DWORD *)&v29[v28] = 540945696;
      uint64_t v30 = 4;
LABEL_54:
      *(void *)(v2 + 1040) += v30;
      goto LABEL_59;
    }
    v29[v28] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v29, 0x8000100u);
    uint64_t v35 = " -> ";
    goto LABEL_58;
  }
LABEL_59:
  uint64_t v36 = v5[8];
  uint64_t v37 = v5[9];
  if (v36 <= 1 || v37 < 1)
  {
    uint64_t v37 = 0;
    uint64_t v39 = 1096;
  }
  else
  {
    *(void *)(v2 + 1096) = v36;
    *(void *)(v2 + 1080) = *(void *)(v2 + 1040) + [*(id *)(v2 + 1064) length];
    uint64_t v39 = 1088;
  }
  *(void *)(v2 + v39) = v37;

  uint64_t v40 = a1[5];
  uint64_t v41 = *(void *)(v40 + 1040);
  if (v41 >= 1)
  {
    *(unsigned char *)(v40 + 16 + v41) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v40 + 1064), (const char *)(v40 + 16), 0x8000100u);
    *(void *)(v40 + 1040) = 0;
    uint64_t v40 = a1[5];
  }
  objc_msgSend(*(id *)(v40 + 1064), "appendFormat:", @"%p", a1[4]);
  uint64_t v42 = a1[5];
  *(void *)(v42 + 1104) = 1;
  BSDescribeTruncationCommit(v42);
LABEL_68:
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  uint64_t v44 = a1[5];
  if (*(void *)(v44 + 1104) == 1) {
    *(void *)(v44 + 1104) = 0;
  }
  return result;
}

- (void)appendString:(id)a3 withName:(id)a4
{
}

void __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 && *(void *)(*(void *)(v4 + 8) + 88) == 2 && *(unsigned char *)(a1 + 64))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v28;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v5);
          }
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

            id v10 = *(id *)(a1 + 32);
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v9 = [*(id *)(a1 + 32) allObjects];
    id v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    uint64_t v3 = v9;
LABEL_15:
  }
  else
  {
    id v10 = v2;
  }
  long long v26 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v24;
LABEL_18:
    uint64_t v15 = 0;
    uint64_t v16 = v12 + v13;
    while (1)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v15);
      if (*(unsigned char *)(a1 + 65))
      {
        if (v13 + v15 >= *(void *)(a1 + 56) - 1) {
          break;
        }
      }
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_2;
      v22[3] = &unk_1E5445C90;
      v22[4] = v17;
      v22[5] = v19;
      BSDescribeAppendItem(v18, (uint64_t)v22);
      if (v12 == ++v15)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        uint64_t v13 = v16;
        if (v12) {
          goto LABEL_18;
        }
        break;
      }
    }
  }

  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_3;
    v21[3] = &unk_1E54457C8;
    v21[4] = v20;
    BSDescribeAppendItem(v20, (uint64_t)v21);
  }
}

uint64_t __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84__BSDescriptionStream_appendBodySectionWithName_openDelimiter_closeDelimiter_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:](v2, -1, 0xFFFFFFFFFFFFFFFFLL, *(__CFString **)(a1 + 40), *(__CFString **)(a1 + 48), *(void *)(a1 + 56));
  }
}

uint64_t __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)style
{
  return self->_style;
}

- (void)appendBodySectionWithName:(id)a3 block:(id)a4
{
}

void __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(*(void *)(v2 + 8) + 88) == 2)
  {
    [*(id *)(a1 + 40) allKeys];
    long long v33 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v31 != v5) {
            objc_enumerationMutation(v3);
          }
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

            id v10 = v3;
            goto LABEL_15;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v10 = [v3 sortedArrayUsingSelector:sel_compare_];
LABEL_15:
    long long v29 = 0u;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v27;
LABEL_17:
      uint64_t v15 = 0;
      uint64_t v19 = v12 + v13;
      while (1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
        if (*(unsigned char *)(a1 + 64))
        {
          if (v13 + v15 >= *(void *)(a1 + 56) - 1) {
            break;
          }
        }
        uint64_t v17 = *(void *)(a1 + 32);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_2;
        v24[3] = &unk_1E5446788;
        v24[4] = v16;
        long long v25 = *(_OWORD *)(a1 + 40);
        BSDescribeAppendItem(v17, (uint64_t)v24);
        if (v12 == ++v15)
        {
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          uint64_t v13 = v19;
          if (v12) {
            goto LABEL_17;
          }
          break;
        }
      }
    }
  }
  else
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_3;
    v21[3] = &unk_1E5446648;
    char v22 = *(unsigned char *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v21[6] = v23;
    v21[7] = v7;
    v21[4] = v2;
    void v21[5] = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v21];
    _Block_object_dispose(v23, 8);
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_5;
    v20[3] = &unk_1E54457C8;
    v20[4] = v18;
    BSDescribeAppendItem(v18, (uint64_t)v20);
  }
}

- (void)appendCustomFormatWithName:(id)a3 block:(id)a4
{
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      uint64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      uint64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      uint64_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a3) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a3 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a3];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v44.location = 0;
    v44.length = v25;
    CFStringGetBytes((CFStringRef)a3, v44, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v43.location = 0;
    v43.length = v25;
    CFStringGetBytes((CFStringRef)a3, v43, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    long long v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    long long v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    uint64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    uint64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    uint64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)uint64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *uint64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    long long v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    uint64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  (*((void (**)(id, BSDescriptionStream *))a4 + 2))(a4, self);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
}

- (id)appendInt:(int)a3 withName:(id)a4
{
  uint64_t v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%d", (uint64_t)a4, v4, v5, v6, v7, a3);
  return v8;
}

- (BOOL)hasDebugStyle
{
  return self->_style->_debugging == 2;
}

- (id)appendVersionedPID:(int64_t)a3 withName:(id)a4
{
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      uint64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      uint64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      uint64_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a4 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v45.location = 0;
    v45.length = v25;
    CFStringGetBytes((CFStringRef)a4, v45, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v44.location = 0;
    v44.length = v25;
    CFStringGetBytes((CFStringRef)a4, v44, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    long long v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    long long v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    uint64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    uint64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    uint64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)uint64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *uint64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    long long v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    uint64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  BSAppendVersionedPIDToStringAppendTarget(a3, self);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (void)appendFormat:(id)a3
{
  int64_t appendBufferCount = self->_appendBufferCount;
  if (appendBufferCount >= 1)
  {
    self->_appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  CFStringAppendFormatAndArguments((CFMutableStringRef)self->_string, 0, (CFStringRef)a3, &v6);
}

void __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (*(unsigned char *)(a1 + 64) && v5 >= *(void *)(a1 + 56) - 1)
  {
    *a4 = 1;
  }
  else
  {
    *(void *)(v4 + 24) = v5 + 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_4;
    v8[3] = &unk_1E5446788;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[5] = a3;
    v8[6] = v7;
    v8[4] = a2;
    BSDescribeAppendItem(v6, (uint64_t)v8);
  }
}

- (BOOL)hasSuccinctStyle
{
  return self->_forceSuccinct || self->_style->_verbosity == 2;
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4
{
  uint64_t v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%llu", (uint64_t)a4, v4, v5, v6, v7, a3);
  return v8;
}

+ (id)descriptionForRootObject:(id)a3 withStyle:(id)a4
{
  uint64_t v5 = [[BSDescriptionStream alloc] initWithDescriptionStyle:a4];
  id v6 = [(BSDescriptionStream *)v5 appendObject:a3 withName:0];
  uint64_t v7 = [(BSDescriptionStream *)v5 description];

  return v7;
}

- (BSDescriptionStream)initWithDescriptionStyle:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)BSDescriptionStream;
  uint64_t v5 = [(BSDescriptionStream *)&v28 init];
  if (v5)
  {
    id v6 = a3;
    if (!v6)
    {
      uint64_t v12 = NSString;
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = [v12 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"style", v14];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138544642;
        id v30 = v16;
        __int16 v31 = 2114;
        uint64_t v32 = v18;
        __int16 v33 = 2048;
        uint64_t v34 = v5;
        __int16 v35 = 2114;
        uint64_t v36 = @"BSDescriptionStream.m";
        __int16 v37 = 1024;
        int v38 = 97;
        __int16 v39 = 2114;
        uint64_t v40 = v15;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v15 UTF8String];
      __break(0);
      JUMPOUT(0x18AAEC248);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = NSString;
      size_t v20 = (objc_class *)[v6 classForCoder];
      if (!v20) {
        size_t v20 = (objc_class *)objc_opt_class();
      }
      int64_t v21 = NSStringFromClass(v20);
      char v22 = (objc_class *)objc_opt_class();
      long long v23 = NSStringFromClass(v22);
      long long v24 = [v19 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"style", v21, v23];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        int64_t v26 = (objc_class *)objc_opt_class();
        CFIndex v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138544642;
        id v30 = v25;
        __int16 v31 = 2114;
        uint64_t v32 = v27;
        __int16 v33 = 2048;
        uint64_t v34 = v5;
        __int16 v35 = 2114;
        uint64_t v36 = @"BSDescriptionStream.m";
        __int16 v37 = 1024;
        int v38 = 97;
        __int16 v39 = 2114;
        uint64_t v40 = v24;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v24 UTF8String];
      __break(0);
      JUMPOUT(0x18AAEC390);
    }

    uint64_t v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    string = v5->_string;
    v5->_string = v7;

    uint64_t v9 = [v6 copy];
    style = v5->_style;
    v5->_style = (BSDescriptionStyle *)v9;

    v5->_truncationStartIndex = -1;
  }
  return v5;
}

- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5
{
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%f", 0x7FFFFFFFFFFFFFFFLL, v5, v6, v7, v8, SLOBYTE(a3));
  }
  else
  {
    char v9 = -1;
    if (a5 < 0x7FFFFFFF) {
      char v9 = a5;
    }
    BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%.*f", a5, v5, v6, v7, v8, v9);
  id v10 = };
  return v10;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  if (a3 != a5) {
    goto LABEL_77;
  }
  BOOL v7 = a3;
  if (a3) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  char v9 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_15;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v15 = 2;
        goto LABEL_23;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v17 = "; ";
      goto LABEL_28;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v13 = self->_appendBufferCount;
      uint64_t v14 = self->_appendBuffer;
      if (v13 <= 1022)
      {
        v14[v13] = 32;
        uint64_t v15 = 1;
        goto LABEL_23;
      }
      v14[v13] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v14, 0x8000100u);
      p_string = &self->_string;
      uint64_t v17 = " ";
LABEL_28:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v17, 0x8000100u);
      break;
    case 3:
LABEL_15:
      int64_t v18 = self->_appendBufferCount;
      uint64_t v19 = self->_appendBuffer;
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_18;
    case 4:
LABEL_18:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      int64_t v21 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v22 = strlen(v21);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v23 = self->_appendBufferCount;
      if ((uint64_t)(v23 + v22) > 1023)
      {
        if (v23 >= 1)
        {
          self->_appendBuffer[v23] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v21, 0x8000100u);
      }
      else
      {
        uint64_t v15 = v22;
        memcpy(&self->_appendBuffer[v23], v21, v22);
LABEL_23:
        *p_appendBufferCount += v15;
      }
      break;
    default:
      goto LABEL_30;
  }
  self->_emitPhase = 0;
LABEL_30:
  if (!a4) {
    goto LABEL_62;
  }
  int64_t nameTruncation = v9->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v9->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v27 = [a4 length];
  int64_t v28 = self->_appendBufferCount;
  if (v28 + 3 * v27 > 1023)
  {
    if (v28 >= 1)
    {
      self->_appendBuffer[v28] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v27 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_45;
    }
    CFIndex usedBufLen = 0;
    v51.location = 0;
    v51.length = v27;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v29 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v50.location = 0;
    v50.length = v27;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v28], 1024 - v28, &usedBufLen);
    CFIndex v29 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v29;
LABEL_45:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    id v30 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    id v30 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v31 = *(unint64_t *)((char *)&self->_style->super.isa + *v30);
  if (v31 < 2)
  {
    int64_t v35 = self->_appendBufferCount;
    uint64_t v36 = self->_appendBuffer;
    if (v35 <= 1021)
    {
      *(_WORD *)&v36[v35] = 8250;
      uint64_t v34 = 2;
      goto LABEL_57;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    __int16 v39 = ": ";
LABEL_61:
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v39, 0x8000100u);
    goto LABEL_62;
  }
  if (v31 == 2)
  {
    int64_t v37 = self->_appendBufferCount;
    int v38 = &self->_appendBuffer[v37];
    if (v37 <= 1020)
    {
      v38[2] = 32;
      *(_WORD *)int v38 = 15648;
      uint64_t v34 = 3;
      goto LABEL_57;
    }
    unsigned __int8 *v38 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    __int16 v39 = " = ";
    goto LABEL_61;
  }
  if (v31 == 3)
  {
    int64_t v32 = self->_appendBufferCount;
    __int16 v33 = self->_appendBuffer;
    if (v32 <= 1019)
    {
      *(_DWORD *)&v33[v32] = 540945696;
      uint64_t v34 = 4;
LABEL_57:
      self->_appendBufferCount += v34;
      goto LABEL_62;
    }
    v33[v32] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v33, 0x8000100u);
    __int16 v39 = " -> ";
    goto LABEL_61;
  }
LABEL_62:
  int64_t valueTruncation = v9->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v9->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v43 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v43 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v43) = (Class)maximumValueLengthBeforeTruncation;

  if (v7) {
    size_t v44 = 3;
  }
  else {
    size_t v44 = 2;
  }
  int64_t v45 = self->_appendBufferCount;
  if ((uint64_t)(v45 + v44) > 1023)
  {
    if (v45 >= 1)
    {
      self->_appendBuffer[v45] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    CFStringAppendCString((CFMutableStringRef)self->_string, v8, 0x8000100u);
  }
  else
  {
    memcpy(&self->_appendBuffer[v45], v8, v44);
    self->_appendBufferCount += v44;
  }
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
LABEL_77:
  CFRange v46 = self;
  return self;
}

- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5
{
  if (fabs(a3) == INFINITY)
  {
    size_t v20 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_30;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          uint64_t v28 = 2;
          goto LABEL_38;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        __int16 v33 = "; ";
        goto LABEL_43;
      case 2:
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t v26 = self->_appendBufferCount;
        CFIndex v27 = self->_appendBuffer;
        if (v26 <= 1022)
        {
          v27[v26] = 32;
          uint64_t v28 = 1;
          goto LABEL_38;
        }
        v27[v26] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v27, 0x8000100u);
        p_string = &self->_string;
        __int16 v33 = " ";
LABEL_43:
        int64_t *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v33, 0x8000100u);
        break;
      case 3:
LABEL_30:
        int64_t v36 = self->_appendBufferCount;
        int64_t v37 = self->_appendBuffer;
        if (v36 > 1022)
        {
          v37[v36] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v37, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v37[v36] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_33;
      case 4:
LABEL_33:
        int64_t indentLevel = self->_indentLevel;
        if (indentLevel < 1) {
          break;
        }
        if (indentLevel >= 8) {
          int64_t indentLevel = 8;
        }
        __int16 v39 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
        size_t v40 = strlen(v39);
        p_int64_t appendBufferCount = &self->_appendBufferCount;
        int64_t v41 = self->_appendBufferCount;
        if ((uint64_t)(v41 + v40) > 1023)
        {
          if (v41 >= 1)
          {
            self->_appendBuffer[v41] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            int64_t *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v39, 0x8000100u);
        }
        else
        {
          uint64_t v28 = v40;
          memcpy(&self->_appendBuffer[v41], v39, v40);
LABEL_38:
          *p_appendBufferCount += v28;
        }
        break;
      default:
        goto LABEL_45;
    }
    self->_emitPhase = 0;
LABEL_45:
    if (!a4) {
      goto LABEL_77;
    }
    int64_t nameTruncation = v20->_nameTruncation;
    int64_t maximumNameLengthBeforeTruncation = v20->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    CFIndex v45 = [a4 length];
    int64_t v46 = self->_appendBufferCount;
    if (v46 + 3 * v45 > 1023)
    {
      if (v46 >= 1)
      {
        self->_appendBuffer[v46] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v45 > 341)
      {
        [(NSMutableString *)self->_string appendString:a4];
        goto LABEL_60;
      }
      CFIndex usedBufLen = 0;
      v100.location = 0;
      v100.length = v45;
      CFStringGetBytes((CFStringRef)a4, v100, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v47 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v99.location = 0;
      v99.length = v45;
      CFStringGetBytes((CFStringRef)a4, v99, 0x8000100u, 0, 0, &self->_appendBuffer[v46], 1024 - v46, &usedBufLen);
      CFIndex v47 = self->_appendBufferCount + usedBufLen;
    }
    self->_int64_t appendBufferCount = v47;
LABEL_60:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0) {
      uint64_t v48 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    }
    else {
      uint64_t v48 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    }
    unint64_t v49 = *(unint64_t *)((char *)&self->_style->super.isa + *v48);
    if (v49 < 2)
    {
      int64_t v53 = self->_appendBufferCount;
      CFRange v54 = self->_appendBuffer;
      if (v53 <= 1021)
      {
        *(_WORD *)&v54[v53] = 8250;
        uint64_t v52 = 2;
        goto LABEL_72;
      }
      v54[v53] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v54, 0x8000100u);
      CFRange v57 = ": ";
    }
    else if (v49 == 2)
    {
      int64_t v55 = self->_appendBufferCount;
      CFRange v56 = &self->_appendBuffer[v55];
      if (v55 <= 1020)
      {
        v56[2] = 32;
        *(_WORD *)CFRange v56 = 15648;
        uint64_t v52 = 3;
        goto LABEL_72;
      }
      *CFRange v56 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      CFRange v57 = " = ";
    }
    else
    {
      if (v49 != 3) {
        goto LABEL_77;
      }
      int64_t v50 = self->_appendBufferCount;
      CFRange v51 = self->_appendBuffer;
      if (v50 <= 1019)
      {
        *(_DWORD *)&v51[v50] = 540945696;
        uint64_t v52 = 4;
LABEL_72:
        self->_appendBufferCount += v52;
        goto LABEL_77;
      }
      v51[v50] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v51, 0x8000100u);
      CFRange v57 = " -> ";
    }
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v57, 0x8000100u);
LABEL_77:
    int64_t valueTruncation = v20->_valueTruncation;
    int64_t maximumValueLengthBeforeTruncation = v20->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      int64_t maximumValueLengthBeforeTruncation = 0;
      uint64_t v61 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v61 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v61) = (Class)maximumValueLengthBeforeTruncation;

    CFIndex v62 = [@"(inf)" length];
    int64_t v63 = self->_appendBufferCount;
    if (3 * v62 + v63 > 1023)
    {
      if (v63 >= 1)
      {
        self->_appendBuffer[v63] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v62 > 341)
      {
        [(NSMutableString *)self->_string appendString:@"(inf)"];
        goto LABEL_91;
      }
      CFIndex usedBufLen = 0;
      v102.location = 0;
      v102.length = v62;
      CFStringGetBytes(@"(inf)", v102, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v64 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v101.location = 0;
      v101.length = v62;
      CFStringGetBytes(@"(inf)", v101, 0x8000100u, 0, 0, &self->_appendBuffer[v63], 1024 - v63, &usedBufLen);
      CFIndex v64 = self->_appendBufferCount + usedBufLen;
    }
    self->_int64_t appendBufferCount = v64;
LABEL_91:
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
    goto LABEL_154;
  }
  double v12 = (a3 - (double)(uint64_t)a3) * 1000.0;
  if (!a5)
  {
    if (fabs(v12) >= 2.22044605e-16) {
      id appended = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%.2fs", a5, v5, v6, v7, v8, SLOBYTE(a3));
    }
    else {
      id appended = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%.1fs", a5, v5, v6, v7, v8, SLOBYTE(a3));
    }
    id v25 = appended;
    goto LABEL_154;
  }
  if (qword_1EB21B290 != -1) {
    dispatch_once(&qword_1EB21B290, &__block_literal_global_24);
  }
  int64_t v13 = [(id)_MergedGlobals_27 stringFromTimeInterval:a3];
  uint64_t v14 = v13;
  if (fabs(v12) >= 2.22044605e-16)
  {
    uint64_t v15 = [(__CFString *)v13 stringByAppendingFormat:@" %.0fms", *(void *)&v12];

    uint64_t v14 = (__CFString *)v15;
  }
  id v16 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      uint64_t v17 = &self->_appendBufferCount;
      int64_t v18 = self->_appendBufferCount;
      uint64_t v19 = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (v18 > 1022)
        {
          v19[v18] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          v19[v18] = 59;
          ++*v17;
        }
        goto LABEL_93;
      }
      if (v18 <= 1021)
      {
        *(_WORD *)&v19[v18] = 8251;
        uint64_t v31 = 2;
        goto LABEL_101;
      }
      v19[v18] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
      uint64_t v34 = &self->_string;
      int64_t v35 = "; ";
      goto LABEL_106;
    case 2:
      uint64_t v17 = &self->_appendBufferCount;
      int64_t v29 = self->_appendBufferCount;
      id v30 = self->_appendBuffer;
      if (v29 <= 1022)
      {
        v30[v29] = 32;
        uint64_t v31 = 1;
        goto LABEL_101;
      }
      v30[v29] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v30, 0x8000100u);
      uint64_t v34 = &self->_string;
      int64_t v35 = " ";
LABEL_106:
      *uint64_t v17 = 0;
      CFStringAppendCString((CFMutableStringRef)*v34, v35, 0x8000100u);
      break;
    case 3:
LABEL_93:
      int64_t v65 = self->_appendBufferCount;
      int64_t v66 = self->_appendBuffer;
      if (v65 > 1022)
      {
        v66[v65] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v66, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v66[v65] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_96;
    case 4:
LABEL_96:
      int64_t v67 = self->_indentLevel;
      if (v67 < 1) {
        break;
      }
      if (v67 >= 8) {
        int64_t v67 = 8;
      }
      int64_t v68 = (const char *)*((void *)&sIndentSpaceStrings + v67);
      size_t v69 = strlen(v68);
      uint64_t v17 = &self->_appendBufferCount;
      int64_t v70 = self->_appendBufferCount;
      if ((uint64_t)(v70 + v69) > 1023)
      {
        if (v70 >= 1)
        {
          self->_appendBuffer[v70] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *uint64_t v17 = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v68, 0x8000100u);
      }
      else
      {
        uint64_t v31 = v69;
        memcpy(&self->_appendBuffer[v70], v68, v69);
LABEL_101:
        *v17 += v31;
      }
      break;
    default:
      goto LABEL_108;
  }
  self->_emitPhase = 0;
LABEL_108:
  if (!a4) {
    goto LABEL_138;
  }
  int64_t v71 = v16->_nameTruncation;
  if (v71 < 2 || (int64_t v72 = v16->_maximumNameLengthBeforeTruncation, v72 < 1))
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = v71;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = v72;
  }
  CFIndex v73 = [a4 length];
  int64_t v74 = self->_appendBufferCount;
  if (v74 + 3 * v73 > 1023)
  {
    if (v74 >= 1)
    {
      self->_appendBuffer[v74] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v73 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_121;
    }
    CFIndex usedBufLen = 0;
    v104.location = 0;
    v104.length = v73;
    CFStringGetBytes((CFStringRef)a4, v104, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v75 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v103.location = 0;
    v103.length = v73;
    CFStringGetBytes((CFStringRef)a4, v103, 0x8000100u, 0, 0, &self->_appendBuffer[v74], 1024 - v74, &usedBufLen);
    CFIndex v75 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v75;
LABEL_121:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    int64_t v76 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    int64_t v76 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v77 = *(unint64_t *)((char *)&self->_style->super.isa + *v76);
  if (v77 < 2)
  {
    int64_t v81 = self->_appendBufferCount;
    v82 = self->_appendBuffer;
    if (v81 <= 1021)
    {
      *(_WORD *)&v82[v81] = 8250;
      uint64_t v80 = 2;
      goto LABEL_133;
    }
    v82[v81] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v82, 0x8000100u);
    CFRange v85 = ": ";
LABEL_137:
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v85, 0x8000100u);
    goto LABEL_138;
  }
  if (v77 == 2)
  {
    int64_t v83 = self->_appendBufferCount;
    CFRange v84 = &self->_appendBuffer[v83];
    if (v83 <= 1020)
    {
      v84[2] = 32;
      *(_WORD *)CFRange v84 = 15648;
      uint64_t v80 = 3;
      goto LABEL_133;
    }
    *CFRange v84 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    CFRange v85 = " = ";
    goto LABEL_137;
  }
  if (v77 == 3)
  {
    int64_t v78 = self->_appendBufferCount;
    uint64_t v79 = self->_appendBuffer;
    if (v78 <= 1019)
    {
      *(_DWORD *)&v79[v78] = 540945696;
      uint64_t v80 = 4;
LABEL_133:
      self->_appendBufferCount += v80;
      goto LABEL_138;
    }
    v79[v78] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v79, 0x8000100u);
    CFRange v85 = " -> ";
    goto LABEL_137;
  }
LABEL_138:
  CFRange v86 = 0;
  int64_t v87 = v16->_valueTruncation;
  uint64_t v88 = 1096;
  if (v87 >= 2)
  {
    uint64_t v89 = v16->_maximumValueLengthBeforeTruncation;
    if (v89 >= 1)
    {
      self->_lineTruncation = v87;
      self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v88 = 1088;
      CFRange v86 = (objc_class *)v89;
    }
  }
  *(Class *)((char *)&self->super.isa + v88) = v86;

  if (v14)
  {
    CFIndex v90 = [(__CFString *)v14 length];
    int64_t v91 = self->_appendBufferCount;
    if (v91 + 3 * v90 > 1023)
    {
      if (v91 >= 1)
      {
        self->_appendBuffer[v91] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v90 > 341)
      {
        [(NSMutableString *)self->_string appendString:v14];
        goto LABEL_153;
      }
      CFIndex usedBufLen = 0;
      v106.location = 0;
      v106.length = v90;
      CFStringGetBytes(v14, v106, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v92 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v105.location = 0;
      v105.length = v90;
      CFStringGetBytes(v14, v105, 0x8000100u, 0, 0, &self->_appendBuffer[v91], 1024 - v91, &usedBufLen);
      CFIndex v92 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    int64_t v93 = self->_appendBufferCount;
    v94 = &self->_appendBuffer[v93];
    if (v93 > 1018)
    {
      unsigned __int8 *v94 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_153;
    }
    v94[4] = 62;
    *(_DWORD *)v94 = 1818848828;
    CFIndex v92 = self->_appendBufferCount + 5;
  }
  self->_int64_t appendBufferCount = v92;
LABEL_153:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);

LABEL_154:
  v95 = self;
  return self;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4
{
  BOOL v5 = a3;
  if (a3) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  uint64_t v8 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_14;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v14 = 2;
        goto LABEL_22;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      id v16 = "; ";
      goto LABEL_27;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v12 = self->_appendBufferCount;
      int64_t v13 = self->_appendBuffer;
      if (v12 <= 1022)
      {
        v13[v12] = 32;
        uint64_t v14 = 1;
        goto LABEL_22;
      }
      v13[v12] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
      p_string = &self->_string;
      id v16 = " ";
LABEL_27:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
      break;
    case 3:
LABEL_14:
      int64_t v17 = self->_appendBufferCount;
      int64_t v18 = self->_appendBuffer;
      if (v17 > 1022)
      {
        v18[v17] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v18[v17] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_17;
    case 4:
LABEL_17:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v20 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v21 = strlen(v20);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v22 = self->_appendBufferCount;
      if ((uint64_t)(v22 + v21) > 1023)
      {
        if (v22 >= 1)
        {
          self->_appendBuffer[v22] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
      }
      else
      {
        uint64_t v14 = v21;
        memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_22:
        *p_appendBufferCount += v14;
      }
      break;
    default:
      goto LABEL_29;
  }
  self->_emitPhase = 0;
LABEL_29:
  if (!a4) {
    goto LABEL_61;
  }
  int64_t nameTruncation = v8->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v26 = [a4 length];
  int64_t v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_44;
    }
    CFIndex usedBufLen = 0;
    v49.location = 0;
    v49.length = v26;
    CFStringGetBytes((CFStringRef)a4, v49, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v28 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v48.location = 0;
    v48.length = v26;
    CFStringGetBytes((CFStringRef)a4, v48, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    CFIndex v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v28;
LABEL_44:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    int64_t v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    int64_t v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
  if (v30 < 2)
  {
    int64_t v34 = self->_appendBufferCount;
    int64_t v35 = self->_appendBuffer;
    if (v34 <= 1021)
    {
      *(_WORD *)&v35[v34] = 8250;
      uint64_t v33 = 2;
      goto LABEL_56;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    int v38 = ": ";
  }
  else if (v30 == 2)
  {
    int64_t v36 = self->_appendBufferCount;
    int64_t v37 = &self->_appendBuffer[v36];
    if (v36 <= 1020)
    {
      v37[2] = 32;
      *(_WORD *)int64_t v37 = 15648;
      uint64_t v33 = 3;
      goto LABEL_56;
    }
    unsigned __int8 *v37 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int v38 = " = ";
  }
  else
  {
    if (v30 != 3) {
      goto LABEL_61;
    }
    int64_t v31 = self->_appendBufferCount;
    int64_t v32 = self->_appendBuffer;
    if (v31 <= 1019)
    {
      *(_DWORD *)&v32[v31] = 540945696;
      uint64_t v33 = 4;
LABEL_56:
      self->_appendBufferCount += v33;
      goto LABEL_61;
    }
    v32[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
    int v38 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_61:
  int64_t valueTruncation = v8->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v42 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v42 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

  if (v5) {
    size_t v43 = 3;
  }
  else {
    size_t v43 = 2;
  }
  int64_t v44 = self->_appendBufferCount;
  if ((uint64_t)(v44 + v43) > 1023)
  {
    if (v44 >= 1)
    {
      self->_appendBuffer[v44] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    CFStringAppendCString((CFMutableStringRef)self->_string, v7, 0x8000100u);
  }
  else
  {
    memcpy(&self->_appendBuffer[v44], v7, v43);
    self->_appendBufferCount += v43;
  }
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendRect:(CGRect)a3 withName:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v16 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v18 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v14 = self->_appendBufferCount;
      uint64_t v15 = self->_appendBuffer;
      if (v14 <= 1022)
      {
        v15[v14] = 32;
        uint64_t v16 = 1;
        goto LABEL_19;
      }
      v15[v14] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v15, 0x8000100u);
      p_string = &self->_string;
      int64_t v18 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v18, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v19 = self->_appendBufferCount;
      size_t v20 = self->_appendBuffer;
      if (v19 > 1022)
      {
        v20[v19] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v20, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v20[v19] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      int64_t v22 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v23 = strlen(v22);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v24 = self->_appendBufferCount;
      if ((uint64_t)(v24 + v23) > 1023)
      {
        if (v24 >= 1)
        {
          self->_appendBuffer[v24] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v22, 0x8000100u);
      }
      else
      {
        uint64_t v16 = v23;
        memcpy(&self->_appendBuffer[v24], v22, v23);
LABEL_19:
        *p_appendBufferCount += v16;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v10->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v10->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v28 = [a4 length];
  int64_t v29 = self->_appendBufferCount;
  if (v29 + 3 * v28 > 1023)
  {
    if (v29 >= 1)
    {
      self->_appendBuffer[v29] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v28 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v54.location = 0;
    v54.length = v28;
    CFStringGetBytes((CFStringRef)a4, v54, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v30 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v53.location = 0;
    v53.length = v28;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, &self->_appendBuffer[v29], 1024 - v29, &usedBufLen);
    CFIndex v30 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v30;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    int64_t v31 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    int64_t v31 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v32 = *(unint64_t *)((char *)&self->_style->super.isa + *v31);
  if (v32 < 2)
  {
    int64_t v36 = self->_appendBufferCount;
    int64_t v37 = self->_appendBuffer;
    if (v36 <= 1021)
    {
      *(_WORD *)&v37[v36] = 8250;
      uint64_t v35 = 2;
      goto LABEL_53;
    }
    v37[v36] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v37, 0x8000100u);
    size_t v40 = ": ";
  }
  else if (v32 == 2)
  {
    int64_t v38 = self->_appendBufferCount;
    __int16 v39 = &self->_appendBuffer[v38];
    if (v38 <= 1020)
    {
      v39[2] = 32;
      *(_WORD *)__int16 v39 = 15648;
      uint64_t v35 = 3;
      goto LABEL_53;
    }
    unsigned __int8 *v39 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    size_t v40 = " = ";
  }
  else
  {
    if (v32 != 3) {
      goto LABEL_58;
    }
    int64_t v33 = self->_appendBufferCount;
    int64_t v34 = self->_appendBuffer;
    if (v33 <= 1019)
    {
      *(_DWORD *)&v34[v33] = 540945696;
      uint64_t v35 = 4;
LABEL_53:
      self->_appendBufferCount += v35;
      goto LABEL_58;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    size_t v40 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v40, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v10->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v10->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v44 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v44 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v44) = (Class)maximumValueLengthBeforeTruncation;

  int64_t v45 = self->_appendBufferCount;
  int64_t v46 = self->_appendBuffer;
  if (v45 > 1022)
  {
    v46[v45] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, "{", 0x8000100u);
    int64_t v47 = self->_appendBufferCount;
  }
  else
  {
    v46[v45] = 123;
    int64_t v47 = self->_appendBufferCount + 1;
    self->_int64_t appendBufferCount = v47;
  }
  if (v47 >= 1)
  {
    v46[v47] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  [(NSMutableString *)self->_string appendFormat:@"{%.*g, %.*g}", 17, *(void *)&x, 17, *(void *)&y];
  int64_t v48 = self->_appendBufferCount;
  if (v48 > 1021)
  {
    v46[v48] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, ", ", 0x8000100u);
    int64_t v49 = self->_appendBufferCount;
  }
  else
  {
    *(_WORD *)&v46[v48] = 8236;
    int64_t v49 = self->_appendBufferCount + 2;
    self->_int64_t appendBufferCount = v49;
  }
  if (v49 >= 1)
  {
    v46[v49] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  [(NSMutableString *)self->_string appendFormat:@"{%.*g, %.*g}", 17, *(void *)&width, 17, *(void *)&height];
  int64_t v50 = self->_appendBufferCount;
  if (v50 > 1022)
  {
    v46[v50] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, "}", 0x8000100u);
  }
  else
  {
    v46[v50] = 125;
    ++self->_appendBufferCount;
  }
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (void)setSortKeys:(BOOL)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__BSDescriptionStream_setSortKeys___block_invoke;
  v7[3] = &__block_descriptor_33_e35_v16__0__BSMutableDescriptionStyle_8l;
  BOOL v8 = a3;
  uint64_t v4 = +[BSDescriptionStyle build:v7];
  -[BSDescriptionStyle _styleByOverlayingStyle:](&self->_style->super.isa, (uint64_t)v4);
  BOOL v5 = (BSDescriptionStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  self->_style = v5;
}

uint64_t __35__BSDescriptionStream_setSortKeys___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setKeyValuePairSorting:v2];
}

- (BOOL)sortKeys
{
  if (self) {
    LOBYTE(self) = self->_style->_keyValuePairSorting == 2;
  }
  return (char)self;
}

- (void)sameLine:(id)a3
{
  id v5 = +[BSDescriptionStyle collectionLineBreakNoneStyle];
  -[BSDescriptionStream _overlayStyle:block:]((uint64_t)self, (uint64_t)v5, (uint64_t)a3);
}

- (void)appendBodySectionWithOpenDelimiter:(id)a3 closeDelimiter:(id)a4 block:(id)a5
{
}

CFIndex __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFIndex v2 = [@"…" length];
  uint64_t v3 = *(void *)(v1 + 1040);
  if (3 * v2 + v3 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v9.location = 0;
    v9.length = v2;
    CFIndex result = CFStringGetBytes(@"…", v9, 0x8000100u, 0, 0, (UInt8 *)(v1 + v3 + 16), 1024 - v3, &usedBufLen);
    CFIndex v5 = *(void *)(v1 + 1040) + usedBufLen;
LABEL_7:
    *(void *)(v1 + 1040) = v5;
    return result;
  }
  if (v3 >= 1)
  {
    *(unsigned char *)(v1 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v1 + 1064), (const char *)(v1 + 16), 0x8000100u);
    *(void *)(v1 + 1040) = 0;
  }
  if (v2 <= 341)
  {
    CFIndex usedBufLen = 0;
    v10.location = 0;
    v10.length = v2;
    CFIndex result = CFStringGetBytes(@"…", v10, 0x8000100u, 0, 0, (UInt8 *)(v1 + 16), 1024, &usedBufLen);
    CFIndex v5 = usedBufLen;
    goto LABEL_7;
  }
  uint64_t v6 = *(void **)(v1 + 1064);
  return [v6 appendString:@"…"];
}

- (void)appendDictionary:(id)a3 withName:(id)a4 itemBlock:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__BSDescriptionStream_appendDictionary_withName_itemBlock___block_invoke;
  v5[3] = &unk_1E5446620;
  v5[4] = a5;
  -[BSDescriptionStream _appendDictionary:withName:itemBlock:]((uint64_t)self, a3, (__CFString *)a4, (uint64_t)v5);
}

uint64_t __59__BSDescriptionStream_appendDictionary_withName_itemBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) objectForKey:v1];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

CFIndex __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFIndex v2 = [@"…" length];
  uint64_t v3 = *(void *)(v1 + 1040);
  if (3 * v2 + v3 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v9.location = 0;
    v9.length = v2;
    CFIndex result = CFStringGetBytes(@"…", v9, 0x8000100u, 0, 0, (UInt8 *)(v1 + v3 + 16), 1024 - v3, &usedBufLen);
    CFIndex v5 = *(void *)(v1 + 1040) + usedBufLen;
LABEL_7:
    *(void *)(v1 + 1040) = v5;
    return result;
  }
  if (v3 >= 1)
  {
    *(unsigned char *)(v1 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v1 + 1064), (const char *)(v1 + 16), 0x8000100u);
    *(void *)(v1 + 1040) = 0;
  }
  if (v2 <= 341)
  {
    CFIndex usedBufLen = 0;
    v10.location = 0;
    v10.length = v2;
    CFIndex result = CFStringGetBytes(@"…", v10, 0x8000100u, 0, 0, (UInt8 *)(v1 + 16), 1024, &usedBufLen);
    CFIndex v5 = usedBufLen;
    goto LABEL_7;
  }
  uint64_t v6 = *(void **)(v1 + 1064);
  return [v6 appendString:@"…"];
}

- (void)appendIntegerSet:(id)a3 withName:(id)a4 format:(int64_t)a5
{
  if (!a4) {
    goto LABEL_62;
  }
  CFRange v9 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v15 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v17 = "; ";
      goto LABEL_25;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v13 = self->_appendBufferCount;
      int64_t v14 = self->_appendBuffer;
      if (v13 <= 1022)
      {
        v14[v13] = 32;
        uint64_t v15 = 1;
        goto LABEL_20;
      }
      v14[v13] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v14, 0x8000100u);
      p_string = &self->_string;
      int64_t v17 = " ";
LABEL_25:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v17, 0x8000100u);
      break;
    case 3:
LABEL_12:
      int64_t v18 = self->_appendBufferCount;
      int64_t v19 = self->_appendBuffer;
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v21 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v22 = strlen(v21);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v23 = self->_appendBufferCount;
      if ((uint64_t)(v23 + v22) > 1023)
      {
        if (v23 >= 1)
        {
          self->_appendBuffer[v23] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v21, 0x8000100u);
      }
      else
      {
        uint64_t v15 = v22;
        memcpy(&self->_appendBuffer[v23], v21, v22);
LABEL_20:
        *p_appendBufferCount += v15;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  int64_t nameTruncation = v9->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v9->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    int64_t maximumNameLengthBeforeTruncation = 0;
    uint64_t v27 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v27 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v27) = (Class)maximumNameLengthBeforeTruncation;
  CFIndex v28 = [a4 length];
  int64_t v29 = self->_appendBufferCount;
  if (v29 + 3 * v28 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v48.location = 0;
    v48.length = v28;
    CFStringGetBytes((CFStringRef)a4, v48, 0x8000100u, 0, 0, &self->_appendBuffer[v29], 1024 - v29, &usedBufLen);
    CFIndex v30 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_int64_t appendBufferCount = v30;
    goto LABEL_41;
  }
  if (v29 >= 1)
  {
    self->_appendBuffer[v29] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  if (v28 <= 341)
  {
    CFIndex usedBufLen = 0;
    v49.location = 0;
    v49.length = v28;
    CFStringGetBytes((CFStringRef)a4, v49, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v30 = usedBufLen;
    goto LABEL_39;
  }
  [(NSMutableString *)self->_string appendString:a4];
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    int64_t v31 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    int64_t v31 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v32 = *(unint64_t *)((char *)&self->_style->super.isa + *v31);
  if (v32 < 2)
  {
    int64_t v36 = self->_appendBufferCount;
    int64_t v37 = self->_appendBuffer;
    if (v36 <= 1021)
    {
      *(_WORD *)&v37[v36] = 8250;
      uint64_t v35 = 2;
      goto LABEL_53;
    }
    v37[v36] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v37, 0x8000100u);
    size_t v40 = ": ";
  }
  else if (v32 == 2)
  {
    int64_t v38 = self->_appendBufferCount;
    __int16 v39 = &self->_appendBuffer[v38];
    if (v38 <= 1020)
    {
      v39[2] = 32;
      *(_WORD *)__int16 v39 = 15648;
      uint64_t v35 = 3;
      goto LABEL_53;
    }
    unsigned __int8 *v39 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    size_t v40 = " = ";
  }
  else
  {
    if (v32 != 3) {
      goto LABEL_58;
    }
    int64_t v33 = self->_appendBufferCount;
    int64_t v34 = self->_appendBuffer;
    if (v33 <= 1019)
    {
      *(_DWORD *)&v34[v33] = 540945696;
      uint64_t v35 = 4;
LABEL_53:
      self->_appendBufferCount += v35;
      goto LABEL_58;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    size_t v40 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v40, 0x8000100u);
LABEL_58:
  int64_t v41 = 0;
  int64_t valueTruncation = v9->_valueTruncation;
  uint64_t v43 = 1096;
  if (valueTruncation >= 2)
  {
    uint64_t maximumValueLengthBeforeTruncation = v9->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v43 = 1088;
      int64_t v41 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v43) = v41;

LABEL_62:
  uint64_t v45 = [a3 count];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke;
  v46[3] = &unk_1E5446288;
  v46[5] = a3;
  v46[6] = a5;
  v46[4] = self;
  if (self) {
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:]((uint64_t)self, v45, v45, @"("), CFSTR(")", (uint64_t)v46);
  }
  if (a4)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

void __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_2;
  v5[3] = &unk_1E54466C0;
  uint64_t v2 = *(void *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = v2;
  uint64_t v3 = (void *)MEMORY[0x18C125630](v5);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(void *)(*(void *)(v4 + 8) + 88) == 2) {
    [*(id *)(a1 + 40) enumerateSortedWithBlock:v3];
  }
  else {
    [*(id *)(a1 + 40) enumerateWithBlock:v3];
  }
}

void __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_3;
  v3[3] = &unk_1E5446698;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = v2;
  uint64_t v6 = a2;
  BSDescribeAppendItem(v4, (uint64_t)v3);
}

uint64_t __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 1040);
  if (v3 >= 1)
  {
    *(unsigned char *)(v2 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
    *(void *)(v2 + 1040) = 0;
    uint64_t v2 = a1[4];
  }
  if (a1[5] == 1) {
    uint64_t v4 = @"%tX";
  }
  else {
    uint64_t v4 = @"%td";
  }
  return objc_msgSend(*(id *)(v2 + 1064), "appendFormat:", v4, a1[6]);
}

- (void)appendIntegerMap:(id)a3 withName:(id)a4 keyFormat:(int64_t)a5 valueBlock:(id)a6
{
  if (!a4) {
    goto LABEL_62;
  }
  int64_t v11 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v17 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v19 = "; ";
      goto LABEL_25;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v15 = self->_appendBufferCount;
      uint64_t v16 = self->_appendBuffer;
      if (v15 <= 1022)
      {
        v16[v15] = 32;
        uint64_t v17 = 1;
        goto LABEL_20;
      }
      v16[v15] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v16, 0x8000100u);
      p_string = &self->_string;
      int64_t v19 = " ";
LABEL_25:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v19, 0x8000100u);
      break;
    case 3:
LABEL_12:
      int64_t v20 = self->_appendBufferCount;
      size_t v21 = self->_appendBuffer;
      if (v20 > 1022)
      {
        v21[v20] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v21, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v21[v20] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      int64_t v23 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v24 = strlen(v23);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v25 = self->_appendBufferCount;
      if ((uint64_t)(v25 + v24) > 1023)
      {
        if (v25 >= 1)
        {
          self->_appendBuffer[v25] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v23, 0x8000100u);
      }
      else
      {
        uint64_t v17 = v24;
        memcpy(&self->_appendBuffer[v25], v23, v24);
LABEL_20:
        *p_appendBufferCount += v17;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  int64_t nameTruncation = v11->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v11->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    int64_t maximumNameLengthBeforeTruncation = 0;
    uint64_t v29 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v29 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v29) = (Class)maximumNameLengthBeforeTruncation;
  CFIndex v30 = [a4 length];
  int64_t v31 = self->_appendBufferCount;
  if (v31 + 3 * v30 <= 1023)
  {
    CFIndex usedBufLen = 0;
    v50.location = 0;
    v50.length = v30;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v31], 1024 - v31, &usedBufLen);
    CFIndex v32 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_int64_t appendBufferCount = v32;
    goto LABEL_41;
  }
  if (v31 >= 1)
  {
    self->_appendBuffer[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  if (v30 <= 341)
  {
    CFIndex usedBufLen = 0;
    v51.location = 0;
    v51.length = v30;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v32 = usedBufLen;
    goto LABEL_39;
  }
  [(NSMutableString *)self->_string appendString:a4];
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    int64_t v33 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    int64_t v33 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v34 = *(unint64_t *)((char *)&self->_style->super.isa + *v33);
  if (v34 < 2)
  {
    int64_t v38 = self->_appendBufferCount;
    __int16 v39 = self->_appendBuffer;
    if (v38 <= 1021)
    {
      *(_WORD *)&v39[v38] = 8250;
      uint64_t v37 = 2;
      goto LABEL_53;
    }
    v39[v38] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v39, 0x8000100u);
    uint64_t v42 = ": ";
  }
  else if (v34 == 2)
  {
    int64_t v40 = self->_appendBufferCount;
    int64_t v41 = &self->_appendBuffer[v40];
    if (v40 <= 1020)
    {
      v41[2] = 32;
      *(_WORD *)int64_t v41 = 15648;
      uint64_t v37 = 3;
      goto LABEL_53;
    }
    *int64_t v41 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v42 = " = ";
  }
  else
  {
    if (v34 != 3) {
      goto LABEL_58;
    }
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = self->_appendBuffer;
    if (v35 <= 1019)
    {
      *(_DWORD *)&v36[v35] = 540945696;
      uint64_t v37 = 4;
LABEL_53:
      self->_appendBufferCount += v37;
      goto LABEL_58;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    uint64_t v42 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v42, 0x8000100u);
LABEL_58:
  uint64_t v43 = 0;
  int64_t valueTruncation = v11->_valueTruncation;
  uint64_t v45 = 1096;
  if (valueTruncation >= 2)
  {
    uint64_t maximumValueLengthBeforeTruncation = v11->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
      uint64_t v45 = 1088;
      uint64_t v43 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v45) = v43;

LABEL_62:
  uint64_t v47 = [a3 count];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke;
  v48[3] = &unk_1E5446760;
  v48[6] = a6;
  v48[7] = a5;
  v48[4] = self;
  v48[5] = a3;
  if (self) {
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:]((uint64_t)self, v47, v47, @"{", @"}", (uint64_t)v48);
  }
  if (a4)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

void __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_2;
  v9[3] = &unk_1E5446710;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v9[5] = *(void *)(a1 + 48);
  v9[6] = v3;
  v9[4] = v2;
  uint64_t v4 = (void *)MEMORY[0x18C125630](v9);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(void *)(*(void *)(v5 + 8) + 88) == 2)
  {
    uint64_t v6 = [*(id *)(a1 + 40) allKeys];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_4;
    v7[3] = &unk_1E5446738;
    void v7[4] = *(void *)(a1 + 40);
    id v8 = v4;
    [v6 enumerateSortedWithBlock:v7];
  }
  else
  {
    [*(id *)(a1 + 40) enumerateWithBlock:v4];
  }
}

void __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_3;
  v5[3] = &unk_1E54466E8;
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  void v5[7] = a1[6];
  v5[8] = a2;
  void v5[5] = a3;
  void v5[6] = v4;
  v5[4] = v3;
  BSDescribeAppendItem(v3, (uint64_t)v5);
}

uint64_t __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 1040);
  if (v3 >= 1)
  {
    *(unsigned char *)(v2 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
    *(void *)(v2 + 1040) = 0;
    uint64_t v2 = a1[4];
  }
  if (a1[7] == 1) {
    uint64_t v4 = @"%tX: ";
  }
  else {
    uint64_t v4 = @"%td: ";
  }
  objc_msgSend(*(id *)(v2 + 1064), "appendFormat:", v4, a1[8]);
  uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);
  return v5();
}

void __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)appendCustomFormatForValue:(id)a3 withCustomFormatForName:(id)a4
{
  BOOL forceSuccinct = self->_forceSuccinct;
  self->_BOOL forceSuccinct = 1;
  switch(self->_emitPhase)
  {
    case 1:
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++self->_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        int64_t v12 = self->_appendBufferCount + 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      string = self->_string;
      int64_t v14 = "; ";
      goto LABEL_24;
    case 2:
      int64_t v10 = self->_appendBufferCount;
      int64_t v11 = self->_appendBuffer;
      if (v10 <= 1022)
      {
        v11[v10] = 32;
        int64_t v12 = self->_appendBufferCount + 1;
        goto LABEL_19;
      }
      v11[v10] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v11, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      string = self->_string;
      int64_t v14 = " ";
      goto LABEL_24;
    case 3:
LABEL_11:
      int64_t v15 = self->_appendBufferCount;
      uint64_t v16 = self->_appendBuffer;
      if (v15 > 1022)
      {
        v16[v15] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v16, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v16[v15] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        goto LABEL_25;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      int64_t v18 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v19 = strlen(v18);
      int64_t v20 = self->_appendBufferCount;
      if ((uint64_t)(v20 + v19) > 1023)
      {
        if (v20 >= 1)
        {
          self->_appendBuffer[v20] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
        }
        string = self->_string;
        int64_t v14 = v18;
LABEL_24:
        CFStringAppendCString((CFMutableStringRef)string, v14, 0x8000100u);
      }
      else
      {
        size_t v21 = v19;
        memcpy(&self->_appendBuffer[v20], v18, v19);
        int64_t v12 = self->_appendBufferCount + v21;
LABEL_19:
        self->_int64_t appendBufferCount = v12;
      }
LABEL_25:
      self->_emitPhase = 0;
LABEL_26:
      (*((void (**)(id, BSDescriptionStream *))a4 + 2))(a4, self);
      if (self->_proemNestCount <= 0) {
        size_t v22 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
      }
      else {
        size_t v22 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
      }
      unint64_t v23 = *(unint64_t *)((char *)&self->_style->super.isa + *v22);
      if (v23 < 2)
      {
        int64_t v27 = self->_appendBufferCount;
        CFIndex v28 = self->_appendBuffer;
        if (v27 <= 1021)
        {
          *(_WORD *)&v28[v27] = 8250;
          int64_t v26 = self->_appendBufferCount + 2;
          goto LABEL_38;
        }
        v28[v27] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v28, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        int64_t v31 = self->_string;
        CFIndex v32 = ": ";
      }
      else if (v23 == 2)
      {
        int64_t v29 = self->_appendBufferCount;
        CFIndex v30 = &self->_appendBuffer[v29];
        if (v29 <= 1020)
        {
          v30[2] = 32;
          *(_WORD *)CFIndex v30 = 15648;
          int64_t v26 = self->_appendBufferCount + 3;
          goto LABEL_38;
        }
        *CFIndex v30 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        int64_t v31 = self->_string;
        CFIndex v32 = " = ";
      }
      else
      {
        if (v23 != 3) {
          goto LABEL_43;
        }
        int64_t v24 = self->_appendBufferCount;
        int64_t v25 = self->_appendBuffer;
        if (v24 <= 1019)
        {
          *(_DWORD *)&v25[v24] = 540945696;
          int64_t v26 = self->_appendBufferCount + 4;
LABEL_38:
          self->_int64_t appendBufferCount = v26;
          goto LABEL_43;
        }
        v25[v24] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v25, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        int64_t v31 = self->_string;
        CFIndex v32 = " -> ";
      }
      CFStringAppendCString((CFMutableStringRef)v31, v32, 0x8000100u);
LABEL_43:
      self->_BOOL forceSuccinct = forceSuccinct;
      (*((void (**)(id, BSDescriptionStream *))a3 + 2))(a3, self);
      self->_emitPhase = 1;
      BSDescribeTruncationCommit((uint64_t)self);
      return;
    default:
      goto LABEL_26;
  }
}

- (void)appendCustomFormatWithNameFromObjectDescription:(id)a3 block:(id)a4
{
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      int64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      int64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      uint64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a3) {
    goto LABEL_123;
  }
  BOOL forceSuccinct = self->_forceSuccinct;
  self->_BOOL forceSuccinct = 1;
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  if (!_NSIsNSString())
  {
    if (_NSIsNSNumber())
    {
      id v29 = a3;
      int v30 = *(char *)[v29 objCType];
      if (v30 > 80)
      {
        switch(v30)
        {
          case 'c':
            goto LABEL_65;
          case 'd':
            int64_t v31 = self->_appendBufferCount;
            if (v31 >= 1)
            {
              self->_appendBuffer[v31] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            string = self->_string;
            [v29 doubleValue];
            unint64_t v34 = @"%0.16g";
            goto LABEL_87;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_79;
          case 'f':
            int64_t v44 = self->_appendBufferCount;
            if (v44 >= 1)
            {
              self->_appendBuffer[v44] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            string = self->_string;
            [v29 floatValue];
            double v33 = v45;
            unint64_t v34 = @"%0.7g";
LABEL_87:
            -[NSMutableString appendFormat:](string, "appendFormat:", v34, *(void *)&v33);
            goto LABEL_105;
          case 'i':
            int64_t v46 = self->_appendBufferCount;
            if (v46 >= 1)
            {
              self->_appendBuffer[v46] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            int64_t v36 = self->_string;
            uint64_t v37 = [v29 intValue];
            goto LABEL_91;
          case 'l':
            int64_t v47 = self->_appendBufferCount;
            if (v47 >= 1)
            {
              self->_appendBuffer[v47] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            int64_t v36 = self->_string;
            uint64_t v37 = [v29 longValue];
            __int16 v39 = @"%ld";
            goto LABEL_104;
          case 'q':
            int64_t v48 = self->_appendBufferCount;
            if (v48 >= 1)
            {
              self->_appendBuffer[v48] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            int64_t v36 = self->_string;
            uint64_t v37 = [v29 longLongValue];
            __int16 v39 = @"%lld";
            goto LABEL_104;
          case 's':
            int64_t v49 = self->_appendBufferCount;
            if (v49 >= 1)
            {
              self->_appendBuffer[v49] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_int64_t appendBufferCount = 0;
            }
            int64_t v36 = self->_string;
            uint64_t v37 = [v29 shortValue];
            __int16 v39 = @"%hi";
            goto LABEL_104;
          default:
            if (v30 == 81)
            {
              int64_t v50 = self->_appendBufferCount;
              if (v50 >= 1)
              {
                self->_appendBuffer[v50] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_int64_t appendBufferCount = 0;
              }
              int64_t v36 = self->_string;
              uint64_t v37 = [v29 unsignedLongLongValue];
              __int16 v39 = @"%llu";
            }
            else
            {
              if (v30 != 83) {
                goto LABEL_79;
              }
              int64_t v41 = self->_appendBufferCount;
              if (v41 >= 1)
              {
                self->_appendBuffer[v41] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_int64_t appendBufferCount = 0;
              }
              int64_t v36 = self->_string;
              uint64_t v37 = [v29 unsignedShortValue];
              __int16 v39 = @"%hu";
            }
            break;
        }
        goto LABEL_104;
      }
      if (v30 > 72)
      {
        if (v30 == 73)
        {
          int64_t v42 = self->_appendBufferCount;
          if (v42 >= 1)
          {
            self->_appendBuffer[v42] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          int64_t v36 = self->_string;
          uint64_t v37 = [v29 unsignedIntValue];
          goto LABEL_78;
        }
        if (v30 == 76)
        {
          int64_t v38 = self->_appendBufferCount;
          if (v38 >= 1)
          {
            self->_appendBuffer[v38] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          int64_t v36 = self->_string;
          uint64_t v37 = [v29 unsignedLongValue];
          __int16 v39 = @"%lu";
          goto LABEL_104;
        }
      }
      else
      {
        if (v30 == 66)
        {
LABEL_65:
          int64_t v40 = self->_appendBufferCount;
          if (v40 >= 1)
          {
            self->_appendBuffer[v40] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          int64_t v36 = self->_string;
          uint64_t v37 = [v29 charValue];
LABEL_91:
          __int16 v39 = @"%d";
          goto LABEL_104;
        }
        if (v30 == 67)
        {
          int64_t v35 = self->_appendBufferCount;
          if (v35 >= 1)
          {
            self->_appendBuffer[v35] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_int64_t appendBufferCount = 0;
          }
          int64_t v36 = self->_string;
          uint64_t v37 = [v29 unsignedCharValue];
LABEL_78:
          __int16 v39 = @"%u";
LABEL_104:
          -[NSMutableString appendFormat:](v36, "appendFormat:", v39, v37);
LABEL_105:

          goto LABEL_106;
        }
      }
LABEL_79:
      int64_t v43 = self->_appendBufferCount;
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      -[NSMutableString appendFormat:](self->_string, "appendFormat:", @"<***unknown type:%s>", [v29 objCType]);
      goto LABEL_105;
    }
    if (objc_opt_respondsToSelector())
    {
      [a3 appendDescriptionToStream:self];
      goto LABEL_106;
    }
    if (objc_opt_respondsToSelector())
    {
      [a3 appendDescriptionToFormatter:self];
      goto LABEL_106;
    }
    if (_NSIsNSDictionary())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      CFIndex v75 = __BSDescribeAppendObjectDescription_block_invoke;
      int64_t v76 = &unk_1E5446820;
      unint64_t v77 = self;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:]((uint64_t)self, a3, 0, (uint64_t)&usedBufLen);
      goto LABEL_106;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BSDescriptionStream *)self appendIntegerSet:a3 withName:0 format:0];
      goto LABEL_106;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      CFIndex v75 = __BSDescribeAppendObjectDescription_block_invoke_2;
      int64_t v76 = &unk_1E5446848;
      unint64_t v77 = self;
      [(BSDescriptionStream *)self appendIntegerMap:a3 withName:0 keyFormat:0 valueBlock:&usedBufLen];
      goto LABEL_106;
    }
    if (objc_opt_respondsToSelector())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      CFIndex v75 = __BSDescribeAppendObjectDescription_block_invoke_3;
      int64_t v76 = &unk_1E5446848;
      unint64_t v77 = self;
      [(BSDescriptionStream *)self appendCollection:a3 withName:0 itemBlock:&usedBufLen];
      goto LABEL_106;
    }
    if (self->_forceSuccinct || (style = self->_style, style->_verbosity == 2))
    {
      if (objc_opt_respondsToSelector())
      {
        int64_t v68 = [a3 succinctDescription];
        goto LABEL_141;
      }
      style = self->_style;
    }
    if (style->_debugging == 2) {
      [a3 debugDescription];
    }
    else {
    int64_t v68 = [a3 description];
    }
LABEL_141:
    size_t v69 = v68;
    CFIndex v70 = [(__CFString *)v68 length];
    int64_t v71 = self->_appendBufferCount;
    if (v71 + 3 * v70 > 1023)
    {
      if (v71 >= 1)
      {
        self->_appendBuffer[v71] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v70 > 341)
      {
        [(NSMutableString *)self->_string appendString:v69];
        goto LABEL_149;
      }
      CFIndex usedBufLen = 0;
      v81.location = 0;
      v81.length = v70;
      CFStringGetBytes(v69, v81, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v72 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v80.location = 0;
      v80.length = v70;
      CFStringGetBytes(v69, v80, 0x8000100u, 0, 0, &self->_appendBuffer[v71], 1024 - v71, &usedBufLen);
      CFIndex v72 = self->_appendBufferCount + usedBufLen;
    }
    self->_int64_t appendBufferCount = v72;
LABEL_149:

    goto LABEL_106;
  }
  CFIndex v26 = [a3 length];
  int64_t v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      [(NSMutableString *)self->_string appendString:a3];
      goto LABEL_106;
    }
    CFIndex usedBufLen = 0;
    v79.location = 0;
    v79.length = v26;
    CFStringGetBytes((CFStringRef)a3, v79, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v28 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v78.location = 0;
    v78.length = v26;
    CFStringGetBytes((CFStringRef)a3, v78, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    CFIndex v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v28;
LABEL_106:
  BSDescribeTruncationCommit((uint64_t)self);
  self->_BOOL forceSuccinct = forceSuccinct;
  if (self->_proemNestCount <= 0) {
    CFRange v51 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFRange v51 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v52 = *(unint64_t *)((char *)&self->_style->super.isa + *v51);
  if (v52 < 2)
  {
    CFRange v53 = &self->_appendBufferCount;
    int64_t v57 = self->_appendBufferCount;
    CFRange v58 = self->_appendBuffer;
    if (v57 <= 1021)
    {
      *(_WORD *)&v58[v57] = 8250;
      uint64_t v56 = 2;
      goto LABEL_118;
    }
    v58[v57] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v58, 0x8000100u);
    uint64_t v61 = &self->_string;
    CFIndex v62 = ": ";
  }
  else if (v52 == 2)
  {
    CFRange v53 = &self->_appendBufferCount;
    int64_t v59 = self->_appendBufferCount;
    int64_t v60 = &self->_appendBuffer[v59];
    if (v59 <= 1020)
    {
      v60[2] = 32;
      *(_WORD *)int64_t v60 = 15648;
      uint64_t v56 = 3;
      goto LABEL_118;
    }
    *int64_t v60 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v61 = &self->_string;
    CFIndex v62 = " = ";
  }
  else
  {
    if (v52 != 3) {
      goto LABEL_123;
    }
    CFRange v53 = &self->_appendBufferCount;
    int64_t v54 = self->_appendBufferCount;
    int64_t v55 = self->_appendBuffer;
    if (v54 <= 1019)
    {
      *(_DWORD *)&v55[v54] = 540945696;
      uint64_t v56 = 4;
LABEL_118:
      *v53 += v56;
      goto LABEL_123;
    }
    v55[v54] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v55, 0x8000100u);
    uint64_t v61 = &self->_string;
    CFIndex v62 = " -> ";
  }
  int64_t *v53 = 0;
  CFStringAppendCString((CFMutableStringRef)*v61, v62, 0x8000100u);
LABEL_123:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v66 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v66 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v66) = (Class)maximumValueLengthBeforeTruncation;

  (*((void (**)(id, BSDescriptionStream *))a4 + 2))(a4, self);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
}

- (void)appendString:(id)a3
{
  CFIndex v5 = [a3 length];
  int64_t appendBufferCount = self->_appendBufferCount;
  if (3 * v5 + appendBufferCount <= 1023)
  {
    CFIndex usedBufLen = 0;
    v11.location = 0;
    v11.length = v5;
    CFStringGetBytes((CFStringRef)a3, v11, 0x8000100u, 0, 0, &self->_appendBuffer[appendBufferCount], 1024 - appendBufferCount, &usedBufLen);
    CFIndex v7 = self->_appendBufferCount + usedBufLen;
LABEL_7:
    self->_int64_t appendBufferCount = v7;
    return;
  }
  if (appendBufferCount >= 1)
  {
    self->_appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  if (v5 <= 341)
  {
    CFIndex usedBufLen = 0;
    v12.location = 0;
    v12.length = v5;
    CFStringGetBytes((CFStringRef)a3, v12, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v7 = usedBufLen;
    goto LABEL_7;
  }
  string = self->_string;
  [(NSMutableString *)string appendString:a3];
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4
{
  BSSettingFlagDescription(a3);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFIndex v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      CFRange v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      int64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      uint64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a4 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v51.location = 0;
    v51.length = v25;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v50.location = 0;
    v50.length = v25;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    unint64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    uint64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)int64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *int64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    uint64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    int64_t v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    uint64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (v6)
  {
    CFIndex v42 = [(__CFString *)v6 length];
    int64_t v43 = self->_appendBufferCount;
    if (v43 + 3 * v42 > 1023)
    {
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v42 > 341)
      {
        [(NSMutableString *)self->_string appendString:v6];
        goto LABEL_76;
      }
      CFIndex usedBufLen = 0;
      v53.location = 0;
      v53.length = v42;
      CFStringGetBytes(v6, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v44 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v52.location = 0;
      v52.length = v42;
      CFStringGetBytes(v6, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v43], 1024 - v43, &usedBufLen);
      CFIndex v44 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    int64_t v45 = self->_appendBufferCount;
    int64_t v46 = &self->_appendBuffer[v45];
    if (v45 > 1018)
    {
      *int64_t v46 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_76;
    }
    v46[4] = 62;
    *(_DWORD *)int64_t v46 = 1818848828;
    CFIndex v44 = self->_appendBufferCount + 5;
  }
  self->_int64_t appendBufferCount = v44;
LABEL_76:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  int64_t v47 = self;

  return v47;
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4 skipIfNotSet:(BOOL)a5
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL && a5)
  {
    CFIndex v7 = self;
    goto LABEL_80;
  }
  BSSettingFlagDescription(a3);
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFRange v9 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_14;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v15 = 2;
        goto LABEL_22;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v17 = "; ";
      goto LABEL_27;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v13 = self->_appendBufferCount;
      int64_t v14 = self->_appendBuffer;
      if (v13 <= 1022)
      {
        v14[v13] = 32;
        uint64_t v15 = 1;
        goto LABEL_22;
      }
      v14[v13] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v14, 0x8000100u);
      p_string = &self->_string;
      uint64_t v17 = " ";
LABEL_27:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v17, 0x8000100u);
      break;
    case 3:
LABEL_14:
      int64_t v18 = self->_appendBufferCount;
      size_t v19 = self->_appendBuffer;
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_17;
    case 4:
LABEL_17:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      int64_t v21 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v22 = strlen(v21);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v23 = self->_appendBufferCount;
      if ((uint64_t)(v23 + v22) > 1023)
      {
        if (v23 >= 1)
        {
          self->_appendBuffer[v23] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v21, 0x8000100u);
      }
      else
      {
        uint64_t v15 = v22;
        memcpy(&self->_appendBuffer[v23], v21, v22);
LABEL_22:
        *p_appendBufferCount += v15;
      }
      break;
    default:
      goto LABEL_29;
  }
  self->_emitPhase = 0;
LABEL_29:
  if (!a4) {
    goto LABEL_61;
  }
  int64_t nameTruncation = v9->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v9->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v27 = [a4 length];
  int64_t v28 = self->_appendBufferCount;
  if (v28 + 3 * v27 > 1023)
  {
    if (v28 >= 1)
    {
      self->_appendBuffer[v28] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v27 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_44;
    }
    CFIndex usedBufLen = 0;
    v54.location = 0;
    v54.length = v27;
    CFStringGetBytes((CFStringRef)a4, v54, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v29 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v53.location = 0;
    v53.length = v27;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, &self->_appendBuffer[v28], 1024 - v28, &usedBufLen);
    CFIndex v29 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v29;
LABEL_44:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    int64_t v30 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    int64_t v30 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v31 = *(unint64_t *)((char *)&self->_style->super.isa + *v30);
  if (v31 < 2)
  {
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = self->_appendBuffer;
    if (v35 <= 1021)
    {
      *(_WORD *)&v36[v35] = 8250;
      uint64_t v34 = 2;
      goto LABEL_56;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    __int16 v39 = ": ";
  }
  else if (v31 == 2)
  {
    int64_t v37 = self->_appendBufferCount;
    int64_t v38 = &self->_appendBuffer[v37];
    if (v37 <= 1020)
    {
      v38[2] = 32;
      *(_WORD *)int64_t v38 = 15648;
      uint64_t v34 = 3;
      goto LABEL_56;
    }
    unsigned __int8 *v38 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    __int16 v39 = " = ";
  }
  else
  {
    if (v31 != 3) {
      goto LABEL_61;
    }
    int64_t v32 = self->_appendBufferCount;
    int64_t v33 = self->_appendBuffer;
    if (v32 <= 1019)
    {
      *(_DWORD *)&v33[v32] = 540945696;
      uint64_t v34 = 4;
LABEL_56:
      self->_appendBufferCount += v34;
      goto LABEL_61;
    }
    v33[v32] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v33, 0x8000100u);
    __int16 v39 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v39, 0x8000100u);
LABEL_61:
  int64_t valueTruncation = v9->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v9->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v43 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v43 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v43) = (Class)maximumValueLengthBeforeTruncation;

  if (v8)
  {
    CFIndex v44 = [(__CFString *)v8 length];
    int64_t v45 = self->_appendBufferCount;
    if (v45 + 3 * v44 > 1023)
    {
      if (v45 >= 1)
      {
        self->_appendBuffer[v45] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v44 > 341)
      {
        [(NSMutableString *)self->_string appendString:v8];
        goto LABEL_79;
      }
      CFIndex usedBufLen = 0;
      v56.location = 0;
      v56.length = v44;
      CFStringGetBytes(v8, v56, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v46 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v55.location = 0;
      v55.length = v44;
      CFStringGetBytes(v8, v55, 0x8000100u, 0, 0, &self->_appendBuffer[v45], 1024 - v45, &usedBufLen);
      CFIndex v46 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    int64_t v47 = self->_appendBufferCount;
    int64_t v48 = &self->_appendBuffer[v47];
    if (v47 > 1018)
    {
      *int64_t v48 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_79;
    }
    v48[4] = 62;
    *(_DWORD *)int64_t v48 = 1818848828;
    CFIndex v46 = self->_appendBufferCount + 5;
  }
  self->_int64_t appendBufferCount = v46;
LABEL_79:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  int64_t v49 = self;

LABEL_80:
  return self;
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  id v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%tu", (uint64_t)a4, v4, v5, v6, v7, a3);
  return v8;
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  CFStringRef v8 = @"%tu";
  if (a5 == 1) {
    CFStringRef v8 = @"0x%tX";
  }
  CFRange v9 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, v8, (uint64_t)a4, a5, v5, v6, v7, a3);
  return v9;
}

- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4
{
  CFStringRef v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%u", (uint64_t)a4, v4, v5, v6, v7, a3);
  return v8;
}

- (id)appendInt64:(int64_t)a3 withName:(id)a4
{
  CFStringRef v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%lld", (uint64_t)a4, v4, v5, v6, v7, a3);
  return v8;
}

- (id)appendFloat:(double)a3 withName:(id)a4
{
  return [(BSDescriptionStream *)self appendFloat:a4 withName:0x7FFFFFFFFFFFFFFFLL decimalPrecision:a3];
}

uint64_t __66__BSDescriptionStream_appendTimeInterval_withName_decomposeUnits___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  uint64_t v1 = (void *)_MergedGlobals_27;
  _MergedGlobals_27 = (uint64_t)v0;

  uint64_t v2 = (void *)_MergedGlobals_27;
  return [v2 setUnitsStyle:1];
}

- (id)appendPointer:(void *)a3 withName:(id)a4
{
  CFStringRef v8 = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, @"%p", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
  return v8;
}

- (id)appendPoint:(CGPoint)a3 withName:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CFStringRef v8 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v14 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v16 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v12 = self->_appendBufferCount;
      int64_t v13 = self->_appendBuffer;
      if (v12 <= 1022)
      {
        v13[v12] = 32;
        uint64_t v14 = 1;
        goto LABEL_19;
      }
      v13[v12] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
      p_string = &self->_string;
      int64_t v16 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v17 = self->_appendBufferCount;
      int64_t v18 = self->_appendBuffer;
      if (v17 > 1022)
      {
        v18[v17] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v18[v17] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v20 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v21 = strlen(v20);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v22 = self->_appendBufferCount;
      if ((uint64_t)(v22 + v21) > 1023)
      {
        if (v22 >= 1)
        {
          self->_appendBuffer[v22] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
      }
      else
      {
        uint64_t v14 = v21;
        memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_19:
        *p_appendBufferCount += v14;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v8->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v26 = [a4 length];
  int64_t v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v47.location = 0;
    v47.length = v26;
    CFStringGetBytes((CFStringRef)a4, v47, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v28 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v46.location = 0;
    v46.length = v26;
    CFStringGetBytes((CFStringRef)a4, v46, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    CFIndex v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v28;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
  if (v30 < 2)
  {
    int64_t v34 = self->_appendBufferCount;
    int64_t v35 = self->_appendBuffer;
    if (v34 <= 1021)
    {
      *(_WORD *)&v35[v34] = 8250;
      uint64_t v33 = 2;
      goto LABEL_53;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    int64_t v38 = ": ";
  }
  else if (v30 == 2)
  {
    int64_t v36 = self->_appendBufferCount;
    int64_t v37 = &self->_appendBuffer[v36];
    if (v36 <= 1020)
    {
      v37[2] = 32;
      *(_WORD *)int64_t v37 = 15648;
      uint64_t v33 = 3;
      goto LABEL_53;
    }
    unsigned __int8 *v37 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int64_t v38 = " = ";
  }
  else
  {
    if (v30 != 3) {
      goto LABEL_58;
    }
    int64_t v31 = self->_appendBufferCount;
    int64_t v32 = self->_appendBuffer;
    if (v31 <= 1019)
    {
      *(_DWORD *)&v32[v31] = 540945696;
      uint64_t v33 = 4;
LABEL_53:
      self->_appendBufferCount += v33;
      goto LABEL_58;
    }
    v32[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
    int64_t v38 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v8->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
  if (valueTruncation <= 1 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v42 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v42 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

  int64_t v43 = self->_appendBufferCount;
  if (v43 >= 1)
  {
    self->_appendBuffer[v43] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  [(NSMutableString *)self->_string appendFormat:@"{%.*g, %.*g}", 17, *(void *)&x, 17, *(void *)&y];
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendSize:(CGSize)a3 withName:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  CFStringRef v8 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v14 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      int64_t v16 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v12 = self->_appendBufferCount;
      int64_t v13 = self->_appendBuffer;
      if (v12 <= 1022)
      {
        v13[v12] = 32;
        uint64_t v14 = 1;
        goto LABEL_19;
      }
      v13[v12] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
      p_string = &self->_string;
      int64_t v16 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v17 = self->_appendBufferCount;
      int64_t v18 = self->_appendBuffer;
      if (v17 > 1022)
      {
        v18[v17] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v18[v17] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v20 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v21 = strlen(v20);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v22 = self->_appendBufferCount;
      if ((uint64_t)(v22 + v21) > 1023)
      {
        if (v22 >= 1)
        {
          self->_appendBuffer[v22] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
      }
      else
      {
        uint64_t v14 = v21;
        memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_19:
        *p_appendBufferCount += v14;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v8->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v26 = [a4 length];
  int64_t v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v47.location = 0;
    v47.length = v26;
    CFStringGetBytes((CFStringRef)a4, v47, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v28 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v46.location = 0;
    v46.length = v26;
    CFStringGetBytes((CFStringRef)a4, v46, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    CFIndex v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v28;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
  if (v30 < 2)
  {
    int64_t v34 = self->_appendBufferCount;
    int64_t v35 = self->_appendBuffer;
    if (v34 <= 1021)
    {
      *(_WORD *)&v35[v34] = 8250;
      uint64_t v33 = 2;
      goto LABEL_53;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    int64_t v38 = ": ";
  }
  else if (v30 == 2)
  {
    int64_t v36 = self->_appendBufferCount;
    int64_t v37 = &self->_appendBuffer[v36];
    if (v36 <= 1020)
    {
      v37[2] = 32;
      *(_WORD *)int64_t v37 = 15648;
      uint64_t v33 = 3;
      goto LABEL_53;
    }
    unsigned __int8 *v37 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int64_t v38 = " = ";
  }
  else
  {
    if (v30 != 3) {
      goto LABEL_58;
    }
    int64_t v31 = self->_appendBufferCount;
    int64_t v32 = self->_appendBuffer;
    if (v31 <= 1019)
    {
      *(_DWORD *)&v32[v31] = 540945696;
      uint64_t v33 = 4;
LABEL_53:
      self->_appendBufferCount += v33;
      goto LABEL_58;
    }
    v32[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
    int64_t v38 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v8->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
  if (valueTruncation <= 1 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v42 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v42 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

  int64_t v43 = self->_appendBufferCount;
  if (v43 >= 1)
  {
    self->_appendBuffer[v43] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
  }
  [(NSMutableString *)self->_string appendFormat:@"{%.*g, %.*g}", 17, *(void *)&width, 17, *(void *)&height];
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendSelector:(SEL)a3 withName:(id)a4
{
  NSStringFromSelector(a3);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      int64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      int64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a4 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v51.location = 0;
    v51.length = v25;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v50.location = 0;
    v50.length = v25;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    int64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    int64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)int64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *int64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    int64_t v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    int64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (v6)
  {
    CFIndex v42 = [(__CFString *)v6 length];
    int64_t v43 = self->_appendBufferCount;
    if (v43 + 3 * v42 > 1023)
    {
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v42 > 341)
      {
        [(NSMutableString *)self->_string appendString:v6];
        goto LABEL_76;
      }
      CFIndex usedBufLen = 0;
      v53.location = 0;
      v53.length = v42;
      CFStringGetBytes(v6, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v44 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v52.location = 0;
      v52.length = v42;
      CFStringGetBytes(v6, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v43], 1024 - v43, &usedBufLen);
      CFIndex v44 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    int64_t v45 = self->_appendBufferCount;
    CFRange v46 = &self->_appendBuffer[v45];
    if (v45 > 1018)
    {
      *CFRange v46 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_76;
    }
    v46[4] = 62;
    *(_DWORD *)CFRange v46 = 1818848828;
    CFIndex v44 = self->_appendBufferCount + 5;
  }
  self->_int64_t appendBufferCount = v44;
LABEL_76:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  CFRange v47 = self;

  return v47;
}

- (id)appendCString:(const char *)a3 withName:(id)a4
{
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      int64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      int64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a4 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v54.location = 0;
    v54.length = v25;
    CFStringGetBytes((CFStringRef)a4, v54, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v53.location = 0;
    v53.length = v25;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    int64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    int64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)int64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *int64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    int64_t v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    int64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (a3)
  {
    size_t v42 = strlen(a3);
    int64_t v43 = self->_appendBufferCount;
    if ((uint64_t)(v43 + v42) <= 1023)
    {
      size_t v44 = v42;
      memcpy(&self->_appendBuffer[v43], a3, v42);
      int64_t v45 = self->_appendBufferCount + v44;
LABEL_69:
      self->_int64_t appendBufferCount = v45;
      goto LABEL_75;
    }
    if (v43 >= 1)
    {
      self->_appendBuffer[v43] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    string = self->_string;
    int64_t v49 = a3;
  }
  else
  {
    int64_t v46 = self->_appendBufferCount;
    CFRange v47 = &self->_appendBuffer[v46];
    if (v46 <= 1018)
    {
      v47[4] = 62;
      *(_DWORD *)CFRange v47 = 1818848828;
      int64_t v45 = self->_appendBufferCount + 5;
      goto LABEL_69;
    }
    unsigned __int8 *v47 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
    string = self->_string;
    int64_t v49 = "<nil>";
  }
  CFStringAppendCString((CFMutableStringRef)string, v49, 0x8000100u);
LABEL_75:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendQueue:(id)a3 withName:(id)a4
{
  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      int64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      int64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a4 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v54.location = 0;
    v54.length = v25;
    CFStringGetBytes((CFStringRef)a4, v54, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v53.location = 0;
    v53.length = v25;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    int64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    int64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)int64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *int64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    int64_t v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    int64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (label)
  {
    size_t v42 = strlen(label);
    int64_t v43 = self->_appendBufferCount;
    if ((uint64_t)(v43 + v42) <= 1023)
    {
      size_t v44 = v42;
      memcpy(&self->_appendBuffer[v43], label, v42);
      int64_t v45 = self->_appendBufferCount + v44;
LABEL_69:
      self->_int64_t appendBufferCount = v45;
      goto LABEL_75;
    }
    if (v43 >= 1)
    {
      self->_appendBuffer[v43] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    string = self->_string;
    int64_t v49 = label;
  }
  else
  {
    int64_t v46 = self->_appendBufferCount;
    CFRange v47 = &self->_appendBuffer[v46];
    if (v46 <= 1018)
    {
      v47[4] = 62;
      *(_DWORD *)CFRange v47 = 1818848828;
      int64_t v45 = self->_appendBufferCount + 5;
      goto LABEL_69;
    }
    unsigned __int8 *v47 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_int64_t appendBufferCount = 0;
    string = self->_string;
    int64_t v49 = "<nil>";
  }
  CFStringAppendCString((CFMutableStringRef)string, v49, 0x8000100u);
LABEL_75:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendClass:(Class)a3 withName:(id)a4
{
  NSStringFromClass(a3);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_int64_t appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = "; ";
      goto LABEL_24;
    case 2:
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v11 = self->_appendBufferCount;
      int64_t v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      uint64_t v15 = " ";
LABEL_24:
      int64_t *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      int64_t v16 = self->_appendBufferCount;
      int64_t v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      int64_t indentLevel = self->_indentLevel;
      if (indentLevel < 1) {
        break;
      }
      if (indentLevel >= 8) {
        int64_t indentLevel = 8;
      }
      size_t v19 = (const char *)*((void *)&sIndentSpaceStrings + indentLevel);
      size_t v20 = strlen(v19);
      p_int64_t appendBufferCount = &self->_appendBufferCount;
      int64_t v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          int64_t *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4) {
    goto LABEL_58;
  }
  int64_t nameTruncation = v7->_nameTruncation;
  int64_t maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  CFIndex v25 = [a4 length];
  int64_t v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      [(NSMutableString *)self->_string appendString:a4];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v51.location = 0;
    v51.length = v25;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    CFIndex v27 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v50.location = 0;
    v50.length = v25;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    CFIndex v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_int64_t appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0) {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    CFIndex v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    int64_t v33 = self->_appendBufferCount;
    int64_t v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      uint64_t v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    int64_t v37 = ": ";
  }
  else if (v29 == 2)
  {
    int64_t v35 = self->_appendBufferCount;
    int64_t v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)int64_t v36 = 15648;
      uint64_t v32 = 3;
      goto LABEL_53;
    }
    *int64_t v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    int64_t v37 = " = ";
  }
  else
  {
    if (v29 != 3) {
      goto LABEL_58;
    }
    int64_t v30 = self->_appendBufferCount;
    int64_t v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      uint64_t v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    int64_t v37 = " -> ";
  }
  self->_int64_t appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  int64_t valueTruncation = v7->_valueTruncation;
  int64_t maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    int64_t maximumValueLengthBeforeTruncation = 0;
    uint64_t v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndeCGFloat x = self->_appendBufferCount + [(NSMutableString *)self->_string length];
    uint64_t v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (v6)
  {
    CFIndex v42 = [(__CFString *)v6 length];
    int64_t v43 = self->_appendBufferCount;
    if (v43 + 3 * v42 > 1023)
    {
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_int64_t appendBufferCount = 0;
      }
      if (v42 > 341)
      {
        [(NSMutableString *)self->_string appendString:v6];
        goto LABEL_76;
      }
      CFIndex usedBufLen = 0;
      v53.location = 0;
      v53.length = v42;
      CFStringGetBytes(v6, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      CFIndex v44 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v52.location = 0;
      v52.length = v42;
      CFStringGetBytes(v6, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v43], 1024 - v43, &usedBufLen);
      CFIndex v44 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    int64_t v45 = self->_appendBufferCount;
    int64_t v46 = &self->_appendBuffer[v45];
    if (v45 > 1018)
    {
      *int64_t v46 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_int64_t appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_76;
    }
    v46[4] = 62;
    *(_DWORD *)int64_t v46 = 1818848828;
    CFIndex v44 = self->_appendBufferCount + 5;
  }
  self->_int64_t appendBufferCount = v44;
LABEL_76:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  CFRange v47 = self;

  return v47;
}

- (BOOL)verboseSingleItemCollections
{
  return self->_verboseSingleItemCollections;
}

- (void)setVerboseSingleItemCollections:(BOOL)a3
{
  self->_verboseSingleItemCollections = a3;
}

@end