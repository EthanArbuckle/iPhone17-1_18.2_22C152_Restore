@interface OrgApacheLuceneUtilAutomatonAutomaton
+ (void)appendCharStringWithInt:(int)a3 withJavaLangStringBuilder:(id)a4;
- (BOOL)isAcceptWithInt:(int)a3;
- (BOOL)isDeterministic;
- (BOOL)transitionSortedWithOrgApacheLuceneUtilAutomatonTransition:(id)a3;
- (OrgApacheLuceneUtilAutomatonAutomaton)init;
- (OrgApacheLuceneUtilAutomatonAutomaton)initWithInt:(int)a3 withInt:(int)a4;
- (id)getAcceptStates;
- (id)getSortedTransitions;
- (id)getStartPoints;
- (id)toDot;
- (int)createState;
- (int)getNumStates;
- (int)getNumTransitions;
- (int)getNumTransitionsWithInt:(int)a3;
- (int)initTransitionWithInt:(int)a3 withOrgApacheLuceneUtilAutomatonTransition:(id)a4;
- (int)stepWithInt:(int)a3 withInt:(int)a4;
- (int64_t)ramBytesUsed;
- (uint64_t)finishCurrentState;
- (unsigned)growStates;
- (unsigned)growTransitions;
- (void)addEpsilonWithInt:(int)a3 withInt:(int)a4;
- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)copy__WithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (void)dealloc;
- (void)finishState;
- (void)getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:(id)a3;
- (void)getTransitionWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonTransition:(id)a5;
- (void)setAcceptWithInt:(int)a3 withBoolean:(BOOL)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonAutomaton

- (OrgApacheLuceneUtilAutomatonAutomaton)init
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonAutomaton)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (int)createState
{
  [(OrgApacheLuceneUtilAutomatonAutomaton *)(uint64_t)self growStates];
  states = self->states_;
  if (!states) {
    JreThrowNullPointerException();
  }
  uint64_t nextState = self->nextState_;
  uint64_t size = states->super.size_;
  if ((nextState & 0x80000000) != 0 || (int)nextState >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, self->nextState_);
  }
  if ((int)nextState >= 0) {
    int v12 = self->nextState_;
  }
  else {
    int v12 = nextState + 1;
  }
  int result = v12 >> 1;
  *(&states->super.size_ + nextState + 1) = -1;
  self->nextState_ += 2;
  return result;
}

- (unsigned)growStates
{
  v9 = (id *)(a1 + 24);
  int result = *(unsigned int **)(a1 + 24);
  if (!result) {
    JreThrowNullPointerException();
  }
  signed int v10 = *((_DWORD *)v9 - 4) + 2;
  if (v10 >= (int)result[2])
  {
    v11 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(result, v10, a3, a4, a5, a6, a7, a8);
    return (unsigned int *)JreStrongAssign(v9, v11);
  }
  return result;
}

- (void)setAcceptWithInt:(int)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(OrgApacheLuceneUtilAutomatonAutomaton *)self getNumStates] <= a3)
  {
    [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNumStates];
    CFStringRef v15 = JreStrcat("$I$IC", v8, v9, v10, v11, v12, v13, v14, @"state=");
    v16 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  isAccept = self->isAccept_;
  if (v4)
  {
    if (isAccept)
    {
      [(JavaUtilBitSet *)isAccept setWithInt:v5];
      return;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  if (!isAccept) {
    goto LABEL_11;
  }
  [(JavaUtilBitSet *)isAccept clearWithInt:v5];
}

- (id)getSortedTransitions
{
  int v3 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNumStates];
  uint64_t v4 = OrgApacheLuceneUtilAutomatonTransition_class_();
  uint64_t v5 = +[IOSObjectArray arrayWithLength:v3 type:IOSClass_arrayType(v4, 1u)];
  if (v3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v3;
    do
    {
      int v8 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNumTransitionsWithInt:v6];
      id v9 = +[IOSObjectArray newArrayWithLength:v8 type:OrgApacheLuceneUtilAutomatonTransition_class_()];
      IOSObjectArray_SetAndConsume((uint64_t)v5, v6, v9);
      if (v8 >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v8;
        do
        {
          uint64_t v12 = new_OrgApacheLuceneUtilAutomatonTransition_init();
          [(OrgApacheLuceneUtilAutomatonAutomaton *)self getTransitionWithInt:v6 withInt:v10 withOrgApacheLuceneUtilAutomatonTransition:v12];
          uint64_t size = v5->super.size_;
          if (v6 >= size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v6);
          }
          uint64_t v14 = (uint64_t)(&v5->elementType_)[v6];
          if (!v14) {
            JreThrowNullPointerException();
          }
          IOSObjectArray_Set(v14, v10++, v12);
        }
        while (v11 != v10);
      }
      ++v6;
    }
    while (v6 != v7);
  }
  return v5;
}

