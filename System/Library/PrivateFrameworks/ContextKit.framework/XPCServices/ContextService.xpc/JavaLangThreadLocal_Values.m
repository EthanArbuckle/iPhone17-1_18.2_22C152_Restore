@interface JavaLangThreadLocal_Values
+ (const)__metadata;
+ (void)initialize;
- (JavaLangThreadLocal_Values)init;
- (JavaLangThreadLocal_Values)initWithJavaLangThreadLocal_Values:(id)a3;
- (id)getAfterMissWithJavaLangThreadLocal:(id)a3;
- (int)nextWithInt:(int)a3;
- (void)addWithJavaLangThreadLocal:(id)a3 withId:(id)a4;
- (void)dealloc;
- (void)inheritValuesWithJavaLangThreadLocal_Values:(id)a3;
- (void)initializeTableWithInt:(int)a3;
- (void)putWithJavaLangThreadLocal:(id)a3 withId:(id)a4;
- (void)removeWithJavaLangThreadLocal:(id)a3;
@end

@implementation JavaLangThreadLocal_Values

- (JavaLangThreadLocal_Values)init
{
  return self;
}

- (JavaLangThreadLocal_Values)initWithJavaLangThreadLocal_Values:(id)a3
{
  return self;
}

- (void)inheritValuesWithJavaLangThreadLocal_Values:(id)a3
{
}

- (void)initializeTableWithInt:(int)a3
{
}

- (void)addWithJavaLangThreadLocal:(id)a3 withId:(id)a4
{
  if (!a3 || (table = self->table_) == 0) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int v7 = self->mask_ & *((_DWORD *)a3 + 4);
  while (1)
  {
    int v8 = v7;
    uint64_t size = table->super.size_;
    if (v7 < 0 || v7 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v7);
    }
    if (!(&table->elementType_)[v7]) {
      break;
    }
    int v7 = self->mask_ & (v7 + 2);
    table = self->table_;
    if (!table) {
      goto LABEL_13;
    }
  }
  IOSObjectArray_Set((uint64_t)self->table_, v7, *((void **)a3 + 1));
  v10 = self->table_;
  IOSObjectArray_Set((uint64_t)v10, v8 + 1, a4);
}

- (void)putWithJavaLangThreadLocal:(id)a3 withId:(id)a4
{
  sub_10019007C((uint64_t)self);
  if (!a3 || (table = self->table_) == 0) {
LABEL_22:
  }
    JreThrowNullPointerException();
  int v8 = self->mask_ & *((_DWORD *)a3 + 4);
  int v9 = -1;
  while (1)
  {
    uint64_t v10 = v8;
    uint64_t size = table->super.size_;
    if (v8 < 0 || v8 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v8);
    }
    v12 = (&table->elementType_)[v8];
    v13 = (IOSClass *)*((void *)a3 + 1);
    if (v12 == v13) {
      break;
    }
    if (!v12)
    {
      v16 = self->table_;
      if (v9 == -1)
      {
        IOSObjectArray_Set((uint64_t)v16, v10, v13);
        IOSObjectArray_Set((uint64_t)self->table_, (int)v10 + 1, a4);
        ++self->size_;
      }
      else
      {
        IOSObjectArray_Set((uint64_t)v16, v9, v13);
        IOSObjectArray_Set((uint64_t)self->table_, v9 + 1, a4);
        *(int32x2_t *)&self->size_ = vadd_s32(*(int32x2_t *)&self->size_, (int32x2_t)0xFFFFFFFF00000001);
      }
      return;
    }
    if (v12 == (IOSClass *)qword_100560A20) {
      int v14 = v10;
    }
    else {
      int v14 = -1;
    }
    if (v9 == -1) {
      int v9 = v14;
    }
    int v8 = self->mask_ & (v10 + 2);
    table = self->table_;
    if (!table) {
      goto LABEL_22;
    }
  }
  v15 = self->table_;
  IOSObjectArray_Set((uint64_t)v15, (int)v10 + 1, a4);
}

