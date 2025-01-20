@interface OrgXmlSaxHelpersAttributesImpl
+ (const)__metadata;
- (OrgXmlSaxHelpersAttributesImpl)init;
- (OrgXmlSaxHelpersAttributesImpl)initWithOrgXmlSaxAttributes:(id)a3;
- (id)getLocalNameWithInt:(int)a3;
- (id)getQNameWithInt:(int)a3;
- (id)getTypeWithInt:(int)a3;
- (id)getTypeWithNSString:(id)a3;
- (id)getTypeWithNSString:(id)a3 withNSString:(id)a4;
- (id)getURIWithInt:(int)a3;
- (id)getValueWithInt:(int)a3;
- (id)getValueWithNSString:(id)a3;
- (id)getValueWithNSString:(id)a3 withNSString:(id)a4;
- (int)getIndexWithNSString:(id)a3;
- (int)getIndexWithNSString:(id)a3 withNSString:(id)a4;
- (int)getLength;
- (void)addAttributeWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (void)badIndexWithInt:(int)a3;
- (void)clear;
- (void)dealloc;
- (void)ensureCapacityWithInt:(int)a3;
- (void)removeAttributeWithInt:(int)a3;
- (void)setAttributeWithInt:(int)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8;
- (void)setAttributesWithOrgXmlSaxAttributes:(id)a3;
- (void)setLocalNameWithInt:(int)a3 withNSString:(id)a4;
- (void)setQNameWithInt:(int)a3 withNSString:(id)a4;
- (void)setTypeWithInt:(int)a3 withNSString:(id)a4;
- (void)setURIWithInt:(int)a3 withNSString:(id)a4;
- (void)setValueWithInt:(int)a3 withNSString:(id)a4;
@end

@implementation OrgXmlSaxHelpersAttributesImpl

- (OrgXmlSaxHelpersAttributesImpl)init
{
  self->length_ = 0;
  JreStrongAssign((id *)&self->data_, 0);
  return self;
}

- (OrgXmlSaxHelpersAttributesImpl)initWithOrgXmlSaxAttributes:(id)a3
{
  return self;
}

- (int)getLength
{
  return self->length_;
}

- (id)getURIWithInt:(int)a3
{
  if (a3 < 0 || self->length_ <= a3) {
    return 0;
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int v4 = 5 * a3;
  uint64_t size = data->super.size_;
  if (5 * a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  return (&data->elementType_)[5 * a3];
}

- (id)getLocalNameWithInt:(int)a3
{
  if (a3 < 0 || self->length_ <= a3) {
    return 0;
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  uint64_t size = data->super.size_;
  int v5 = 5 * a3 + 1;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return (&data->elementType_)[v5];
}

- (id)getQNameWithInt:(int)a3
{
  if (a3 < 0 || self->length_ <= a3) {
    return 0;
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  uint64_t size = data->super.size_;
  int v5 = 5 * a3 + 2;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return (&data->elementType_)[v5];
}

- (id)getTypeWithInt:(int)a3
{
  if (a3 < 0 || self->length_ <= a3) {
    return 0;
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  uint64_t size = data->super.size_;
  int v5 = 5 * a3 + 3;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return (&data->elementType_)[v5];
}

- (id)getValueWithInt:(int)a3
{
  if (a3 < 0 || self->length_ <= a3) {
    return 0;
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  uint64_t size = data->super.size_;
  int v5 = 5 * a3 + 4;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return (&data->elementType_)[v5];
}

- (int)getIndexWithNSString:(id)a3 withNSString:(id)a4
{
  int v4 = 5 * self->length_;
  if (v4 < 1) {
    return -1;
  }
  uint64_t v8 = 0;
  while (1)
  {
    data = self->data_;
    if (!data) {
      goto LABEL_18;
    }
    uint64_t size = data->super.size_;
    if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v8);
    }
    v11 = (&data->elementType_)[(int)v8];
    if (!v11) {
LABEL_18:
    }
      JreThrowNullPointerException();
    if ([(IOSClass *)v11 isEqual:a3])
    {
      v12 = self->data_;
      int v13 = v8 + 1;
      uint64_t v14 = v12->super.size_;
      if ((int)v8 < -1 || v13 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v13);
      }
      id v15 = v12->buffer_[(int)v8];
      if (!v15) {
        goto LABEL_18;
      }
      if ([v15 isEqual:a4]) {
        return (int)v8 / 5;
      }
    }
    uint64_t v8 = (v8 + 5);
    if ((int)v8 >= v4) {
      return -1;
    }
  }
}

- (int)getIndexWithNSString:(id)a3
{
  int v3 = 5 * self->length_;
  if (v3 < 1) {
    return -1;
  }
  int v6 = 0;
  while (1)
  {
    data = self->data_;
    if (!data) {
      goto LABEL_13;
    }
    uint64_t size = data->super.size_;
    int v9 = v6 + 2;
    if (v6 + 2 < 0 || v9 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v9);
    }
    id v10 = data->buffer_[v6 + 1];
    if (!v10) {
LABEL_13:
    }
      JreThrowNullPointerException();
    if ([v10 isEqual:a3]) {
      return v6 / 5;
    }
    v6 += 5;
    if (v6 >= v3) {
      return -1;
    }
  }
}

- (id)getTypeWithNSString:(id)a3 withNSString:(id)a4
{
  int v4 = 5 * self->length_;
  if (v4 < 1) {
    return 0;
  }
  uint64_t v8 = 3;
  while (1)
  {
    data = self->data_;
    if (!data) {
      goto LABEL_20;
    }
    int v10 = v8 - 3;
    uint64_t size = data->super.size_;
    if (v8 - 3 < 0 || v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, (v8 - 3));
    }
    v12 = (&data->elementType_)[v10];
    if (!v12) {
LABEL_20:
    }
      JreThrowNullPointerException();
    if ([(IOSClass *)v12 isEqual:a3])
    {
      int v13 = self->data_;
      int v14 = v8 - 2;
      uint64_t v15 = v13->super.size_;
      if (v10 < -1 || v14 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v14);
      }
      v16 = (void *)*((void *)&v13->super.size_ + (int)v8);
      if (!v16) {
        goto LABEL_20;
      }
      if ([v16 isEqual:a4]) {
        break;
      }
    }
    int v17 = v8 + 2;
    uint64_t v8 = (v8 + 5);
    if (v17 >= v4) {
      return 0;
    }
  }
  v19 = self->data_;
  uint64_t v20 = v19->super.size_;
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v20) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v8);
  }
  return (&v19->elementType_)[(int)v8];
}