- (id)getAcceptStates
{
  return self->isAccept_;
}

- (BOOL)isAcceptWithInt:(int)a3
{
  isAccept = self->isAccept_;
  if (!isAccept) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilBitSet *)isAccept getWithInt:*(void *)&a3];
}

- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)addTransitionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  int v9 = self->nextState_ / 2;
  if (v9 <= a3)
  {
    v41 = @"source=";
LABEL_33:
    CFStringRef v42 = JreStrcat("$I$IC", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7, v41);
    v43 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v42);
    goto LABEL_35;
  }
  if (v9 <= a4)
  {
    v41 = @"dest=";
    goto LABEL_33;
  }
  [(OrgApacheLuceneUtilAutomatonAutomaton *)(uint64_t)self growTransitions];
  int curState = self->curState_;
  if (curState == a3) {
    goto LABEL_13;
  }
  if (curState != -1) {
    -[OrgApacheLuceneUtilAutomatonAutomaton finishCurrentState]_0((uint64_t)self);
  }
  self->curState_ = a3;
  states = self->states_;
  if (!states) {
LABEL_24:
  }
    JreThrowNullPointerException();
  int v23 = 2 * a3;
  uint64_t size = states->super.size_;
  if (2 * a3 < 0 || v23 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v23);
  }
  if (*(&states->super.size_ + 2 * a3 + 1) != -1)
  {
    CFStringRef v44 = JreStrcat("$I$", v14, v15, v16, v17, v18, v19, v20, @"from state (");
    v43 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v44);
LABEL_35:
    objc_exception_throw(v43);
  }
  v25 = self->states_;
  int v26 = 2 * self->curState_;
  uint64_t v27 = v25->super.size_;
  if (v26 < 0 || v26 >= (int)v27) {
    IOSArray_throwOutOfBoundsWithMsg(v27, v26);
  }
  *(&v25->super.size_ + v26 + 1) = self->nextTransition_;
LABEL_13:
  transitions = self->transitions_;
  if (!transitions) {
    goto LABEL_24;
  }
  int nextTransition = self->nextTransition_;
  self->nextTransition_ = nextTransition + 1;
  uint64_t v30 = transitions->super.size_;
  if (nextTransition < 0 || nextTransition >= (int)v30) {
    IOSArray_throwOutOfBoundsWithMsg(v30, nextTransition);
  }
  *(&transitions->super.size_ + nextTransition + 1) = a4;
  v31 = self->transitions_;
  int v32 = self->nextTransition_;
  self->nextTransition_ = v32 + 1;
  uint64_t v33 = v31->super.size_;
  if (v32 < 0 || v32 >= (int)v33) {
    IOSArray_throwOutOfBoundsWithMsg(v33, v32);
  }
  *(&v31->super.size_ + v32 + 1) = a5;
  v34 = self->transitions_;
  int v35 = self->nextTransition_;
  self->nextTransition_ = v35 + 1;
  uint64_t v36 = v34->super.size_;
  if (v35 < 0 || v35 >= (int)v36) {
    IOSArray_throwOutOfBoundsWithMsg(v36, v35);
  }
  *(&v34->super.size_ + v35 + 1) = a6;
  v37 = self->states_;
  if (!v37) {
    goto LABEL_24;
  }
  int v38 = 2 * self->curState_;
  uint64_t v39 = v38 | 1;
  uint64_t v40 = v37->super.size_;
  if (v38 < 0 || (int)v39 >= (int)v40) {
    IOSArray_throwOutOfBoundsWithMsg(v40, v38 | 1);
  }
  ++*(&v37->super.size_ + v39 + 1);
}

