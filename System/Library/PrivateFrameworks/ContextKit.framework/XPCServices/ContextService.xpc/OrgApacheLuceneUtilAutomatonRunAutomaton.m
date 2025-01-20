@interface OrgApacheLuceneUtilAutomatonRunAutomaton
- (BOOL)isAcceptWithInt:(int)a3;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAutomatonRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (OrgApacheLuceneUtilAutomatonRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withInt:(int)a6;
- (id)description;
- (id)getCharIntervals;
- (int)getCharClassWithInt:(int)a3;
- (int)getInitialState;
- (int)getSize;
- (int)stepWithInt:(int)a3 withInt:(int)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAutomatonRunAutomaton

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  id v4 = [(JavaLangStringBuilder *)v3 appendWithNSString:@"initial state: "];
  if (!v4) {
    goto LABEL_38;
  }
  id v5 = [v4 appendWithInt:self->initial_];
  if (!v5) {
    goto LABEL_38;
  }
  [v5 appendWithNSString:@"\n"];
  if (self->size_ >= 1)
  {
    uint64_t v13 = 0;
    while (1)
    {
      [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$I", v6, v7, v8, v9, v10, v11, v12, @"state ")];
      accept = self->accept_;
      if (!accept) {
        break;
      }
      uint64_t size = accept->super.size_;
      if (v13 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v13);
      }
      v16 = *((unsigned char *)&accept->super.size_ + v13 + 4) ? @" [accept]:\n" : @" [reject]:\n";
      [(JavaLangStringBuilder *)v3 appendWithNSString:v16];
      points = self->points_;
      if (!points) {
        break;
      }
      uint64_t v18 = 0;
      while (1)
      {
        uint64_t v19 = points->super.size_;
        if (v18 >= v19) {
          break;
        }
        transitions = self->transitions_;
        if (!transitions) {
          goto LABEL_38;
        }
        int v21 = v18 + v19 * v13;
        uint64_t v22 = transitions->super.size_;
        if (v21 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, v21);
        }
        uint64_t v23 = *((unsigned int *)&transitions->super.size_ + v21 + 1);
        if (v23 == -1)
        {
          ++v18;
        }
        else
        {
          uint64_t v24 = points->super.size_;
          if (v18 >= v24) {
            IOSArray_throwOutOfBoundsWithMsg(v24, v18);
          }
          uint64_t v25 = *((unsigned int *)&points->super.size_ + ++v18);
          if ((int)v24 <= (int)v18)
          {
            uint64_t maxInterval = self->maxInterval_;
          }
          else
          {
            if ((v18 & 0x80000000) != 0) {
              IOSArray_throwOutOfBoundsWithMsg(v24, v18);
            }
            uint64_t maxInterval = (*(&points->super.size_ + (int)v18 + 1) - 1);
          }
          [(JavaLangStringBuilder *)v3 appendWithNSString:@" "];
          OrgApacheLuceneUtilAutomatonAutomaton_appendCharStringWithInt_withJavaLangStringBuilder_(v25, v3);
          if (v25 != maxInterval)
          {
            [(JavaLangStringBuilder *)v3 appendWithNSString:@"-"];
            OrgApacheLuceneUtilAutomatonAutomaton_appendCharStringWithInt_withJavaLangStringBuilder_(maxInterval, v3);
          }
          id v27 = [(JavaLangStringBuilder *)v3 appendWithNSString:@" -> "];
          if (!v27) {
            goto LABEL_38;
          }
          id v28 = [v27 appendWithInt:v23];
          if (!v28) {
            goto LABEL_38;
          }
          [v28 appendWithNSString:@"\n"];
          points = self->points_;
          if (!points) {
            goto LABEL_38;
          }
        }
      }
      if (++v13 >= self->size_) {
        goto LABEL_35;
      }
    }
LABEL_38:
    JreThrowNullPointerException();
  }
LABEL_35:
  return [(JavaLangStringBuilder *)v3 description];
}

- (int)getSize
{
  return self->size_;
}

- (BOOL)isAcceptWithInt:(int)a3
{
  accept = self->accept_;
  if (!accept) {
    JreThrowNullPointerException();
  }
  uint64_t size = accept->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *((unsigned char *)&accept->super.size_ + a3 + 4);
}

- (int)getInitialState
{
  return self->initial_;
}

- (id)getCharIntervals
{
  points = self->points_;
  if (!points) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)points clone];
}

- (int)getCharClassWithInt:(int)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_findIndexWithInt_withIntArray_(a3, (uint64_t)self->points_);
}

- (OrgApacheLuceneUtilAutomatonRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withInt:(int)a6
{
  return self;
}

- (int)stepWithInt:(int)a3 withInt:(int)a4
{
  classmap = self->classmap_;
  transitions = self->transitions_;
  if (!classmap)
  {
    if (transitions)
    {
      points = self->points_;
      if (points)
      {
        int size = points->super.size_;
        int v13 = OrgApacheLuceneUtilAutomatonOperations_findIndexWithInt_withIntArray_(a4, (uint64_t)points) + size * a3;
        uint64_t v10 = v13;
        uint64_t v8 = transitions->super.size_;
        if (v13 < 0 || v13 >= (int)v8) {
          goto LABEL_15;
        }
        return *(&transitions->super.size_ + v10 + 1);
      }
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  if (!transitions) {
    goto LABEL_14;
  }
  uint64_t v6 = self->points_;
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = classmap->super.size_;
  if (a4 < 0 || (int)v7 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v7, *(uint64_t *)&a4);
  }
  uint64_t v8 = transitions->super.size_;
  int v9 = *(&classmap->super.size_ + a4 + 1) + v6->super.size_ * a3;
  uint64_t v10 = v9;
  if (v9 < 0 || v9 >= (int)v8) {
LABEL_15:
  }
    IOSArray_throwOutOfBoundsWithMsg(v8, v10);
  return *(&transitions->super.size_ + v10 + 1);
}

- (unint64_t)hash
{
  points = self->points_;
  if (!points) {
    JreThrowNullPointerException();
  }
  int v3 = self->maxInterval_ - self->initial_ + 32 * self->initial_;
  int v4 = points->super.size_ - v3 + 32 * v3;
  return self->size_ - v4 + 32 * v4 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    if (!a3) {
      goto LABEL_13;
    }
    id v5 = [(OrgApacheLuceneUtilAutomatonRunAutomaton *)self getClass];
    if (v5 != [a3 getClass]) {
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    if (self->initial_ == *((_DWORD *)a3 + 8)
      && self->maxInterval_ == *((_DWORD *)a3 + 4)
      && self->size_ == *((_DWORD *)a3 + 5))
    {
      int v6 = JavaUtilArrays_equalsWithIntArray_withIntArray_((uint64_t)self->points_, *((void *)a3 + 6));
      if (v6)
      {
        int v6 = JavaUtilArrays_equalsWithBooleanArray_withBooleanArray_((uint64_t)self->accept_, *((void *)a3 + 3));
        if (v6)
        {
          transitions = self->transitions_;
          uint64_t v8 = *((void *)a3 + 5);
          LOBYTE(v6) = JavaUtilArrays_equalsWithIntArray_withIntArray_((uint64_t)transitions, v8);
        }
      }
    }
    else
    {
LABEL_13:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonRunAutomaton;
  [(OrgApacheLuceneUtilAutomatonRunAutomaton *)&v3 dealloc];
}

@end