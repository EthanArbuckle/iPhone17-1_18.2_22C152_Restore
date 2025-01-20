@interface JavaUtilCollections_CheckedMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_CheckedMap)initWithJavaUtilMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5;
- (NSString)description;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
- (void)putAllWithJavaUtilMap:(id)a3;
@end

@implementation JavaUtilCollections_CheckedMap

- (JavaUtilCollections_CheckedMap)initWithJavaUtilMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5
{
  return self;
}

- (int)size
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m size];
}

- (BOOL)isEmpty
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m isEmpty];
}

- (BOOL)containsKeyWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m containsKeyWithId:a3];
}

- (BOOL)containsValueWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m containsValueWithId:a3];
}

- (id)getWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m getWithId:a3];
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a3, self->keyType_);
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a4, self->valueType_);
  return [(JavaUtilMap *)m putWithId:a3 withId:a4];
}

- (id)removeWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m removeWithId:a3];
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  if (!a3) {
    goto LABEL_20;
  }
  signed int v5 = [a3 size];
  if (v5)
  {
    int v6 = v5;
    v7 = +[IOSObjectArray arrayWithLength:v5 type:JavaUtilMap_Entry_class_()];
    id v8 = [a3 entrySet];
    if (!v8) {
      goto LABEL_20;
    }
    id v9 = [v8 iterator];
    if (v6 >= 1)
    {
      v10 = v9;
      if (v9)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v6;
        do
        {
          id v13 = [v10 next];
          if (!v13) {
            goto LABEL_20;
          }
          v14 = v13;
          JavaUtilCollections_checkTypeWithId_withIOSClass_([v13 getKey], self->keyType_);
          JavaUtilCollections_checkTypeWithId_withIOSClass_([v14 getValue], self->valueType_);
          IOSObjectArray_Set((uint64_t)v7, v11++, v14);
        }
        while (v12 != v11);
        uint64_t v15 = 0;
        while (1)
        {
          m = self->m_;
          if (!m) {
            break;
          }
          uint64_t size = v7->super.size_;
          if (v15 >= size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v15);
          }
          v18 = (&v7->elementType_)[v15];
          if (!v18) {
            break;
          }
          id v19 = [(IOSClass *)v18 getKey];
          uint64_t v20 = v7->super.size_;
          if (v15 >= v20) {
            IOSArray_throwOutOfBoundsWithMsg(v20, v15);
          }
          v21 = (&v7->elementType_)[v15];
          if (!v21) {
            break;
          }
          [(JavaUtilMap *)m putWithId:v19 withId:[(IOSClass *)v21 getValue]];
          if (v12 == ++v15) {
            return;
          }
        }
      }
LABEL_20:
      JreThrowNullPointerException();
    }
  }
}

- (void)clear
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)m clear];
}

- (id)keySet
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m keySet];
}

- (id)values
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m values];
}

- (id)entrySet
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilMap *)m entrySet];
  valueType = self->valueType_;
  int v6 = [JavaUtilCollections_CheckedMap_CheckedEntrySet alloc];
  JreStrongAssign((id *)&v6->s_, v4);
  JreStrongAssign((id *)&v6->valueType_, valueType);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m isEqual:a3];
}

- (unint64_t)hash
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilMap *)m hash];
}

- (NSString)description
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaUtilMap *)m description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedMap;
  [(JavaUtilCollections_CheckedMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042BB90;
}

@end