- (unsigned)growTransitions
{
  int v9 = (id *)(a1 + 40);
  int result = *(unsigned int **)(a1 + 40);
  if (!result) {
    JreThrowNullPointerException();
  }
  signed int v10 = *((_DWORD *)v9 - 7) + 3;
  if (v10 >= (int)result[2])
  {
    uint64_t v11 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(result, v10, a3, a4, a5, a6, a7, a8);
    return (unsigned int *)JreStrongAssign(v9, v11);
  }
  return result;
}

- (uint64_t)finishCurrentState
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    goto LABEL_81;
  }
  int v3 = 2 * *(_DWORD *)(a1 + 16);
  uint64_t v4 = v3 | 1;
  uint64_t v5 = *(unsigned int *)(v1 + 8);
  if (v3 < 0 || (int)v4 >= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v5, v3 | 1);
  }
  uint64_t v6 = v1;
  uint64_t v7 = *(unsigned int *)(v1 + 12 + 4 * v4);
  if (v3 < 0 || v3 >= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v5, v3);
  }
  int v8 = *(void **)(a1 + 56);
  if (!v8) {
    goto LABEL_81;
  }
  uint64_t v9 = *(int *)(v6 + 12 + 4 * v3);
  uint64_t v10 = ((int)v9 / 3);
  [v8 sortWithInt:v10 withInt:((int)v9 / 3 + v7)];
  int v77 = v9;
  if ((int)v7 < 1)
  {
    int v11 = 0;
  }
  else
  {
    unsigned int v76 = v10;
    int v11 = 0;
    int v12 = -1;
    int v75 = v7;
    uint64_t v13 = v7;
    uint64_t v14 = v9;
    int v15 = -1;
    int v16 = -1;
    int v17 = v9;
    do
    {
      uint64_t v18 = *(void *)(a1 + 40);
      if (!v18) {
        goto LABEL_81;
      }
      uint64_t v19 = *(unsigned int *)(v18 + 8);
      if ((v14 & 0x80000000) != 0 || (int)v14 >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v14);
      }
      uint64_t v20 = *(void *)(a1 + 40);
      int v21 = *(_DWORD *)(v18 + 12 + 4 * (int)v14);
      int v22 = v14 + 1;
      if ((int)v14 + 1 < 0 || v22 >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v22);
      }
      int v23 = *(_DWORD *)(v20 + 12 + 4 * v22);
      int v24 = v14 + 2;
      if ((int)v14 + 2 < 0 || v24 >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v24);
      }
      uint64_t v25 = (int)v14 + 2;
      int v26 = *(_DWORD *)(v20 + 12 + 4 * v25);
      if (v12 == v21)
      {
        if (v23 <= v15 + 1)
        {
          if (v26 > v15) {
            int v15 = *(_DWORD *)(v20 + 12 + 4 * v25);
          }
        }
        else
        {
          if (v12 != -1)
          {
            uint64_t v27 = *(void *)(a1 + 40);
            uint64_t v28 = *(unsigned int *)(v27 + 8);
            int v29 = 3 * v11 + v17;
            if (v29 < 0 || v29 >= (int)v28) {
              IOSArray_throwOutOfBoundsWithMsg(v28, v29);
            }
            *(_DWORD *)(v27 + 12 + 4 * v29) = v12;
            uint64_t v30 = *(void *)(a1 + 40);
            uint64_t v31 = *(unsigned int *)(v30 + 8);
            int v32 = v29 + 1;
            if (v29 + 1 < 0 || v32 >= (int)v31) {
              IOSArray_throwOutOfBoundsWithMsg(v31, v32);
            }
            *(_DWORD *)(v30 + 12 + 4 * v32) = v16;
            uint64_t v33 = *(void *)(a1 + 40);
            uint64_t v34 = *(unsigned int *)(v33 + 8);
            int v35 = v29 + 2;
            uint64_t v36 = v29 + 2;
            if ((int)v36 < 0 || v35 >= (int)v34) {
              IOSArray_throwOutOfBoundsWithMsg(v34, v35);
            }
            *(_DWORD *)(v33 + 12 + 4 * v36) = v15;
            ++v11;
          }
          int v16 = v23;
          int v15 = v26;
        }
      }
      else
      {
        if (v12 != -1)
        {
          uint64_t v37 = *(void *)(a1 + 40);
          uint64_t v38 = *(unsigned int *)(v37 + 8);
          int v39 = 3 * v11 + v17;
          if (v39 < 0 || v39 >= (int)v38) {
            IOSArray_throwOutOfBoundsWithMsg(v38, v39);
          }
          *(_DWORD *)(v37 + 12 + 4 * v39) = v12;
          uint64_t v40 = *(void *)(a1 + 40);
          uint64_t v41 = *(unsigned int *)(v40 + 8);
          int v42 = v39 + 1;
          if (v39 + 1 < 0 || v42 >= (int)v41) {
            IOSArray_throwOutOfBoundsWithMsg(v41, v42);
          }
          *(_DWORD *)(v40 + 12 + 4 * v42) = v16;
          uint64_t v43 = *(void *)(a1 + 40);
          uint64_t v44 = *(unsigned int *)(v43 + 8);
          int v45 = v39 + 2;
          uint64_t v46 = v39 + 2;
          if ((int)v46 < 0 || v45 >= (int)v44) {
            IOSArray_throwOutOfBoundsWithMsg(v44, v45);
          }
          *(_DWORD *)(v43 + 12 + 4 * v46) = v15;
          ++v11;
        }
        int v16 = v23;
        int v15 = v26;
        int v12 = v21;
      }
      uint64_t v14 = (v14 + 3);
      --v13;
    }
    while (v13);
    if (v12 == -1)
    {
      uint64_t v10 = v76;
    }
    else
    {
      uint64_t v47 = *(void *)(a1 + 40);
      if (!v47) {
        goto LABEL_81;
      }
      uint64_t v48 = *(unsigned int *)(v47 + 8);
      int v49 = 3 * v11 + v17;
      int v50 = v49;
      if (v49 < 0 || v49 >= (int)v48) {
        IOSArray_throwOutOfBoundsWithMsg(v48, v49);
      }
      *(_DWORD *)(v47 + 12 + 4 * v49) = v12;
      uint64_t v51 = *(void *)(a1 + 40);
      uint64_t v52 = *(unsigned int *)(v51 + 8);
      int v53 = v49 + 1;
      if (v50 + 1 < 0 || v53 >= (int)v52) {
        IOSArray_throwOutOfBoundsWithMsg(v52, v53);
      }
      *(_DWORD *)(v51 + 12 + 4 * v53) = v16;
      uint64_t v54 = *(void *)(a1 + 40);
      uint64_t v55 = *(unsigned int *)(v54 + 8);
      int v57 = v50 + 2;
      BOOL v56 = v50 + 2 < 0;
      uint64_t v58 = v50 + 2;
      uint64_t v10 = v76;
      if (v56 || v57 >= (int)v55) {
        IOSArray_throwOutOfBoundsWithMsg(v55, v57);
      }
      *(_DWORD *)(v54 + 12 + 4 * v58) = v15;
      ++v11;
    }
    LODWORD(v7) = v75;
  }
  int v59 = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 12) += -3 * (v7 - v11);
  uint64_t v60 = *(void *)(a1 + 24);
  uint64_t v61 = (2 * v59) | 1;
  uint64_t v62 = *(unsigned int *)(v60 + 8);
  if (2 * v59 < 0 || (int)v61 >= (int)v62) {
    IOSArray_throwOutOfBoundsWithMsg(v62, (2 * v59) | 1);
  }
  *(_DWORD *)(v60 + 12 + 4 * v61) = v11;
  v63 = *(void **)(a1 + 64);
  if (!v63) {
    goto LABEL_81;
  }
  int v64 = v11;
  uint64_t result = (uint64_t)[v63 sortWithInt:v10 withInt:(v11 + v10)];
  if (!*(unsigned char *)(a1 + 48) || v64 < 2) {
    return result;
  }
  uint64_t v66 = *(void *)(a1 + 40);
  if (!v66) {
LABEL_81:
  }
    JreThrowNullPointerException();
  uint64_t v67 = *(unsigned int *)(v66 + 8);
  int v68 = v77 + 2;
  if (v77 + 2 < 0 || v68 >= (int)v67) {
    IOSArray_throwOutOfBoundsWithMsg(v67, v68);
  }
  v69 = (_DWORD *)(v66 + 12 + 4 * (v77 + 2));
  uint64_t v70 = (v77 + 5);
  uint64_t v71 = v64 - 1;
  while (1)
  {
    uint64_t v72 = *(void *)(a1 + 40);
    uint64_t result = *(unsigned int *)(v72 + 8);
    int v73 = v70 - 1;
    if ((int)v70 - 1 < 0 || v73 >= (int)result) {
      IOSArray_throwOutOfBoundsWithMsg(result, v73);
    }
    if (*(_DWORD *)(v72 + 12 + 4 * v73) <= *v69) {
      break;
    }
    uint64_t v74 = *(void *)(a1 + 40);
    uint64_t result = *(unsigned int *)(v74 + 8);
    if ((v70 & 0x80000000) != 0 || (int)v70 >= (int)result) {
      IOSArray_throwOutOfBoundsWithMsg(result, v70);
    }
    v69 = (_DWORD *)(v74 + 12 + 4 * (int)v70);
    uint64_t v70 = (v70 + 3);
    if (!--v71) {
      return result;
    }
  }
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

