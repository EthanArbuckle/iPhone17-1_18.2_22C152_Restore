@interface OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet)initWithInt:(int)a3 withInt:(int)a4;
- (OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet)initWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet

- (OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet)initWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->hashCode_ = a4;
  self->state_ = a5;
  return self;
}

- (OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet)initWithInt:(int)a3 withInt:(int)a4
{
  int v8 = a3;
  JreStrongAssignAndConsume((id *)&self->values_, +[IOSIntArray newArrayWithInts:&v8 count:1]);
  self->hashCode_ = a3 + 683;
  self->state_ = a4;
  return self;
}

- (unint64_t)hash
{
  return self->hashCode_;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->hashCode_ != *((_DWORD *)a3 + 4)) {
        return 0;
      }
      uint64_t v5 = *((void *)a3 + 1);
      if (v5)
      {
        int v6 = *(_DWORD *)(v5 + 8);
        values = self->values_;
        if (v6 == values->super.size_)
        {
          if (v6 >= 1)
          {
            uint64_t v8 = 0;
            do
            {
              uint64_t v9 = *((void *)a3 + 1);
              uint64_t v10 = *(int *)(v9 + 8);
              if (v8 >= v10) {
                IOSArray_throwOutOfBoundsWithMsg(v10, v8);
              }
              int v11 = *(_DWORD *)(v9 + 12 + 4 * v8);
              uint64_t size = values->super.size_;
              if (v8 >= size) {
                IOSArray_throwOutOfBoundsWithMsg(size, v8);
              }
              int v13 = *(&values->super.size_ + v8 + 1);
              BOOL result = v11 == v13;
              if (v11 != v13) {
                break;
              }
              ++v8;
              values = self->values_;
            }
            while (v8 < values->super.size_);
            return result;
          }
          return 1;
        }
        return 0;
      }
LABEL_35:
      JreThrowNullPointerException();
    }
LABEL_34:
    JreThrowClassCastException();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_34;
  }
  if (self->hashCode_ != *((_DWORD *)a3 + 8)) {
    return 0;
  }
  uint64_t v15 = *((void *)a3 + 1);
  if (!v15) {
    goto LABEL_35;
  }
  v16 = self->values_;
  if (!v16) {
    goto LABEL_35;
  }
  int v17 = *(_DWORD *)(v15 + 8);
  if (v17 != v16->super.size_) {
    return 0;
  }
  if (v17 < 1) {
    return 1;
  }
  uint64_t v18 = 0;
  do
  {
    uint64_t v19 = *((void *)a3 + 1);
    uint64_t v20 = *(int *)(v19 + 8);
    if (v18 >= v20) {
      IOSArray_throwOutOfBoundsWithMsg(v20, v18);
    }
    int v21 = *(_DWORD *)(v19 + 12 + 4 * v18);
    uint64_t v22 = v16->super.size_;
    if (v18 >= v22) {
      IOSArray_throwOutOfBoundsWithMsg(v22, v18);
    }
    int v23 = *(&v16->super.size_ + v18 + 1);
    BOOL result = v21 == v23;
    if (v21 != v23) {
      break;
    }
    ++v18;
    v16 = self->values_;
  }
  while (v18 < v16->super.size_);
  return result;
}

- (id)description
{
  id v3 = [new_JavaLangStringBuilder_init() appendWithChar:91];
  values = self->values_;
  if (!values) {
    goto LABEL_17;
  }
  uint64_t v5 = v3;
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t size = values->super.size_;
    if (v6 >= (int)size) {
      break;
    }
    if (v6)
    {
      if (!v5) {
        goto LABEL_17;
      }
      [v5 appendWithChar:32];
      values = self->values_;
      uint64_t size = values->super.size_;
      uint64_t v8 = (int)size;
    }
    else
    {
      if (!v5) {
        goto LABEL_17;
      }
      uint64_t v8 = (int)size;
    }
    if (v6 >= v8) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    [v5 appendWithInt:*((unsigned int *)&values->super.size_ + ++v6)];
    values = self->values_;
    if (!values) {
      goto LABEL_17;
    }
  }
  if (!v5) {
LABEL_17:
  }
    JreThrowNullPointerException();
  [v5 appendWithChar:93];
  return [v5 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet;
  [(OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet *)&v3 dealloc];
}

@end