- (id)getAfterMissWithJavaLangThreadLocal:(id)a3
{
  if (!a3 || (table = self->table_) == 0) {
    JreThrowNullPointerException();
  }
  int mask = self->mask_;
  uint64_t v7 = mask & *((_DWORD *)a3 + 4);
  uint64_t size = table->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, mask & *((_DWORD *)a3 + 4));
  }
  if ((&table->elementType_)[(int)v7])
  {
    int v9 = self->mask_ & (v7 + 2);
    uint64_t v10 = 0xFFFFFFFFLL;
    while (1)
    {
      uint64_t v7 = v9;
      uint64_t v11 = table->super.size_;
      if (v9 < 0 || v9 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v9);
      }
      v12 = (&table->elementType_)[v9];
      if (v12 == *((IOSClass **)a3 + 1))
      {
        uint64_t v19 = table->super.size_;
        int v20 = v7 + 1;
        if ((int)v7 + 1 < 0 || v20 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, v20);
        }
        return (&table->elementType_)[v20];
      }
      if (!v12) {
        break;
      }
      if (v12 == (IOSClass *)qword_100560A20) {
        unsigned int v13 = v7;
      }
      else {
        unsigned int v13 = -1;
      }
      if (v10 == -1) {
        uint64_t v10 = v13;
      }
      else {
        uint64_t v10 = v10;
      }
      int v9 = self->mask_ & (v7 + 2);
    }
    id v14 = [a3 initialValue];
    if (self->table_ != table) {
      goto LABEL_34;
    }
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v21 = table->super.size_;
      if ((int)v10 >= (int)v21) {
        IOSArray_throwOutOfBoundsWithMsg(v21, v10);
      }
      if ((&table->elementType_)[v10] == (IOSClass *)qword_100560A20)
      {
        IOSObjectArray_Set((uint64_t)table, v10, *((void **)a3 + 1));
        IOSObjectArray_Set((uint64_t)table, (int)v10 + 1, v14);
        *(int32x2_t *)&self->size_ = vadd_s32(*(int32x2_t *)&self->size_, (int32x2_t)0xFFFFFFFF00000001);
        return v14;
      }
    }
    uint64_t v22 = table->super.size_;
    if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v22) {
      IOSArray_throwOutOfBoundsWithMsg(v22, v7);
    }
    if (!(&table->elementType_)[v7])
    {
      v16 = (void *)*((void *)a3 + 1);
      uint64_t v17 = (uint64_t)table;
      uint64_t v18 = v7;
      goto LABEL_37;
    }
    goto LABEL_34;
  }
  id v14 = [a3 initialValue];
  if (self->table_ != table) {
    goto LABEL_34;
  }
  uint64_t v15 = table->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v7);
  }
  if ((&table->elementType_)[(int)v7])
  {
LABEL_34:
    [(JavaLangThreadLocal_Values *)self putWithJavaLangThreadLocal:a3 withId:v14];
    return v14;
  }
  v16 = (void *)*((void *)a3 + 1);
  uint64_t v17 = (uint64_t)table;
  uint64_t v18 = (int)v7;
LABEL_37:
  IOSObjectArray_Set(v17, v18, v16);
  IOSObjectArray_Set((uint64_t)table, (int)v7 + 1, v14);
  ++self->size_;
  sub_10019007C((uint64_t)self);
  return v14;
}

- (void)removeWithJavaLangThreadLocal:(id)a3
{
  sub_10019007C((uint64_t)self);
  if (!a3 || (table = self->table_) == 0) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int v6 = self->mask_ & *((_DWORD *)a3 + 4);
  while (1)
  {
    uint64_t v7 = v6;
    uint64_t size = table->super.size_;
    if (v6 < 0 || v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    int v9 = (&table->elementType_)[v6];
    if (v9 == *((IOSClass **)a3 + 1)) {
      break;
    }
    if (!v9) {
      return;
    }
    int v6 = self->mask_ & (v7 + 2);
    table = self->table_;
    if (!table) {
      goto LABEL_13;
    }
  }
  IOSObjectArray_Set((uint64_t)self->table_, v7, (void *)qword_100560A20);
  IOSObjectArray_Set((uint64_t)self->table_, (int)v7 + 1, 0);
  *(int32x2_t *)&self->size_ = vadd_s32(*(int32x2_t *)&self->size_, (int32x2_t)0x1FFFFFFFFLL);
}

- (int)nextWithInt:(int)a3
{
  return self->mask_ & (a3 + 2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangThreadLocal_Values;
  [(JavaLangThreadLocal_Values *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100560A20, objc_alloc((Class)NSObject));
    atomic_store(1u, (unsigned __int8 *)&JavaLangThreadLocal_Values__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040ECC8;
}

@end