- (void)addEpsilonWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = new_OrgApacheLuceneUtilAutomatonTransition_init();
  int v8 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self initTransitionWithInt:v4 withOrgApacheLuceneUtilAutomatonTransition:v7];
  if (v8 >= 1)
  {
    int v9 = v8;
    do
    {
      [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:v7];
      [(OrgApacheLuceneUtilAutomatonAutomaton *)self addTransitionWithInt:v5 withInt:v7->dest_ withInt:v7->min_ withInt:v7->max_];
      --v9;
    }
    while (v9);
  }
  if ([(OrgApacheLuceneUtilAutomatonAutomaton *)self isAcceptWithInt:v4])
  {
    [(OrgApacheLuceneUtilAutomatonAutomaton *)self setAcceptWithInt:v5 withBoolean:1];
  }
}

- (void)copy__WithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  unsigned int v5 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNumStates];
  if (!a3) {
    goto LABEL_31;
  }
  unsigned int v12 = v5;
  p_states = &self->states_;
  uint64_t v14 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)self->states_, *((_DWORD *)a3 + 2) + self->nextState_, v6, v7, v8, v9, v10, v11);
  JreStrongAssign((id *)&self->states_, v14);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 3), 0, self->states_, self->nextState_, *((unsigned int *)a3 + 2));
  int v15 = *((_DWORD *)a3 + 2);
  if (v15 >= 1)
  {
    int v16 = 0;
    while (1)
    {
      int v17 = *p_states;
      if (!*p_states) {
        break;
      }
      uint64_t size = v17->super.size_;
      int v19 = v16 + self->nextState_;
      if (v19 < 0 || v19 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v19);
      }
      if (*(&v17->super.size_ + v19 + 1) != -1)
      {
        states = self->states_;
        uint64_t v21 = states->super.size_;
        int v22 = v16 + self->nextState_;
        if (v22 < 0 || v22 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, v22);
        }
        *(&states->super.size_ + v22 + 1) += self->nextTransition_;
      }
      v16 += 2;
      int v15 = *((_DWORD *)a3 + 2);
      if (v16 >= v15) {
        goto LABEL_15;
      }
    }