- (id)getTypeWithNSString:(id)a3
{
  int v3 = 5 * self->length_;
  if (v3 < 1) {
    return 0;
  }
  uint64_t v6 = 3;
  while (1)
  {
    data = self->data_;
    if (!data) {
      goto LABEL_15;
    }
    uint64_t size = data->super.size_;
    int v9 = v6 - 1;
    if ((int)v6 - 1 < 0 || v9 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v9);
    }
    int v10 = (void *)*((void *)&data->isRetained_ + (int)v6);
    if (!v10) {
LABEL_15:
    }
      JreThrowNullPointerException();
    if ([v10 isEqual:a3]) {
      break;
    }
    int v11 = v6 + 2;
    uint64_t v6 = (v6 + 5);
    if (v11 >= v3) {
      return 0;
    }
  }
  int v13 = self->data_;
  uint64_t v14 = v13->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v6);
  }
  return (&v13->elementType_)[(int)v6];
}

- (id)getValueWithNSString:(id)a3 withNSString:(id)a4
{
  int v4 = 5 * self->length_;
  if (v4 < 1) {
    return 0;
  }
  uint64_t v8 = 4;
  while (1)
  {
    data = self->data_;
    if (!data) {
      goto LABEL_20;
    }
    int v10 = v8 - 4;
    uint64_t size = data->super.size_;
    if (v8 - 4 < 0 || v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, (v8 - 4));
    }
    v12 = (&data->elementType_)[v10];
    if (!v12) {
LABEL_20:
    }
      JreThrowNullPointerException();
    if ([(IOSClass *)v12 isEqual:a3])
    {
      int v13 = self->data_;
      int v14 = v8 - 3;
      uint64_t v15 = v13->super.size_;
      if (v10 < -1 || v14 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v14);
      }
      v16 = (void *)*((void *)&v13->super.super.isa + (int)v8);
      if (!v16) {
        goto LABEL_20;
      }
      if ([v16 isEqual:a4]) {
        break;
      }
    }
    int v17 = v8 + 1;
    uint64_t v8 = (v8 + 5);
    if (v17 >= v4) {
      return 0;
    }
  }
  v19 = self->data_;
  uint64_t v20 = v19->super.size_;
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v20) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v8);
  }
  return (&v19->elementType_)[(int)v8];
}

- (id)getValueWithNSString:(id)a3
{
  int v3 = 5 * self->length_;
  if (v3 < 1) {
    return 0;
  }
  uint64_t v6 = 4;
  while (1)
  {
    data = self->data_;
    if (!data) {
      goto LABEL_15;
    }
    uint64_t size = data->super.size_;
    int v9 = v6 - 2;
    if ((int)v6 - 2 < 0 || v9 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v9);
    }
    int v10 = (void *)*((void *)&data->super.size_ + (int)v6);
    if (!v10) {
LABEL_15:
    }
      JreThrowNullPointerException();
    if ([v10 isEqual:a3]) {
      break;
    }
    int v11 = v6 + 1;
    uint64_t v6 = (v6 + 5);
    if (v11 >= v3) {
      return 0;
    }
  }
  int v13 = self->data_;
  uint64_t v14 = v13->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v6);
  }
  return (&v13->elementType_)[(int)v6];
}

