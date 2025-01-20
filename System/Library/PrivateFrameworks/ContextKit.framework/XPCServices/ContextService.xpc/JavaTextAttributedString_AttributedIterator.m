@interface JavaTextAttributedString_AttributedIterator
+ (const)__metadata;
- (BOOL)inRangeWithJavaTextAttributedString_Range:(id)a3;
- (BOOL)inRangeWithJavaUtilList:(id)a3;
- (JavaTextAttributedString_AttributedIterator)initWithJavaTextAttributedString:(id)a3;
- (JavaTextAttributedString_AttributedIterator)initWithJavaTextAttributedString:(id)a3 withJavaTextAttributedCharacterIterator_AttributeArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentValueWithJavaUtilList:(id)a3;
- (id)getAllAttributeKeys;
- (id)getAttributeWithJavaTextAttributedCharacterIterator_Attribute:(id)a3;
- (id)getAttributes;
- (int)getBeginIndex;
- (int)getEndIndex;
- (int)getIndex;
- (int)getRunLimit;
- (int)getRunLimitWithJavaTextAttributedCharacterIterator_Attribute:(id)a3;
- (int)getRunLimitWithJavaUtilSet:(id)a3;
- (int)getRunStart;
- (int)getRunStartWithJavaTextAttributedCharacterIterator_Attribute:(id)a3;
- (int)getRunStartWithJavaUtilSet:(id)a3;
- (int)runLimitWithJavaUtilList:(id)a3;
- (int)runStartWithJavaUtilList:(id)a3;
- (unsigned)current;
- (unsigned)first;
- (unsigned)last;
- (unsigned)next;
- (unsigned)previous;
- (unsigned)setIndexWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaTextAttributedString_AttributedIterator

- (JavaTextAttributedString_AttributedIterator)initWithJavaTextAttributedString:(id)a3
{
  return self;
}

- (JavaTextAttributedString_AttributedIterator)initWithJavaTextAttributedString:(id)a3 withJavaTextAttributedCharacterIterator_AttributeArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)JavaTextAttributedString_AttributedIterator;
  v3 = [(JavaTextAttributedString_AttributedIterator *)&v7 clone];
  objc_opt_class();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    attributesAllowed = self->attributesAllowed_;
    if (attributesAllowed)
    {
      id v5 = [(JavaUtilHashSet *)attributesAllowed clone];
      objc_opt_class();
      if (!v5 || (objc_opt_isKindOfClass() & 1) != 0)
      {
        JreStrongAssign(v3 + 4, v5);
        return v3;
      }
LABEL_9:
      JreThrowClassCastException();
    }
  }
  else if (self->attributesAllowed_)
  {
    JreThrowNullPointerException();
  }
  return v3;
}

- (unsigned)current
{
  if (self->offset_ == self->end_) {
    return -1;
  }
  attrString = self->attrString_;
  if (!attrString || (text = attrString->text_) == 0) {
    JreThrowNullPointerException();
  }
  return -[NSString charAtWithInt:](text, "charAtWithInt:");
}

- (unsigned)first
{
  int begin = self->begin_;
  if (begin == self->end_) {
    return -1;
  }
  self->offset_ = begin;
  attrString = self->attrString_;
  if (!attrString || (text = attrString->text_) == 0) {
    JreThrowNullPointerException();
  }
  return -[NSString charAtWithInt:](text, "charAtWithInt:");
}

- (int)getBeginIndex
{
  return self->begin_;
}

- (int)getEndIndex
{
  return self->end_;
}

- (int)getIndex
{
  return self->offset_;
}

- (BOOL)inRangeWithJavaTextAttributedString_Range:(id)a3
{
  return sub_100231824((uint64_t)self, (uint64_t)a3);
}

- (BOOL)inRangeWithJavaUtilList:(id)a3
{
  return sub_1002318BC((uint64_t)self, a3);
}