LABEL_31:
    JreThrowNullPointerException();
  }
LABEL_15:
  self->nextState_ += v15;
  int v23 = [a3 getNumStates];
  id v24 = [a3 getAcceptStates];
  if (v23 >= 1)
  {
    uint64_t v31 = v24;
    if (!v24) {
      goto LABEL_31;
    }
    uint64_t v25 = 0;
    do
    {
      unsigned int v32 = [v31 nextSetBitWithInt:v25];
      if (v32 == -1) {
        break;
      }
      unsigned int v33 = v32;
      [(OrgApacheLuceneUtilAutomatonAutomaton *)self setAcceptWithInt:v32 + v12 withBoolean:1];
      uint64_t v25 = v33 + 1;
    }
    while ((int)v25 < v23);
  }
  p_transitions = &self->transitions_;
  int v35 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)self->transitions_, *((_DWORD *)a3 + 3) + self->nextTransition_, v25, v26, v27, v28, v29, v30);
  JreStrongAssign((id *)&self->transitions_, v35);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 5), 0, self->transitions_, self->nextTransition_, *((unsigned int *)a3 + 3));
  int v36 = *((_DWORD *)a3 + 3);
  if (v36 >= 1)
  {
    for (int i = 0; i < v36; i += 3)
    {
      uint64_t v38 = *p_transitions;
      if (!*p_transitions) {
        goto LABEL_31;
      }
      uint64_t v39 = v38->super.size_;
      int v40 = i + self->nextTransition_;
      if (v40 < 0 || v40 >= (int)v39) {
        IOSArray_throwOutOfBoundsWithMsg(v39, v40);
      }
      *(&v38->super.size_ + v40 + 1) += v12;
      int v36 = *((_DWORD *)a3 + 3);
    }
  }
  self->nextTransition_ += v36;
  if (!*((unsigned char *)a3 + 48)) {
    self->deterministic_ = 0;
  }
}

