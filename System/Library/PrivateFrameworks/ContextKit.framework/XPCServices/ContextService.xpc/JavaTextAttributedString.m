@interface JavaTextAttributedString
+ (const)__metadata;
- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3;
- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaTextAttributedCharacterIterator_AttributeArray:(id)a6;
- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilSet:(id)a6;
- (JavaTextAttributedString)initWithNSString:(id)a3;
- (JavaTextAttributedString)initWithNSString:(id)a3 withJavaUtilMap:(id)a4;
- (id)getIterator;
- (id)getIteratorWithJavaTextAttributedCharacterIterator_AttributeArray:(id)a3;
- (id)getIteratorWithJavaTextAttributedCharacterIterator_AttributeArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)addAttributeWithJavaTextAttributedCharacterIterator_Attribute:(id)a3 withId:(id)a4;
- (void)addAttributeWithJavaTextAttributedCharacterIterator_Attribute:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)addAttributesWithJavaUtilMap:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
@end

@implementation JavaTextAttributedString

- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3
{
  return self;
}

- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilSet:(id)a6
{
  return self;
}

- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  sub_100230628((id *)&self->super.isa, a3, *(void **)&a4, a5, [a3 getAllAttributeKeys]);
  return self;
}

- (JavaTextAttributedString)initWithJavaTextAttributedCharacterIterator:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaTextAttributedCharacterIterator_AttributeArray:(id)a6
{
  return self;
}

- (JavaTextAttributedString)initWithNSString:(id)a3
{
  return self;
}

- (JavaTextAttributedString)initWithNSString:(id)a3 withJavaUtilMap:(id)a4
{
  return self;
}

- (void)addAttributeWithJavaTextAttributedCharacterIterator_Attribute:(id)a3 withId:(id)a4
{
  if (!a3)
  {
    v14 = new_JavaLangNullPointerException_initWithNSString_(@"attribute == null");
    goto LABEL_14;
  }
  text = self->text_;
  if (!text) {
    goto LABEL_11;
  }
  if ([(NSString *)text isEmpty])
  {
    v14 = new_JavaLangIllegalArgumentException_initWithNSString_(@"text is empty");
LABEL_14:
    objc_exception_throw(v14);
  }
  attributeMap = self->attributeMap_;
  if (!attributeMap) {
    goto LABEL_11;
  }
  v9 = (JavaUtilArrayList *)[(JavaUtilMap *)attributeMap getWithId:a3];
  if (v9)
  {
    v10 = v9;
    [(JavaUtilArrayList *)v9 clear];
    goto LABEL_8;
  }
  v10 = new_JavaUtilArrayList_initWithInt_(1);
  [(JavaUtilMap *)self->attributeMap_ putWithId:a3 withId:v10];
  if (!v10) {
LABEL_11:
  }
    JreThrowNullPointerException();
LABEL_8:
  unsigned int v11 = [(NSString *)self->text_ length];
  v12 = [JavaTextAttributedString_Range alloc];
  v12->start_ = 0;
  v12->end_ = v11;
  JreStrongAssign(&v12->value_, a4);
  v13 = v12;
  [(JavaUtilArrayList *)v10 addWithId:v13];
}

