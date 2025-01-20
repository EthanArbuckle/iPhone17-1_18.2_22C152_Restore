@interface OrgApacheLuceneUtilFstBuilder_UnCompiledNode
- (BOOL)isCompiled;
- (OrgApacheLuceneUtilFstBuilder_UnCompiledNode)initWithOrgApacheLuceneUtilFstBuilder:(id)a3 withInt:(int)a4;
- (id)getLastOutputWithInt:(int)a3;
- (void)__javaClone;
- (void)addArcWithInt:(int)a3 withOrgApacheLuceneUtilFstBuilder_Node:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)deleteLastWithInt:(int)a3 withOrgApacheLuceneUtilFstBuilder_Node:(id)a4;
- (void)prependOutputWithId:(id)a3;
- (void)replaceLastWithInt:(int)a3 withOrgApacheLuceneUtilFstBuilder_Node:(id)a4 withId:(id)a5 withBoolean:(BOOL)a6;
- (void)setLastOutputWithInt:(int)a3 withId:(id)a4;
@end

@implementation OrgApacheLuceneUtilFstBuilder_UnCompiledNode

- (OrgApacheLuceneUtilFstBuilder_UnCompiledNode)initWithOrgApacheLuceneUtilFstBuilder:(id)a3 withInt:(int)a4
{
  return self;
}

- (BOOL)isCompiled
{
  return 0;
}

- (void)clear
{
  self->numArcs_ = 0;
  self->isFinal_ = 0;
  Weak = (void **)objc_loadWeak((id *)&self->owner_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  JreStrongAssign(&self->output_, Weak[9]);
  self->inputCount_ = 0;
}

- (id)getLastOutputWithInt:(int)a3
{
  arcs = self->arcs_;
  int numArcs = self->numArcs_;
  uint64_t size = arcs->super.size_;
  int v6 = numArcs - 1;
  if (numArcs - 1 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  v7 = (&arcs->elementType_)[v6];
  if (!v7) {
    JreThrowNullPointerException();
  }
  return v7[4].super.isa;
}

- (void)addArcWithInt:(int)a3 withOrgApacheLuceneUtilFstBuilder_Node:(id)a4
{
  p_arcs = &self->arcs_;
  arcs = self->arcs_;
  int numArcs = self->numArcs_;
  if (numArcs == arcs->super.size_)
  {
    unsigned int v14 = numArcs + 1;
    if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    uint64_t v15 = (int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v14, OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
    }
    if (qword_1005606C8 != -1) {
      dispatch_once(&qword_1005606C8, &stru_1003F2598);
    }
    v16 = +[IOSObjectArray arrayWithLength:v15 type:qword_1005606C0];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->arcs_, 0, v16, 0, self->arcs_->super.size_);
    uint64_t v17 = self->numArcs_;
    if ((int)v17 < v16->super.size_)
    {
      do
        IOSObjectArray_SetAndConsume((uint64_t)v16, v17++, [OrgApacheLuceneUtilFstBuilder_Arc alloc]);
      while (v17 < v16->super.size_);
    }
    JreStrongAssign((id *)p_arcs, v16);
    arcs = self->arcs_;
    int numArcs = self->numArcs_;
  }
  self->numArcs_ = numArcs + 1;
  uint64_t size = arcs->super.size_;
  if (numArcs < 0 || numArcs >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, numArcs);
  }
  v19 = (&arcs->elementType_)[numArcs];
  if (!v19
    || (LODWORD(v19[1].super.isa) = a3,
        objc_storeWeak((id *)&v19[2].super.isa, a4),
        (Weak = (void **)objc_loadWeak((id *)&self->owner_)) == 0))
  {
    JreThrowNullPointerException();
  }
  id v21 = JreStrongAssign((id *)&v19[5].super.isa, Weak[9]);
  JreStrongAssign((id *)&v19[4].super.isa, v21);
  LOBYTE(v19[3].super.isa) = 0;
}

- (void)replaceLastWithInt:(int)a3 withOrgApacheLuceneUtilFstBuilder_Node:(id)a4 withId:(id)a5 withBoolean:(BOOL)a6
{
  arcs = self->arcs_;
  if (!arcs) {
    JreThrowNullPointerException();
  }
  int numArcs = self->numArcs_;
  uint64_t size = arcs->super.size_;
  int v11 = numArcs - 1;
  if (numArcs - 1 < 0 || v11 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (numArcs - 1));
  }
  v12 = (&arcs->elementType_)[v11];
  objc_storeWeak((id *)&v12[2].super.isa, a4);
  JreStrongAssign((id *)&v12[5].super.isa, a5);
  LOBYTE(v12[3].super.isa) = a6;
}

- (void)deleteLastWithInt:(int)a3 withOrgApacheLuceneUtilFstBuilder_Node:(id)a4
{
}

- (void)setLastOutputWithInt:(int)a3 withId:(id)a4
{
  arcs = self->arcs_;
  if (!arcs) {
    JreThrowNullPointerException();
  }
  int numArcs = self->numArcs_;
  uint64_t size = arcs->super.size_;
  int v7 = numArcs - 1;
  if (numArcs - 1 < 0 || v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (numArcs - 1));
  }
  p_isa = (id *)&(&arcs->elementType_)[v7][4].super.isa;
  JreStrongAssign(p_isa, a4);
}

- (void)prependOutputWithId:(id)a3
{
  if (self->numArcs_ >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      arcs = self->arcs_;
      if (!arcs) {
        break;
      }
      uint64_t size = arcs->super.size_;
      if ((int)v5 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      v8 = (&arcs->elementType_)[v5];
      if (!v8) {
        break;
      }
      uint64_t v9 = *(objc_loadWeak((id *)&self->owner_) + 1);
      if (!v9) {
        break;
      }
      v10 = *(void **)(v9 + 40);
      if (!v10) {
        break;
      }
      int v11 = self->arcs_;
      uint64_t v12 = v11->super.size_;
      if ((int)v5 >= (int)v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v5);
      }
      v13 = (&v11->elementType_)[v5];
      if (!v13) {
        break;
      }
      JreStrongAssign((id *)&v8[4].super.isa, [v10 addWithId:a3 withId:v13[4].super.isa]);
      if ((int)++v5 >= self->numArcs_) {
        goto LABEL_14;
      }
    }
LABEL_21:
    JreThrowNullPointerException();
  }
LABEL_14:
  if (self->isFinal_)
  {
    uint64_t v14 = *(objc_loadWeak((id *)&self->owner_) + 1);
    if (!v14) {
      goto LABEL_21;
    }
    uint64_t v15 = *(void **)(v14 + 40);
    if (!v15) {
      goto LABEL_21;
    }
    id v16 = [v15 addWithId:a3 withId:self->output_];
    JreStrongAssign(&self->output_, v16);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstBuilder_UnCompiledNode;
  [(OrgApacheLuceneUtilFstBuilder_UnCompiledNode *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstBuilder_UnCompiledNode;
  [(OrgApacheLuceneUtilFstBuilder_UnCompiledNode *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end