- (BOOL)isDeterministic
{
  return self->deterministic_;
}

- (void)finishState
{
  if (self->curState_ != -1)
  {
    -[OrgApacheLuceneUtilAutomatonAutomaton finishCurrentState]_0((uint64_t)self);
    self->curState_ = -1;
  }
}

- (int)getNumStates
{
  return self->nextState_ / 2;
}

- (int)getNumTransitions
{
  return self->nextTransition_ / 3;
}

- (int)getNumTransitionsWithInt:(int)a3
{
  states = self->states_;
  if (!states) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (2 * a3) | 1;
  uint64_t size = states->super.size_;
  if (2 * a3 < 0 || (int)v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (2 * a3) | 1);
  }
  if (*(&states->super.size_ + v4 + 1) == -1) {
    return 0;
  }
  else {
    return *(&states->super.size_ + v4 + 1);
  }
}

- (int)initTransitionWithInt:(int)a3 withOrgApacheLuceneUtilAutomatonTransition:(id)a4
{
  if (!a4 || (*((_DWORD *)a4 + 2) = a3, (states = self->states_) == 0)) {
    JreThrowNullPointerException();
  }
  int v6 = 2 * a3;
  uint64_t size = states->super.size_;
  if (2 * a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (2 * a3));
  }
  *((_DWORD *)a4 + 6) = *(&states->super.size_ + v6 + 1);
  return -[OrgApacheLuceneUtilAutomatonAutomaton getNumTransitionsWithInt:](self, "getNumTransitionsWithInt:");
}

- (void)getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:(id)a3
{
  transitions = self->transitions_;
  if (!transitions) {
    JreThrowNullPointerException();
  }
  int v5 = *((_DWORD *)a3 + 6);
  *((_DWORD *)a3 + 6) = v5 + 1;
  uint64_t size = transitions->super.size_;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  *((_DWORD *)a3 + 3) = *(&transitions->super.size_ + v5 + 1);
  uint64_t v7 = self->transitions_;
  int v8 = *((_DWORD *)a3 + 6);
  *((_DWORD *)a3 + 6) = v8 + 1;
  uint64_t v9 = v7->super.size_;
  if (v8 < 0 || v8 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v8);
  }
  *((_DWORD *)a3 + 4) = *(&v7->super.size_ + v8 + 1);
  uint64_t v10 = self->transitions_;
  int v11 = *((_DWORD *)a3 + 6);
  *((_DWORD *)a3 + 6) = v11 + 1;
  uint64_t v12 = v10->super.size_;
  if (v11 < 0 || v11 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v11);
  }
  *((_DWORD *)a3 + 5) = *(&v10->super.size_ + v11 + 1);
}

- (BOOL)transitionSortedWithOrgApacheLuceneUtilAutomatonTransition:(id)a3
{
  if (!a3) {
    goto LABEL_20;
  }
  states = self->states_;
  if (!states) {
    goto LABEL_20;
  }
  uint64_t v5 = *((int *)a3 + 6);
  int v6 = 2 * *((_DWORD *)a3 + 2);
  uint64_t size = states->super.size_;
  if (v6 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  if (v5 == *(&states->super.size_ + v6 + 1)) {
    return 1;
  }
  transitions = self->transitions_;
  if (!transitions) {
LABEL_20:
  }
    JreThrowNullPointerException();
  uint64_t v9 = transitions->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, *((int *)a3 + 6));
  }
  uint64_t v10 = self->transitions_;
  int v11 = *(&transitions->super.size_ + v5 + 1);
  int v12 = v5 + 1;
  if ((int)v5 + 1 < 0 || v12 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v12);
  }
  int v13 = *(&v10->super.size_ + v12 + 1);
  int v14 = v5 + 2;
  uint64_t v15 = (int)v5 + 2;
  if ((int)v15 < 0 || v14 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v14);
  }
  int v16 = *((_DWORD *)a3 + 4);
  if (v13 > v16) {
    return 1;
  }
  if (v13 < v16) {
    return 0;
  }
  int v18 = *(&v10->super.size_ + v15 + 1);
  int v19 = *((_DWORD *)a3 + 5);
  if (v18 > v19) {
    return 1;
  }
  if (v18 < v19) {
    return 0;
  }
  return v11 > *((_DWORD *)a3 + 3);
}