- (void)clear
{
  if (self->data_ && 5 * self->length_ >= 1)
  {
    uint64_t v3 = 0;
    do
      IOSObjectArray_Set((uint64_t)self->data_, v3++, 0);
    while (v3 < 5 * self->length_);
  }
  self->length_ = 0;
}

- (void)setAttributesWithOrgXmlSaxAttributes:(id)a3
{
  [(OrgXmlSaxHelpersAttributesImpl *)self clear];
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = [a3 getLength];
  self->length_ = v5;
  if (v5 >= 1)
  {
    id v6 = +[IOSObjectArray newArrayWithLength:5 * v5 type:NSString_class_()];
    JreStrongAssignAndConsume((id *)&self->data_, v6);
    if (self->length_ >= 1)
    {
      uint64_t v7 = 0;
      int v8 = 4;
      do
      {
        IOSObjectArray_Set((uint64_t)self->data_, v8 - 4, [a3 getURIWithInt:v7]);
        IOSObjectArray_Set((uint64_t)self->data_, v8 - 3, [a3 getLocalNameWithInt:v7]);
        IOSObjectArray_Set((uint64_t)self->data_, v8 - 2, [a3 getQNameWithInt:v7]);
        IOSObjectArray_Set((uint64_t)self->data_, v8 - 1, [a3 getTypeWithInt:v7]);
        IOSObjectArray_Set((uint64_t)self->data_, v8, [a3 getValueWithInt:v7++]);
        v8 += 5;
      }
      while (v7 < self->length_);
    }
  }
}

- (void)addAttributeWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  sub_10015CB54((char *)self, self->length_ + 1);
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)data, 5 * self->length_, a3);
  IOSObjectArray_Set((uint64_t)self->data_, 5 * self->length_ + 1, a4);
  IOSObjectArray_Set((uint64_t)self->data_, 5 * self->length_ + 2, a5);
  IOSObjectArray_Set((uint64_t)self->data_, 5 * self->length_ + 3, a6);
  IOSObjectArray_Set((uint64_t)self->data_, 5 * self->length_ + 4, a7);
  ++self->length_;
}

- (void)setAttributeWithInt:(int)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8
{
  if (a3 < 0 || self->length_ <= a3) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int v14 = 5 * a3;
  IOSObjectArray_Set((uint64_t)data, 5 * a3, a4);
  IOSObjectArray_Set((uint64_t)self->data_, v14 + 1, a5);
  IOSObjectArray_Set((uint64_t)self->data_, v14 + 2, a6);
  IOSObjectArray_Set((uint64_t)self->data_, v14 + 3, a7);
  uint64_t v15 = self->data_;
  IOSObjectArray_Set((uint64_t)v15, v14 + 4, a8);
}

- (void)removeAttributeWithInt:(int)a3
{
  if (a3 < 0 || (int length = self->length_, length <= a3)) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  if (length - 1 > a3) {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->data_, (5 * a3 + 5), self->data_, (5 * a3), (5 * (length + ~a3)));
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int v11 = 5 * self->length_;
  IOSObjectArray_Set((uint64_t)data, v11 - 5, 0);
  IOSObjectArray_Set((uint64_t)self->data_, v11 - 4, 0);
  IOSObjectArray_Set((uint64_t)self->data_, v11 - 3, 0);
  IOSObjectArray_Set((uint64_t)self->data_, v11 - 2, 0);
  IOSObjectArray_Set((uint64_t)self->data_, v11 - 1, 0);
  --self->length_;
}

- (void)setURIWithInt:(int)a3 withNSString:(id)a4
{
  if (a3 < 0 || self->length_ <= a3) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)data, 5 * a3, a4);
}

- (void)setLocalNameWithInt:(int)a3 withNSString:(id)a4
{
  if (a3 < 0 || self->length_ <= a3) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)data, 5 * a3 + 1, a4);
}

- (void)setQNameWithInt:(int)a3 withNSString:(id)a4
{
  if (a3 < 0 || self->length_ <= a3) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)data, 5 * a3 + 2, a4);
}

- (void)setTypeWithInt:(int)a3 withNSString:(id)a4
{
  if (a3 < 0 || self->length_ <= a3) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)data, 5 * a3 + 3, a4);
}

- (void)setValueWithInt:(int)a3 withNSString:(id)a4
{
  if (a3 < 0 || self->length_ <= a3) {
    sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)data, 5 * a3 + 4, a4);
}

- (void)ensureCapacityWithInt:(int)a3
{
}

- (void)badIndexWithInt:(int)a3
{
  sub_10015CD08(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersAttributesImpl;
  [(OrgXmlSaxHelpersAttributesImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FA470;
}

@end