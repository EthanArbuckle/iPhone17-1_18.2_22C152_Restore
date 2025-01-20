@interface OrgApacheLuceneUtilAutomatonAutomaton_Builder
- (BOOL)isAcceptWithInt:(int)a3;
- (OrgApacheLuceneUtilAutomatonAutomaton_Builder)init;
- (OrgApacheLuceneUtilAutomatonAutomaton_Builder)initWithInt:(int)a3 withInt:(int)a4;
- (id)finish;
- (int)createState;
- (int)getNumStates;
- (void)addEpsilonWithInt:(int)a3 withInt:(int)a4;
- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)copyStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (void)copy__WithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (void)dealloc;
- (void)setAcceptWithInt:(int)a3 withBoolean:(BOOL)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonAutomaton_Builder

- (OrgApacheLuceneUtilAutomatonAutomaton_Builder)init
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonAutomaton_Builder)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  p_transitions = &self->transitions_;
  transitions = self->transitions_;
  if (!transitions
    || (signed int v15 = self->nextTransition_ + 4, transitions->super.size_ < v15)
    && (v16 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)self->transitions_, v15, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7), JreStrongAssign((id *)p_transitions, v16), (transitions = *p_transitions) == 0))
  {
    JreThrowNullPointerException();
  }
  int nextTransition = self->nextTransition_;
  self->nextTransition_ = nextTransition + 1;
  uint64_t size = transitions->super.size_;
  if (nextTransition < 0 || nextTransition >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, nextTransition);
  }
  *(&transitions->super.size_ + nextTransition + 1) = a3;
  v19 = self->transitions_;
  int v20 = self->nextTransition_;
  self->nextTransition_ = v20 + 1;
  uint64_t v21 = v19->super.size_;
  if (v20 < 0 || v20 >= (int)v21) {
    IOSArray_throwOutOfBoundsWithMsg(v21, v20);
  }
  *(&v19->super.size_ + v20 + 1) = a4;
  v22 = self->transitions_;
  int v23 = self->nextTransition_;
  self->nextTransition_ = v23 + 1;
  uint64_t v24 = v22->super.size_;
  if (v23 < 0 || v23 >= (int)v24) {
    IOSArray_throwOutOfBoundsWithMsg(v24, v23);
  }
  *(&v22->super.size_ + v23 + 1) = a5;
  v25 = self->transitions_;
  int v26 = self->nextTransition_;
  self->nextTransition_ = v26 + 1;
  uint64_t v27 = v25->super.size_;
  if (v26 < 0 || v26 >= (int)v27) {
    IOSArray_throwOutOfBoundsWithMsg(v27, v26);
  }
  *(&v25->super.size_ + v26 + 1) = a6;
}

- (void)addEpsilonWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (self->nextTransition_ >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      transitions = self->transitions_;
      if (!transitions) {
        JreThrowNullPointerException();
      }
      uint64_t size = transitions->super.size_;
      if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      if (*(&transitions->super.size_ + (int)v7 + 1) == v4)
      {
        v10 = self->transitions_;
        int v11 = v7 + 1;
        uint64_t v12 = v10->super.size_;
        if ((v7 & 0x80000000) != 0 || v11 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v11);
        }
        v13 = self->transitions_;
        uint64_t v14 = *((unsigned int *)&v10->super.size_ + v11 + 1);
        int v15 = v7 + 2;
        if ((v7 & 0x80000000) != 0 || v15 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v15);
        }
        uint64_t v16 = *((unsigned int *)&v13->super.size_ + v15 + 1);
        int v17 = v7 + 3;
        if ((v7 & 0x80000000) != 0 || v17 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v17);
        }
        [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self addTransitionWithInt:v5 withInt:v14 withInt:v16 withInt:*((unsigned int *)&v13->super.size_ + v17 + 1)];
      }
      uint64_t v7 = (v7 + 4);
    }
    while ((int)v7 < self->nextTransition_);
  }
  if ([(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self isAcceptWithInt:v4])
  {
    [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self setAcceptWithInt:v5 withBoolean:1];
  }
}

