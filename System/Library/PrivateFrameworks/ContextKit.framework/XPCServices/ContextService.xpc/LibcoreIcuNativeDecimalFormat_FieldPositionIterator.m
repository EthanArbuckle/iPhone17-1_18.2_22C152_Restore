@interface LibcoreIcuNativeDecimalFormat_FieldPositionIterator
+ (const)__metadata;
+ (id)forFieldPositionWithJavaTextFieldPosition:(id)a3;
+ (int)getNativeFieldPositionIdWithJavaTextFieldPosition:(id)a3;
+ (void)initialize;
+ (void)setFieldPositionWithLibcoreIcuNativeDecimalFormat_FieldPositionIterator:(id)a3 withJavaTextFieldPosition:(id)a4;
- (BOOL)next;
- (LibcoreIcuNativeDecimalFormat_FieldPositionIterator)init;
- (id)field;
- (int)fieldId;
- (int)limit;
- (int)start;
- (void)dealloc;
- (void)setDataWithIntArray:(id)a3;
@end

@implementation LibcoreIcuNativeDecimalFormat_FieldPositionIterator

- (LibcoreIcuNativeDecimalFormat_FieldPositionIterator)init
{
  self->pos_ = -3;
  return self;
}

+ (id)forFieldPositionWithJavaTextFieldPosition:(id)a3
{
  if ((atomic_load_explicit(LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (int)getNativeFieldPositionIdWithJavaTextFieldPosition:(id)a3
{
  return sub_1001FB6D8(a3);
}

+ (void)setFieldPositionWithLibcoreIcuNativeDecimalFormat_FieldPositionIterator:(id)a3 withJavaTextFieldPosition:(id)a4
{
  if (atomic_load_explicit(LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized, memory_order_acquire))
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    objc_opt_class();
    if (!a3) {
      return;
    }
  }
  if (a4)
  {
    int v6 = sub_1001FB6D8(a4);
    if (v6 != -1)
    {
      int v7 = v6;
      while ([a3 next])
      {
        if ([a3 fieldId] == v7)
        {
          objc_msgSend(a4, "setBeginIndexWithInt:", objc_msgSend(a3, "start"));
          id v8 = [a3 limit];
          [a4 setEndIndexWithInt:v8];
          return;
        }
      }
    }
  }
}

- (BOOL)next
{
  data = self->data_;
  if (!data || (int pos = self->pos_, pos == data->super.size_))
  {
    int v6 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v6);
  }
  int v4 = pos + 3;
  self->pos_ = v4;
  return v4 < data->super.size_;
}

- (int)fieldId
{
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  uint64_t size = data->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  return *(&data->super.size_ + pos + 1);
}

- (id)field
{
  sub_1001FB8DC((uint64_t)self);
  if (!qword_100560DE0 || (data = self->data_) == 0) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  uint64_t size = data->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  int v6 = *(&data->super.size_ + pos + 1);
  uint64_t v7 = *(unsigned int *)(qword_100560DE0 + 8);
  if (v6 < 0 || v6 >= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v7, v6);
  }
  return *(id *)(qword_100560DE0 + 24 + 8 * v6);
}

- (int)start
{
  sub_1001FB8DC((uint64_t)self);
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  uint64_t size = data->super.size_;
  int v6 = pos + 1;
  if (pos + 1 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (pos + 1));
  }
  return *(&data->super.size_ + v6 + 1);
}

- (int)limit
{
  sub_1001FB8DC((uint64_t)self);
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  uint64_t size = data->super.size_;
  int v6 = pos + 2;
  if (pos + 2 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (pos + 2));
  }
  return *(&data->super.size_ + v6 + 1);
}

- (void)setDataWithIntArray:(id)a3
{
  self->pos_ = -3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIcuNativeDecimalFormat_FieldPositionIterator;
  [(LibcoreIcuNativeDecimalFormat_FieldPositionIterator *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[0] = JavaTextNumberFormat_Field_INTEGER_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[1] = JavaTextNumberFormat_Field_FRACTION_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[2] = JavaTextNumberFormat_Field_DECIMAL_SEPARATOR_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[3] = JavaTextNumberFormat_Field_EXPONENT_SYMBOL_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[4] = JavaTextNumberFormat_Field_EXPONENT_SIGN_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[5] = JavaTextNumberFormat_Field_EXPONENT_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[6] = JavaTextNumberFormat_Field_GROUPING_SEPARATOR_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[7] = JavaTextNumberFormat_Field_CURRENCY_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[8] = JavaTextNumberFormat_Field_PERCENT_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[9] = JavaTextNumberFormat_Field_PERMILLE_;
    if ((atomic_load_explicit((atomic_uchar *volatile)JavaTextNumberFormat_Field__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v3[10] = JavaTextNumberFormat_Field_SIGN_;
    id v2 = +[IOSObjectArray newArrayWithObjects:v3 count:11 type:JavaTextFormat_Field_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560DE0, v2);
    atomic_store(1u, (unsigned __int8 *)LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043E458;
}

@end