@interface OrgApacheLuceneUtilAutomatonCompiledAutomaton
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAutomatonCompiledAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (OrgApacheLuceneUtilAutomatonCompiledAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withJavaLangBoolean:(id)a4 withBoolean:(BOOL)a5;
- (OrgApacheLuceneUtilAutomatonCompiledAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withJavaLangBoolean:(id)a4 withBoolean:(BOOL)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (id)addTailWithInt:(int)a3 withOrgApacheLuceneUtilBytesRefBuilder:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (id)floorWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRefBuilder:(id)a4;
- (id)getTermsEnumWithOrgApacheLuceneIndexTerms:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAutomatonCompiledAutomaton

- (OrgApacheLuceneUtilAutomatonCompiledAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonCompiledAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withJavaLangBoolean:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonCompiledAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withJavaLangBoolean:(id)a4 withBoolean:(BOOL)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
  return self;
}

- (id)addTailWithInt:(int)a3 withOrgApacheLuceneUtilBytesRefBuilder:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_1001098B8((uint64_t)self, *(uint64_t *)&a3, a4, *(uint64_t *)&a5, a6);
}

- (id)getTermsEnumWithOrgApacheLuceneIndexTerms:(id)a3
{
  switch([(JavaLangEnum *)self->type_ ordinal])
  {
    case 0:
      if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      return (id)OrgApacheLuceneIndexTermsEnum_EMPTY_;
    case 1:
      if (!a3) {
        goto LABEL_17;
      }
      id result = [a3 iterator];
      break;
    case 2:
      if (!a3) {
        goto LABEL_17;
      }
      v6 = new_OrgApacheLuceneIndexSingleTermsEnum_initWithOrgApacheLuceneIndexTermsEnum_withOrgApacheLuceneUtilBytesRef_([a3 iterator], self->term_);
      id result = v6;
      break;
    case 3:
      if (!a3) {
LABEL_17:
      }
        JreThrowNullPointerException();
      id result = [a3 intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:self withOrgApacheLuceneUtilBytesRef:0];
      break;
    default:
      v7 = new_JavaLangRuntimeException_initWithNSString_(@"unhandled case");
      objc_exception_throw(v7);
  }
  return result;
}

- (id)floorWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRefBuilder:(id)a4
{
  runAutomaton = self->runAutomaton_;
  if (!runAutomaton) {
    goto LABEL_43;
  }
  id v8 = (id)[(OrgApacheLuceneUtilAutomatonRunAutomaton *)runAutomaton getInitialState];
  if (!a3) {
    goto LABEL_43;
  }
  id v9 = v8;
  if (!*((_DWORD *)a3 + 5))
  {
    if (![(OrgApacheLuceneUtilAutomatonRunAutomaton *)self->runAutomaton_ isAcceptWithInt:v8]) {
      return 0;
    }
    if (a4)
    {
      [a4 clear];
LABEL_37:
      return [a4 get];
    }
    goto LABEL_43;
  }
  v10 = new_JavaUtilArrayList_init();
  uint64_t v11 = *((void *)a3 + 1);
  if (!v11) {
    goto LABEL_43;
  }
  v12 = v10;
  uint64_t v13 = 0;
  while (1)
  {
    uint64_t v14 = *(unsigned int *)(v11 + 8);
    int v15 = v13 + *((_DWORD *)a3 + 4);
    if (v15 < 0 || v15 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v15);
    }
    uint64_t v16 = *(unsigned __int8 *)(v11 + 12 + v15);
    v17 = (void *)[(OrgApacheLuceneUtilAutomatonRunAutomaton *)self->runAutomaton_ stepWithInt:v9 withInt:v16];
    v18 = v17;
    if (v13 == *((_DWORD *)a3 + 5) - 1) {
      break;
    }
    if (v17 == -1) {
      goto LABEL_21;
    }
    if (a4)
    {
      [a4 growWithInt:(v13 + 1)];
      [a4 setByteAtWithInt:v13 withByte:(char)v16];
      [(JavaUtilArrayList *)v12 addWithId:JavaLangInteger_valueOfWithInt_((int)v9)];
      uint64_t v11 = *((void *)a3 + 1);
      uint64_t v13 = (v13 + 1);
      id v9 = v18;
      if (v11) {
        continue;
      }
    }
    goto LABEL_43;
  }
  if (v17 != -1
    && [(OrgApacheLuceneUtilAutomatonRunAutomaton *)self->runAutomaton_ isAcceptWithInt:v17])
  {
    if (a4)
    {
      [a4 growWithInt:(v13 + 1)];
      [a4 setByteAtWithInt:v13 withByte:(char)v16];
      uint64_t v19 = *((unsigned int *)a3 + 5);
      id v20 = a4;
LABEL_36:
      [v20 setLengthWithInt:v19];
      goto LABEL_37;
    }
    goto LABEL_43;
  }
LABEL_21:
  automaton = self->automaton_;
  if (!automaton) {
    goto LABEL_43;
  }
  while (1)
  {
    if (![(OrgApacheLuceneUtilAutomatonAutomaton *)automaton getNumTransitionsWithInt:v9])
    {
LABEL_34:
      if (a4)
      {
        id v20 = a4;
        uint64_t v19 = v13;
        goto LABEL_36;
      }
LABEL_43:
      JreThrowNullPointerException();
    }
    [(OrgApacheLuceneUtilAutomatonAutomaton *)self->automaton_ getTransitionWithInt:v9 withInt:0 withOrgApacheLuceneUtilAutomatonTransition:self->transition_];
    transition = self->transition_;
    if (!transition) {
      goto LABEL_43;
    }
    if ((int)v16 > transition->min_) {
      break;
    }
    if ([(OrgApacheLuceneUtilAutomatonRunAutomaton *)self->runAutomaton_ isAcceptWithInt:v9]) {
      goto LABEL_34;
    }
    if (![(JavaUtilArrayList *)v12 size]) {
      return 0;
    }
    id v23 = [(JavaUtilArrayList *)v12 removeWithInt:[(JavaUtilArrayList *)v12 size] - 1];
    if (v23)
    {
      id v9 = [v23 intValue];
      uint64_t v24 = *((void *)a3 + 1);
      uint64_t v25 = *(unsigned int *)(v24 + 8);
      int v26 = v13 + *((_DWORD *)a3 + 4) - 1;
      if (v26 < 0 || v26 >= (int)v25) {
        IOSArray_throwOutOfBoundsWithMsg(v25, v26);
      }
      LODWORD(v16) = *(unsigned __int8 *)(v24 + 12 + v26);
      automaton = self->automaton_;
      uint64_t v13 = (v13 - 1);
      if (automaton) {
        continue;
      }
    }
    goto LABEL_43;
  }
  return sub_1001098B8((uint64_t)self, (uint64_t)v9, a4, v13, v16);
}