- (void)getTransitionWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonTransition:(id)a5
{
  states = self->states_;
  if (!states) {
    goto LABEL_14;
  }
  int v7 = 2 * a3;
  uint64_t size = states->super.size_;
  if (2 * a3 < 0 || v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  if (!a5
    || (int v9 = *(&states->super.size_ + v7 + 1), *((_DWORD *)a5 + 2) = a3, (transitions = self->transitions_) == 0))
  {
LABEL_14:
    JreThrowNullPointerException();
  }
  uint64_t v11 = (v9 + 3 * a4);
  uint64_t v12 = (v11 + 1);
  uint64_t v13 = transitions->super.size_;
  if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v11);
  }
  *((_DWORD *)a5 + 3) = *(&transitions->super.size_ + (int)v11 + 1);
  int v14 = self->transitions_;
  uint64_t v15 = (v11 + 2);
  uint64_t v16 = v14->super.size_;
  if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v16) {
    IOSArray_throwOutOfBoundsWithMsg(v16, v12);
  }
  *((_DWORD *)a5 + 4) = *(&v14->super.size_ + (int)v12 + 1);
  int v17 = self->transitions_;
  uint64_t v18 = v17->super.size_;
  if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v15);
  }
  *((_DWORD *)a5 + 5) = *(&v17->super.size_ + (int)v15 + 1);
}

+ (void)appendCharStringWithInt:(int)a3 withJavaLangStringBuilder:(id)a4
{
}

- (id)toDot
{
  int v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"digraph Automaton {\n"];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"  rankdir = LR\n"];
  int v18 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNumStates];
  if (v18 >= 1)
  {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@"  initial [shape=plaintext,label=\"0\"]\n"];
    [(JavaLangStringBuilder *)v3 appendWithNSString:@"  initial -> 0\n"];
  }
  uint64_t v4 = new_OrgApacheLuceneUtilAutomatonTransition_init();
  if (v18 >= 1)
  {
    uint64_t v5 = (unsigned int *)v4;
    uint64_t v6 = 0;
    do
    {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@"  "];
      [(JavaLangStringBuilder *)v3 appendWithInt:v6];
      unsigned int v7 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self isAcceptWithInt:v6];
      uint64_t v15 = @" [shape=circle,label=\"";
      if (v7) {
        uint64_t v15 = @" [shape=doublecircle,label=\"";
      }
      [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$I$", v8, v9, v10, v11, v12, v13, v14, v15)];
      int v16 = [(OrgApacheLuceneUtilAutomatonAutomaton *)self initTransitionWithInt:v6 withOrgApacheLuceneUtilAutomatonTransition:v5];
      if (v16 >= 1)
      {
        do
        {
          [(OrgApacheLuceneUtilAutomatonAutomaton *)self getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:v5];
          [(JavaLangStringBuilder *)v3 appendWithNSString:@"  "];
          [(JavaLangStringBuilder *)v3 appendWithInt:v6];
          [(JavaLangStringBuilder *)v3 appendWithNSString:@" -> "];
          [(JavaLangStringBuilder *)v3 appendWithInt:v5[3]];
          [(JavaLangStringBuilder *)v3 appendWithNSString:@" [label=\""];
          OrgApacheLuceneUtilAutomatonAutomaton_appendCharStringWithInt_withJavaLangStringBuilder_(v5[4], v3);
          if (v5[5] != v5[4])
          {
            [(JavaLangStringBuilder *)v3 appendWithChar:45];
            OrgApacheLuceneUtilAutomatonAutomaton_appendCharStringWithInt_withJavaLangStringBuilder_(v5[5], v3);
          }
          [(JavaLangStringBuilder *)v3 appendWithNSString:@"\"]\n"];
          --v16;
        }
        while (v16);
      }
      uint64_t v6 = (v6 + 1);
    }
    while (v6 != v18);
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:125];
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)getStartPoints
{
  int v3 = new_JavaUtilHashSet_init();
  [(JavaUtilHashSet *)v3 addWithId:JavaLangInteger_valueOfWithInt_(0)];
  if (self->nextState_ >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      states = self->states_;
      if (!states) {
LABEL_37:
      }
        JreThrowNullPointerException();
      uint64_t size = states->super.size_;
      if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      int v7 = *(&states->super.size_ + (int)v4 + 1);
      uint64_t v8 = (int)v4 | 1;
      if ((v4 & 0x80000000) != 0 || (int)v8 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, (int)v4 | 1);
      }
      int v9 = 3 * *(&self->states_->super.size_ + v8 + 1) + v7;
      while (v7 < v9)
      {
        transitions = self->transitions_;
        if (!transitions) {
          goto LABEL_37;
        }
        int v11 = v7 + 1;
        uint64_t v12 = transitions->super.size_;
        if (v7 < -1 || v11 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v11);
        }
        int v13 = transitions->buffer_[v7];
        int v14 = v7 + 2;
        if (v7 + 2 < 0 || v14 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v14);
        }
        int v15 = *(&self->transitions_->super.size_ + v14 + 1);
        [(JavaUtilHashSet *)v3 addWithId:JavaLangInteger_valueOfWithInt_(v13)];
        if (v15 <= 1114110) {
          [(JavaUtilHashSet *)v3 addWithId:JavaLangInteger_valueOfWithInt_(v15 + 1)];
        }
        v7 += 3;
      }
      uint64_t v4 = (v4 + 2);
    }
    while ((int)v4 < self->nextState_);
  }
  int v16 = +[IOSIntArray arrayWithLength:[(JavaUtilHashSet *)v3 size]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v17 = [(JavaUtilHashSet *)v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    unint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v3);
        }
        int v22 = *(void **)(*((void *)&v28 + 1) + 8 * v21);
        if (!v22) {
          goto LABEL_37;
        }
        int v23 = v19 + v21;
        unsigned int v24 = [v22 intValue];
        uint64_t v25 = v16->super.size_;
        if (v19 + v21 < 0 || v23 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, v19 + v21);
        }
        *(&v16->super.size_ + v23 + 1) = v24;
        ++v21;
      }
      while (v18 != v21);
      unint64_t v26 = [(JavaUtilHashSet *)v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
      unint64_t v18 = v26;
      uint64_t v19 = (v19 + v21);
    }
    while (v26);
  }
  JavaUtilArrays_sortWithIntArray_(v16);
  return v16;
}

