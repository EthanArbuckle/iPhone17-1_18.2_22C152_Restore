@interface OrgApacheLuceneUtilAutomatonUTF32ToUTF8
+ (void)initialize;
- (OrgApacheLuceneUtilAutomatonUTF32ToUTF8)init;
- (id)convertWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (void)allWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (void)buildWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a5 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a6 withInt:(int)a7;
- (void)convertOneEdgeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)dealloc;
- (void)endWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)startWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
@end

@implementation OrgApacheLuceneUtilAutomatonUTF32ToUTF8

- (OrgApacheLuceneUtilAutomatonUTF32ToUTF8)init
{
  return self;
}

- (void)convertOneEdgeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  startUTF8 = self->startUTF8_;
  if (!startUTF8
    || (uint64_t v9 = *(void *)&a4,
        v10 = *(void **)&a3,
        sub_100010D44((uint64_t)startUTF8, a5),
        (endUTF8 = self->endUTF8_) == 0))
  {
    JreThrowNullPointerException();
  }
  sub_100010D44((uint64_t)endUTF8, a6);
  v12 = self->startUTF8_;
  v13 = self->endUTF8_;
  sub_10001100C((uint64_t)self, v10, v9, v12, v13, 0);
}

- (void)buildWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a5 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a6 withInt:(int)a7
{
}

- (void)startWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)endWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)allWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
}

- (id)convertWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  if (!a3) {
    goto LABEL_26;
  }
  if (![a3 getNumStates]) {
    return a3;
  }
  v5 = +[IOSIntArray arrayWithLength:](IOSIntArray, "arrayWithLength:", (int)[a3 getNumStates]);
  JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)v5, -1);
  v6 = new_JavaUtilArrayList_init();
  [(JavaUtilArrayList *)v6 addWithId:JavaLangInteger_valueOfWithInt_(0)];
  v7 = new_OrgApacheLuceneUtilAutomatonAutomaton_Builder_init();
  p_utf8 = &self->utf8_;
  JreStrongAssignAndConsume((id *)&self->utf8_, v7);
  uint64_t v8 = [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)self->utf8_ createState];
  -[OrgApacheLuceneUtilAutomatonAutomaton_Builder setAcceptWithInt:withBoolean:](self->utf8_, "setAcceptWithInt:withBoolean:", v8, [a3 isAcceptWithInt:0]);
  uint64_t size = v5->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  *(&v5->super.size_ + 1) = v8;
  v10 = new_OrgApacheLuceneUtilAutomatonTransition_init();
  if ([(JavaUtilArrayList *)v6 size])
  {
    while (1)
    {
      id v11 = [(JavaUtilArrayList *)v6 removeWithInt:[(JavaUtilArrayList *)v6 size] - 1];
      if (!v11) {
        break;
      }
      int v12 = [v11 intValue];
      uint64_t v13 = v12;
      uint64_t v14 = v5->super.size_;
      if (v12 < 0 || v12 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v12);
      }
      unsigned int v24 = *(&v5->super.size_ + v12 + 1);
      int v15 = [a3 getNumTransitionsWithInt:v12];
      [a3 initTransitionWithInt:v13 withOrgApacheLuceneUtilAutomatonTransition:v10];
      if (v15 >= 1)
      {
        do
        {
          [a3 getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:v10];
          int dest = v10->dest_;
          uint64_t v17 = dest;
          uint64_t v18 = v5->super.size_;
          if (dest < 0 || dest >= (int)v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, dest);
          }
          unint64_t v19 = *((unsigned int *)&v5->super.size_ + dest + 1);
          if (v19 == -1)
          {
            unint64_t v19 = [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)*p_utf8 createState];
            -[OrgApacheLuceneUtilAutomatonAutomaton_Builder setAcceptWithInt:withBoolean:](*p_utf8, "setAcceptWithInt:withBoolean:", v19, [a3 isAcceptWithInt:v17]);
            uint64_t v20 = v5->super.size_;
            if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v20) {
              IOSArray_throwOutOfBoundsWithMsg(v20, v17);
            }
            *(&v5->super.size_ + v17 + 1) = v19;
            [(JavaUtilArrayList *)v6 addWithId:JavaLangInteger_valueOfWithInt_(v17)];
          }
          [(OrgApacheLuceneUtilAutomatonUTF32ToUTF8 *)self convertOneEdgeWithInt:v24 withInt:v19 withInt:v10->min_ withInt:v10->max_];
          --v15;
        }
        while (v15);
      }
      if (![(JavaUtilArrayList *)v6 size]) {
        goto LABEL_22;
      }
    }
LABEL_26:
    JreThrowNullPointerException();
  }
LABEL_22:
  v21 = *p_utf8;
  return [(OrgApacheLuceneUtilAutomatonAutomaton_Builder *)v21 finish];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonUTF32ToUTF8;
  [(OrgApacheLuceneUtilAutomatonUTF32ToUTF8 *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    long long v6 = xmmword_10031F340;
    JreStrongAssignAndConsume((id *)&qword_10055FC68, +[IOSIntArray newArrayWithInts:&v6 count:4]);
    long long v5 = xmmword_10031F350;
    JreStrongAssignAndConsume((id *)&qword_10055FC70, +[IOSIntArray newArrayWithInts:&v5 count:4]);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilAutomatonUTF32ToUTF8_MASKS_, +[IOSIntArray newArrayWithLength:32]);
    uint64_t v2 = 0;
    int v3 = 2;
    do
    {
      uint64_t v4 = *(int *)(OrgApacheLuceneUtilAutomatonUTF32ToUTF8_MASKS_ + 8);
      if (v2 >= v4) {
        IOSArray_throwOutOfBoundsWithMsg(v4, v2);
      }
      *(_DWORD *)(OrgApacheLuceneUtilAutomatonUTF32ToUTF8_MASKS_ + 12 + 4 * v2) = v3 - 1;
      v3 *= 2;
      ++v2;
    }
    while (v2 != 32);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilAutomatonUTF32ToUTF8__initialized);
  }
}

@end