- (unint64_t)hash
{
  runAutomaton = self->runAutomaton_;
  if (runAutomaton) {
    unsigned int v4 = 31 * [(OrgApacheLuceneUtilAutomatonRunAutomaton *)runAutomaton hash] + 961;
  }
  else {
    unsigned int v4 = 961;
  }
  term = self->term_;
  if (term) {
    unsigned int v6 = [(OrgApacheLuceneUtilBytesRef *)term hash];
  }
  else {
    unsigned int v6 = 0;
  }
  type = self->type_;
  if (type) {
    LODWORD(type) = [(JavaLangEnum *)type hash];
  }
  return (int)(type - (v6 + v4) + 32 * (v6 + v4));
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_18;
  }
  if (!a3) {
    goto LABEL_6;
  }
  id v5 = [(OrgApacheLuceneUtilAutomatonCompiledAutomaton *)self getClass];
  if (v5 != [a3 getClass]) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  type = self->type_;
  if (type != *((OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum **)a3 + 1)) {
    goto LABEL_6;
  }
  if ((atomic_load_explicit(OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  if (type != (OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum *)qword_100563938)
  }
  {
    id v8 = self->type_;
    if ((atomic_load_explicit(OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    if (v8 == (OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum *)qword_100563940)
    }
    {
      runAutomaton = self->runAutomaton_;
      if (runAutomaton)
      {
        unsigned int v7 = [(OrgApacheLuceneUtilAutomatonRunAutomaton *)runAutomaton isEqual:*((void *)a3 + 3)];
        if (!v7) {
          return v7;
        }
        goto LABEL_18;
      }
LABEL_20:
      JreThrowNullPointerException();
    }
    goto LABEL_18;
  }
  term = self->term_;
  if (!term) {
    goto LABEL_20;
  }
  if ([(OrgApacheLuceneUtilBytesRef *)term isEqual:*((void *)a3 + 2)])
  {
LABEL_18:
    LOBYTE(v7) = 1;
    return v7;
  }
LABEL_6:
  LOBYTE(v7) = 0;
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonCompiledAutomaton;
  [(OrgApacheLuceneUtilAutomatonCompiledAutomaton *)&v3 dealloc];
}

@end