- (int)stepWithInt:(int)a3 withInt:(int)a4
{
  states = self->states_;
  if (!states) {
LABEL_23:
  }
    JreThrowNullPointerException();
  int v6 = 2 * a3;
  uint64_t v7 = 2 * a3;
  uint64_t size = states->super.size_;
  if (2 * a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  int v9 = states;
  uint64_t v10 = *((unsigned int *)&states->super.size_ + v7 + 1);
  uint64_t v11 = v7 | 1;
  if ((v7 & 0x80000000) != 0 || (int)v11 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7 | 1);
  }
  int v12 = 3 * *(&v9->super.size_ + v11 + 1) + v10;
  while ((int)v10 < v12)
  {
    transitions = self->transitions_;
    if (!transitions) {
      goto LABEL_23;
    }
    uint64_t v14 = transitions->super.size_;
    if ((v10 & 0x80000000) != 0 || (int)v10 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v10);
    }
    int v15 = *(&transitions->super.size_ + (int)v10 + 1);
    int v16 = v10 + 1;
    if ((int)v10 < -1 || v16 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v16);
    }
    int v17 = self->transitions_->buffer_[(int)v10];
    int v18 = v10 + 2;
    if ((int)v10 + 2 < 0 || v18 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v18);
    }
    uint64_t v10 = (v10 + 3);
    if (v17 <= a4 && *(&self->transitions_->super.size_ + v18 + 1) >= a4) {
      return v15;
    }
  }
  return -1;
}

- (int64_t)ramBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v3 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  }
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->states_);
  uint64_t v5 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->transitions_);
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  isAccept = self->isAccept_;
  }
  if (!isAccept) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  signed int v8 = [(JavaUtilBitSet *)isAccept size];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v9 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return v3 + v4 + v5 + v7 + v8 / 8 + v9 + 2 * OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + 13;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonAutomaton;
  [(OrgApacheLuceneUtilAutomatonAutomaton *)&v3 dealloc];
}

@end