- (id)getAllAttributeKeys
{
  if (!self->begin_)
  {
    attrString = self->attrString_;
    if (attrString)
    {
      text = attrString->text_;
      if (text)
      {
        int end = self->end_;
        if (end != [(NSString *)text length] || self->attributesAllowed_) {
          goto LABEL_6;
        }
        attributeMap = self->attrString_->attributeMap_;
        if (attributeMap)
        {
          return [(JavaUtilMap *)attributeMap keySet];
        }
      }
    }
LABEL_24:
    JreThrowNullPointerException();
  }
LABEL_6:
  v6 = self->attrString_;
  if (!v6) {
    goto LABEL_24;
  }
  objc_super v7 = v6->attributeMap_;
  if (!v7) {
    goto LABEL_24;
  }
  v8 = objc_autorelease(new_JavaUtilHashSet_initWithInt_(((int)(4
                                                                            * [(JavaUtilMap *)v7 size])/ 3+ 1)));
  id v9 = [(JavaUtilMap *)self->attrString_->attributeMap_ entrySet];
  if (!v9) {
    goto LABEL_24;
  }
  id v10 = [v9 iterator];
  if (!v10) {
    goto LABEL_24;
  }
  v11 = v10;
  if ([v10 hasNext])
  {
    do
    {
      id v12 = [v11 next];
      v13 = v12;
      attributesAllowed = self->attributesAllowed_;
      if (attributesAllowed)
      {
        if (!v12) {
          goto LABEL_24;
        }
        if (!-[JavaUtilHashSet containsWithId:](attributesAllowed, "containsWithId:", [v12 getKey])) {
          continue;
        }
      }
      else if (!v12)
      {
        goto LABEL_24;
      }
      if (sub_1002318BC((uint64_t)self, [v13 getValue])) {
        -[JavaUtilHashSet addWithId:](v8, "addWithId:", [v13 getKey]);
      }
    }
    while (([v11 hasNext] & 1) != 0);
  }
  return v8;
}

- (id)currentValueWithJavaUtilList:(id)a3
{
  return (id)sub_100231B54((uint64_t)self, a3);
}

- (id)getAttributeWithJavaTextAttributedCharacterIterator_Attribute:(id)a3
{
  attributesAllowed = self->attributesAllowed_;
  if (attributesAllowed && ![(JavaUtilHashSet *)attributesAllowed containsWithId:a3]) {
    return 0;
  }
  attrString = self->attrString_;
  if (!attrString || (attributeMap = attrString->attributeMap_) == 0) {
    JreThrowNullPointerException();
  }
  id v8 = [(JavaUtilMap *)attributeMap getWithId:a3];
  objc_opt_class();
  if (!v8) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return (id)sub_100231B54((uint64_t)self, v8);
}

- (id)getAttributes
{
  attrString = self->attrString_;
  if (!attrString
    || (attributeMap = attrString->attributeMap_) == 0
    || (id v5 = objc_autorelease(new_JavaUtilHashMap_initWithInt_(((int)(4
                                                                                  * -[JavaUtilMap size](attributeMap, "size"))/ 3+ 1))), (v6 = -[JavaUtilMap entrySet](self->attrString_->attributeMap_, "entrySet")) == 0)|| (id v7 = [v6 iterator]) == 0)
  {
LABEL_15:
    JreThrowNullPointerException();
  }
  id v8 = v7;
  if ([v7 hasNext])
  {
    do
    {
      id v9 = [v8 next];
      id v10 = v9;
      attributesAllowed = self->attributesAllowed_;
      if (attributesAllowed)
      {
        if (!v9) {
          goto LABEL_15;
        }
        if (!-[JavaUtilHashSet containsWithId:](attributesAllowed, "containsWithId:", [v9 getKey])) {
          continue;
        }
      }
      else if (!v9)
      {
        goto LABEL_15;
      }
      uint64_t v12 = sub_100231B54((uint64_t)self, [v10 getValue]);
      if (v12) {
        -[JavaUtilHashMap putWithId:withId:](v5, "putWithId:withId:", [v10 getKey], v12);
      }
    }
    while (([v8 hasNext] & 1) != 0);
  }
  return v5;
}

- (int)getRunLimit
{
  id v3 = [(JavaTextAttributedString_AttributedIterator *)self getAllAttributeKeys];
  return [(JavaTextAttributedString_AttributedIterator *)self getRunLimitWithJavaUtilSet:v3];
}

- (int)runLimitWithJavaUtilList:(id)a3
{
  return sub_100231DF0(self, a3);
}