- (id)finish
{
  signed int nextState = self->nextState_;
  uint64_t v4 = (self->nextTransition_ / 4);
  uint64_t v5 = [OrgApacheLuceneUtilAutomatonAutomaton alloc];
  OrgApacheLuceneUtilAutomatonAutomaton_initWithInt_withInt_((uint64_t)v5, nextState, v4);
  uint64_t v6 = v5;
  if (nextState >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      [(OrgApacheLuceneUtilAutomatonAutomaton *)v6 createState];
      [(OrgApacheLuceneUtilAutomatonAutomaton *)v6 setAcceptWithInt:v7 withBoolean:[(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self isAcceptWithInt:v7]];
      uint64_t v7 = (v7 + 1);
    }
    while (nextState != v7);
  }
  sorter = self->sorter_;
  if (!sorter) {
    goto LABEL_23;
  }
  [(OrgApacheLuceneUtilSorter *)sorter sortWithInt:0 withInt:v4];
  if (self->nextTransition_ >= 1)
  {
    uint64_t v9 = 0;
    while (1)
    {
      transitions = self->transitions_;
      if (!transitions) {
        break;
      }
      uint64_t size = transitions->super.size_;
      if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v9);
      }
      uint64_t v13 = *((unsigned int *)&transitions->super.size_ + (int)v9 + 1);
      int v14 = v9 + 1;
      if ((v9 & 0x80000000) != 0 || v14 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v14);
      }
      uint64_t v12 = self->transitions_;
      uint64_t v15 = *((unsigned int *)&v12->super.size_ + v14 + 1);
      int v16 = v9 + 2;
      if ((v9 & 0x80000000) != 0 || v16 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v16);
      }
      uint64_t v17 = *((unsigned int *)&v12->super.size_ + v16 + 1);
      int v18 = v9 + 3;
      if ((v9 & 0x80000000) != 0 || v18 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v18);
      }
      [(OrgApacheLuceneUtilAutomatonAutomaton *)v6 addTransitionWithInt:v13 withInt:v15 withInt:v17 withInt:*((unsigned int *)&self->transitions_->super.size_ + v18 + 1)];
      uint64_t v9 = (v9 + 4);
      if ((int)v9 >= self->nextTransition_) {
        goto LABEL_22;
      }
    }
LABEL_23:
    JreThrowNullPointerException();
  }
LABEL_22:
  [(OrgApacheLuceneUtilAutomatonAutomaton *)v6 finishState];
  return v6;
}

- (int)createState
{
  int nextState = self->nextState_;
  self->nextState_ = nextState + 1;
  return nextState;
}

- (void)setAcceptWithInt:(int)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self getNumStates] <= a3)
  {
    [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self getNumStates];
    CFStringRef v15 = JreStrcat("$I$IC", v8, v9, v10, v11, v12, v13, v14, @"state=");
    int v16 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  isAccept = self->isAccept_;
  if (!isAccept) {
    JreThrowNullPointerException();
  }
  [(JavaUtilBitSet *)isAccept setWithInt:v5 withBoolean:v4];
}

- (BOOL)isAcceptWithInt:(int)a3
{
  isAccept = self->isAccept_;
  if (!isAccept) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilBitSet *)isAccept getWithInt:*(void *)&a3];
}

- (int)getNumStates
{
  return self->nextState_;
}

- (void)copy__WithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  unsigned int v5 = [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self getNumStates];
  if (!a3) {
    JreThrowNullPointerException();
  }
  unsigned int v6 = v5;
  int v7 = [a3 getNumStates];
  [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self copyStatesWithOrgApacheLuceneUtilAutomatonAutomaton:a3];
  uint64_t v8 = new_OrgApacheLuceneUtilAutomatonTransition_init();
  if (v7 >= 1)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    do
    {
      int v11 = [a3 initTransitionWithInt:v10 withOrgApacheLuceneUtilAutomatonTransition:v9];
      if (v11 >= 1)
      {
        int v12 = v11;
        do
        {
          [a3 getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:v9];
          [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self addTransitionWithInt:v10 + v6 withInt:v9->dest_ + v6 withInt:v9->min_ withInt:v9->max_];
          --v12;
        }
        while (v12);
      }
      uint64_t v10 = (v10 + 1);
    }
    while (v10 != v7);
  }
}

- (void)copyStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = [a3 getNumStates];
  if (v5 >= 1)
  {
    int v6 = v5;
    uint64_t v7 = 0;
    do
    {
      -[OrgApacheLuceneUtilAutomatonAutomaton_Builder setAcceptWithInt:withBoolean:](self, "setAcceptWithInt:withBoolean:", -[OrgApacheLuceneUtilAutomatonAutomaton_Builder createState](self, "createState"), [a3 isAcceptWithInt:v7]);
      uint64_t v7 = (v7 + 1);
    }
    while (v6 != v7);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonAutomaton_Builder;
  [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)&v3 dealloc];
}

@end