- (void)addAttributeWithJavaTextAttributedCharacterIterator_Attribute:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  if (!a3)
  {
    v55 = new_JavaLangNullPointerException_initWithNSString_(@"attribute == null");
LABEL_63:
    objc_exception_throw(v55);
  }
  if (a5 < 0) {
    goto LABEL_61;
  }
  text = self->text_;
  if (!text) {
    goto LABEL_60;
  }
  int v12 = [(NSString *)text length];
  if (a5 >= a6 || v12 < a6)
  {
LABEL_61:
    v55 = new_JavaLangIllegalArgumentException_init();
    goto LABEL_63;
  }
  if (!a4) {
    return;
  }
  attributeMap = self->attributeMap_;
  if (!attributeMap) {
    goto LABEL_60;
  }
  id v14 = [(JavaUtilMap *)attributeMap getWithId:a3];
  if (v14)
  {
    id v15 = [v14 listIterator];
    if (v15)
    {
      v16 = v15;
      if ([v15 hasNext])
      {
        while (1)
        {
          v17 = [v16 next];
          if (!v17) {
            goto LABEL_60;
          }
          v18 = v17;
          if (v17[2] >= a6)
          {
            [v16 previous];
            goto LABEL_41;
          }
          int v19 = v17[3];
          if (v19 > a5 || v19 == a5 && [a4 isEqual:*((void *)v17 + 2)]) {
            break;
          }
          if (([v16 hasNext] & 1) == 0) {
            goto LABEL_41;
          }
        }
        [v16 remove];
        int v23 = v18[2];
        v24 = (void *)*((void *)v18 + 2);
        v25 = [JavaTextAttributedString_Range alloc];
        v25->start_ = v23;
        v25->end_ = a5;
        JreStrongAssign(&v25->value_, v24);
        v26 = v25;
        int v27 = v18[3];
        v28 = (void *)*((void *)v18 + 2);
        v29 = [JavaTextAttributedString_Range alloc];
        v29->start_ = a6;
        v29->end_ = v27;
        JreStrongAssign(&v29->value_, v28);
        v30 = v29;
        while (v18[3] < a6 && [v16 hasNext])
        {
          v31 = [v16 next];
          if (!v31) {
            goto LABEL_60;
          }
          v18 = v31;
          if (v31[3] >= a6)
          {
            int v32 = v31[2];
            if (v32 < a6 || v32 == a6 && [a4 isEqual:*((void *)v31 + 2)])
            {
              [v16 remove];
              int v33 = v18[3];
              v34 = (void *)*((void *)v18 + 2);
              v35 = [JavaTextAttributedString_Range alloc];
              v35->start_ = a6;
              v35->end_ = v33;
              JreStrongAssign(&v35->value_, v34);
              v30 = v35;
              break;
            }
          }
          else
          {
            [v16 remove];
          }
        }
        unsigned int v36 = [a4 isEqual:v26->value_];
        unsigned int v37 = [a4 isEqual:v30->value_];
        int start = v26->start_;
        if (v36)
        {
          if (start >= a5) {
            int v39 = a5;
          }
          else {
            int v39 = v26->start_;
          }
          if (v37)
          {
            if (v30->end_ <= a6) {
              int end = a6;
            }
            else {
              int end = v30->end_;
            }
            id value = v26->value_;
            v42 = [JavaTextAttributedString_Range alloc];
            v42->start_ = v39;
            v42->end_ = end;
            JreStrongAssign(&v42->value_, value);
            v43 = v42;
            goto LABEL_42;
          }
          id v51 = v26->value_;
          v52 = [JavaTextAttributedString_Range alloc];
          v52->start_ = v39;
          v52->end_ = a6;
          JreStrongAssign(&v52->value_, v51);
          v53 = v52;
        }
        else
        {
          int v47 = v26->end_;
          if (v37)
          {
            if (start < v47) {
              [v16 addWithId:v26];
            }
            if (v30->end_ <= a6) {
              int v48 = a6;
            }
            else {
              int v48 = v30->end_;
            }
            id v49 = v30->value_;
            v50 = [JavaTextAttributedString_Range alloc];
            v50->start_ = a5;
            v50->end_ = v48;
            JreStrongAssign(&v50->value_, v49);
            v43 = v50;
            goto LABEL_42;
          }
          if (start < v47) {
            [v16 addWithId:v26];
          }
          v54 = [JavaTextAttributedString_Range alloc];
          v54->start_ = a5;
          v54->end_ = a6;
          JreStrongAssign(&v54->value_, a4);
          v53 = v54;
        }
        [v16 addWithId:v53];
        if (v30->start_ >= v30->end_) {
          return;
        }
        v46 = v16;
        v45 = v30;
        goto LABEL_43;
      }
LABEL_41:
      v44 = [JavaTextAttributedString_Range alloc];
      v44->start_ = a5;
      v44->end_ = a6;
      JreStrongAssign(&v44->value_, a4);
      v43 = v44;
LABEL_42:
      v45 = v43;
      v46 = v16;
LABEL_43:
      [v46 addWithId:v45];
      return;
    }
LABEL_60:
    JreThrowNullPointerException();
  }
  v20 = new_JavaUtilArrayList_initWithInt_(1);
  v21 = [JavaTextAttributedString_Range alloc];
  v21->start_ = a5;
  v21->end_ = a6;
  JreStrongAssign(&v21->value_, a4);
  [(JavaUtilArrayList *)v20 addWithId:v21];
  v22 = self->attributeMap_;
  [(JavaUtilMap *)v22 putWithId:a3 withId:v20];
}

- (void)addAttributesWithJavaUtilMap:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_12;
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = [a3 entrySet];
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = [v8 iterator];
  if (!v9) {
    goto LABEL_12;
  }
  v10 = v9;
  if ([v9 hasNext])
  {
    while (1)
    {
      id v11 = [v10 next];
      int v12 = (void *)JavaUtilMap_Entry_class_();
      if (!v11) {
        break;
      }
      if (([v12 isInstance:v11] & 1) == 0
        || (id v13 = [v11 getKey], objc_opt_class(), v13) && (objc_opt_isKindOfClass() & 1) == 0)
      {
        JreThrowClassCastException();
      }
      -[JavaTextAttributedString addAttributeWithJavaTextAttributedCharacterIterator_Attribute:withId:withInt:withInt:](self, "addAttributeWithJavaTextAttributedCharacterIterator_Attribute:withId:withInt:withInt:", v13, [v11 getValue], v6, v5);
      if (([v10 hasNext] & 1) == 0) {
        return;
      }
    }
LABEL_12:
    JreThrowNullPointerException();
  }
}

- (id)getIterator
{
  v3 = [JavaTextAttributedString_AttributedIterator alloc];
  JavaTextAttributedString_AttributedIterator_initWithJavaTextAttributedString_((uint64_t)v3, self);
  return v3;
}

- (id)getIteratorWithJavaTextAttributedCharacterIterator_AttributeArray:(id)a3
{
  text = self->text_;
  if (!text) {
    JreThrowNullPointerException();
  }
  signed int v6 = [(NSString *)text length];
  v7 = [JavaTextAttributedString_AttributedIterator alloc];
  JavaTextAttributedString_AttributedIterator_initWithJavaTextAttributedString_withJavaTextAttributedCharacterIterator_AttributeArray_withInt_withInt_((uint64_t)v7, self, (uint64_t)a3, 0, v6);
  return v7;
}

- (id)getIteratorWithJavaTextAttributedCharacterIterator_AttributeArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  id v9 = [JavaTextAttributedString_AttributedIterator alloc];
  JavaTextAttributedString_AttributedIterator_initWithJavaTextAttributedString_withJavaTextAttributedCharacterIterator_AttributeArray_withInt_withInt_((uint64_t)v9, self, (uint64_t)a3, a4, a5);
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextAttributedString;
  [(JavaTextAttributedString *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004556D8;
}

@end