- (int)getRunLimitWithJavaTextAttributedCharacterIterator_Attribute:(id)a3
{
  attributesAllowed = self->attributesAllowed_;
  if (attributesAllowed && ![(JavaUtilHashSet *)attributesAllowed containsWithId:a3]) {
    return self->end_;
  }
  attrString = self->attrString_;
  if (!attrString || (attributeMap = attrString->attributeMap_) == 0) {
    JreThrowNullPointerException();
  }
  id v8 = [(JavaUtilMap *)attributeMap getWithId:a3];
  objc_opt_class();
  if (!v8) {
    return self->end_;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return sub_100231DF0(self, v8);
}

- (int)getRunLimitWithJavaUtilSet:(id)a3
{
  if (!a3 || (end = self->end_, (id v5 = [a3 iterator]) == 0)) {
    JreThrowNullPointerException();
  }
  id v6 = v5;
  if ([v5 hasNext])
  {
    do
    {
      signed int v7 = -[JavaTextAttributedString_AttributedIterator getRunLimitWithJavaTextAttributedCharacterIterator_Attribute:](self, "getRunLimitWithJavaTextAttributedCharacterIterator_Attribute:", [v6 next]);
      if (v7 < end) {
        int end = v7;
      }
    }
    while (([v6 hasNext] & 1) != 0);
  }
  return end;
}

- (int)getRunStart
{
  id v3 = [(JavaTextAttributedString_AttributedIterator *)self getAllAttributeKeys];
  return [(JavaTextAttributedString_AttributedIterator *)self getRunStartWithJavaUtilSet:v3];
}

- (int)runStartWithJavaUtilList:(id)a3
{
  return sub_100232014((unsigned int *)self, a3);
}

- (int)getRunStartWithJavaTextAttributedCharacterIterator_Attribute:(id)a3
{
  attributesAllowed = self->attributesAllowed_;
  if (attributesAllowed && ![(JavaUtilHashSet *)attributesAllowed containsWithId:a3]) {
    return self->begin_;
  }
  attrString = self->attrString_;
  if (!attrString || (attributeMap = attrString->attributeMap_) == 0) {
    JreThrowNullPointerException();
  }
  id v8 = [(JavaUtilMap *)attributeMap getWithId:a3];
  objc_opt_class();
  if (!v8) {
    return self->begin_;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return sub_100232014((unsigned int *)self, v8);
}

- (int)getRunStartWithJavaUtilSet:(id)a3
{
  if (!a3 || (begin = self->begin_, (id v5 = [a3 iterator]) == 0)) {
    JreThrowNullPointerException();
  }
  id v6 = v5;
  if ([v5 hasNext])
  {
    do
    {
      signed int v7 = -[JavaTextAttributedString_AttributedIterator getRunStartWithJavaTextAttributedCharacterIterator_Attribute:](self, "getRunStartWithJavaTextAttributedCharacterIterator_Attribute:", [v6 next]);
      if (v7 > begin) {
        int begin = v7;
      }
    }
    while (([v6 hasNext] & 1) != 0);
  }
  return begin;
}

- (unsigned)last
{
  int end = self->end_;
  if (self->begin_ == end) {
    return -1;
  }
  self->offset_ = end - 1;
  attrString = self->attrString_;
  if (!attrString || (text = attrString->text_) == 0) {
    JreThrowNullPointerException();
  }
  return -[NSString charAtWithInt:](text, "charAtWithInt:");
}

- (unsigned)next
{
  int end = self->end_;
  int offset = self->offset_;
  if (offset >= end - 1)
  {
    self->offset_ = end;
    return -1;
  }
  else
  {
    attrString = self->attrString_;
    if (!attrString || (text = attrString->text_) == 0) {
      JreThrowNullPointerException();
    }
    self->offset_ = offset + 1;
    return -[NSString charAtWithInt:](text, "charAtWithInt:");
  }
}

- (unsigned)previous
{
  int offset = self->offset_;
  if (offset == self->begin_) {
    return -1;
  }
  attrString = self->attrString_;
  if (!attrString || (text = attrString->text_) == 0) {
    JreThrowNullPointerException();
  }
  self->offset_ = offset - 1;
  return -[NSString charAtWithInt:](text, "charAtWithInt:");
}

- (unsigned)setIndexWithInt:(int)a3
{
  if (self->begin_ > a3 || (int end = self->end_, end < a3))
  {
    signed int v7 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v7);
  }
  self->offset_ = a3;
  if (end == a3) {
    return -1;
  }
  attrString = self->attrString_;
  if (!attrString || (text = attrString->text_) == 0) {
    JreThrowNullPointerException();
  }
  return -[NSString charAtWithInt:](text, "charAtWithInt:");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextAttributedString_AttributedIterator;
  [(JavaTextAttributedString_AttributedIterator *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaTextAttributedString_AttributedIterator *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100455E88;
}

@end