@interface OrgApacheLuceneUtilFstBuilder
- (BOOL)validOutputWithId:(id)a3;
- (OrgApacheLuceneUtilFstBuilder)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withInt:(int)a8 withOrgApacheLuceneUtilFstOutputs:(id)a9 withBoolean:(BOOL)a10 withFloat:(float)a11 withBoolean:(BOOL)a12 withInt:(int)a13;
- (OrgApacheLuceneUtilFstBuilder)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4;
- (id)compileNodeWithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3 withInt:(int)a4;
- (id)finish;
- (int64_t)fstRamBytesUsed;
- (int64_t)getArcCount;
- (int64_t)getMappedStateCount;
- (int64_t)getNodeCount;
- (int64_t)getTermCount;
- (void)addWithOrgApacheLuceneUtilIntsRef:(id)a3 withId:(id)a4;
- (void)compileAllTargetsWithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3 withInt:(int)a4;
- (void)dealloc;
- (void)freezeTailWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilFstBuilder

- (OrgApacheLuceneUtilFstBuilder)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4
{
  return self;
}

- (OrgApacheLuceneUtilFstBuilder)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withInt:(int)a8 withOrgApacheLuceneUtilFstOutputs:(id)a9 withBoolean:(BOOL)a10 withFloat:(float)a11 withBoolean:(BOOL)a12 withInt:(int)a13
{
  return self;
}

- (int64_t)getTermCount
{
  frontier = self->frontier_;
  if (!frontier) {
    goto LABEL_5;
  }
  uint64_t size = frontier->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  elementType = frontier->elementType_;
  if (!elementType) {
LABEL_5:
  }
    JreThrowNullPointerException();
  return (int64_t)elementType[6].super.isa;
}

- (int64_t)getNodeCount
{
  return self->nodeCount_ + 1;
}

- (int64_t)getArcCount
{
  return self->arcCount_;
}

- (int64_t)getMappedStateCount
{
  if (self->dedupHash_) {
    return self->nodeCount_;
  }
  else {
    return 0;
  }
}

- (id)compileNodeWithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3 withInt:(int)a4
{
  return sub_10013F358((uint64_t)self, (int *)a3, a4);
}

- (void)freezeTailWithInt:(int)a3
{
}

- (void)addWithOrgApacheLuceneUtilIntsRef:(id)a3 withId:(id)a4
{
  if (!a4) {
    goto LABEL_107;
  }
  id NO_OUTPUT = a4;
  v6 = self;
  if ([a4 isEqual:self->NO_OUTPUT_]) {
    id NO_OUTPUT = v6->NO_OUTPUT_;
  }
  if (!a3) {
    goto LABEL_107;
  }
  v89 = v6;
  if (*((_DWORD *)a3 + 5))
  {
    id v93 = NO_OUTPUT;
    uint64_t v7 = *((unsigned int *)a3 + 4);
    int v8 = JavaLangMath_minWithInt_withInt_([(OrgApacheLuceneUtilIntsRefBuilder *)v6->lastInput_ length], *((_DWORD *)a3 + 5));
    frontier = (int *)v6->frontier_;
    p_frontier = (id *)&v6->frontier_;
    if (!frontier) {
      goto LABEL_107;
    }
    uint64_t v16 = 0;
    uint64_t v17 = v8 & ~(v8 >> 31);
    while (1)
    {
      uint64_t v18 = frontier[2];
      if (v16 >= v18) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v16);
      }
      uint64_t v19 = *(void *)&frontier[2 * v16 + 6];
      if (!v19) {
        goto LABEL_107;
      }
      ++*(void *)(v19 + 48);
      if (v17 == v16)
      {
        uint64_t v32 = v17;
        uint64_t v16 = v17;
        goto LABEL_30;
      }
      unsigned int v20 = [(OrgApacheLuceneUtilIntsRefBuilder *)v6->lastInput_ intAtWithInt:v16];
      uint64_t v21 = *((void *)a3 + 1);
      if (!v21) {
        goto LABEL_107;
      }
      unsigned int v22 = v20;
      int v23 = v7 + v16;
      uint64_t v24 = *(unsigned int *)(v21 + 8);
      if (v7 + v16 < 0 || v23 >= (int)v24) {
        IOSArray_throwOutOfBoundsWithMsg(v24, v7 + v16);
      }
      if (v22 != *(_DWORD *)(v21 + 12 + 4 * v23)) {
        break;
      }
      ++v16;
      frontier = (int *)*p_frontier;
      if (!*p_frontier) {
        goto LABEL_107;
      }
    }
    uint64_t v32 = v16;
LABEL_30:
    if (!*p_frontier) {
LABEL_107:
    }
      JreThrowNullPointerException();
    uint64_t v88 = v32;
    int v33 = v32 + 1;
    signed int v34 = *((_DWORD *)a3 + 5) + 1;
    if (*((_DWORD *)*p_frontier + 2) < v34)
    {
      int v35 = v32 + 1;
      if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
      uint64_t v36 = (int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v34, OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_, v9, v10, v11, v12, v13, v14);
      }
      if (qword_1005606D8 != -1) {
        dispatch_once(&qword_1005606D8, &stru_1003F25B8);
      }
      v37 = +[IOSObjectArray arrayWithLength:v36 type:qword_1005606D0];
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*p_frontier, 0, v37, 0, *((unsigned int *)*p_frontier + 2));
      uint64_t v38 = *((int *)*p_frontier + 2);
      if ((int)v38 < v37->super.size_)
      {
        do
        {
          v39 = [OrgApacheLuceneUtilFstBuilder_UnCompiledNode alloc];
          OrgApacheLuceneUtilFstBuilder_UnCompiledNode_initWithOrgApacheLuceneUtilFstBuilder_withInt_((uint64_t)v39, (void **)&v6->super.isa, v38);
          IOSObjectArray_SetAndConsume((uint64_t)v37, v38++, v39);
        }
        while (v38 < v37->super.size_);
      }
      JreStrongAssign(p_frontier, v37);
      int v33 = v35;
    }
    sub_10013F458((uint64_t)v6, v33);
    int v40 = *((_DWORD *)a3 + 5);
    if (v33 <= v40)
    {
      int v91 = v33;
      int v41 = v88;
      do
      {
        int v42 = v41;
        uint64_t v43 = *((unsigned int *)*p_frontier + 2);
        if (v41 < 0 || v41 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, v41);
        }
        v44 = (void *)*((void *)*p_frontier + v41 + 3);
        if (!v44) {
          goto LABEL_107;
        }
        uint64_t v45 = *((void *)a3 + 1);
        if (!v45) {
          goto LABEL_107;
        }
        uint64_t v46 = *(unsigned int *)(v45 + 8);
        int v47 = v41 + *((_DWORD *)a3 + 4);
        if (v47 < 0 || v47 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, v47);
        }
        uint64_t v48 = (v41 + 1);
        uint64_t v49 = *((unsigned int *)*p_frontier + 2);
        if ((v48 & 0x80000000) != 0 || (int)v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v41 + 1));
        }
        objc_msgSend(v44, "addArcWithInt:withOrgApacheLuceneUtilFstBuilder_Node:", *(unsigned int *)(v45 + 12 + 4 * v47), *((void *)*p_frontier + (int)v48 + 3));
        uint64_t v50 = *((unsigned int *)*p_frontier + 2);
        if ((v48 & 0x80000000) != 0 || (int)v48 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, v48);
        }
        uint64_t v51 = *((void *)*p_frontier + (int)v48 + 3);
        if (!v51) {
          goto LABEL_107;
        }
        ++*(void *)(v51 + 48);
        int v40 = *((_DWORD *)a3 + 5);
        ++v41;
      }
      while (v42 + 2 <= v40);
      int v33 = v91;
    }
    uint64_t v52 = *((unsigned int *)*p_frontier + 2);
    if (v40 < 0 || v40 >= (int)v52) {
      IOSArray_throwOutOfBoundsWithMsg(v52, v40);
    }
    uint64_t v53 = *((void *)*p_frontier + v40 + 3);
    unsigned int v54 = [(OrgApacheLuceneUtilIntsRefBuilder *)v6->lastInput_ length];
    int v55 = *((_DWORD *)a3 + 5);
    unsigned int v56 = v88;
    if (v54 != v55 || v88 != v55)
    {
      if (!v53) {
        goto LABEL_107;
      }
      *(unsigned char *)(v53 + 40) = 1;
      JreStrongAssign((id *)(v53 + 32), v6->NO_OUTPUT_);
      unsigned int v56 = v88;
    }
    uint64_t v87 = v53;
    if (v33 >= 2)
    {
      uint64_t v58 = 0;
      uint64_t v90 = v56;
      do
      {
        v59 = *p_frontier;
        uint64_t v60 = *((unsigned int *)*p_frontier + 2);
        if (v58 + 1 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v58 + 1));
        }
        if (v58 + 1 > (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, v58);
        }
        v61 = (void *)v59[v58 + 3];
        if (!v61) {
          goto LABEL_107;
        }
        uint64_t v62 = *((void *)a3 + 1);
        if (!v62) {
          goto LABEL_107;
        }
        v92 = (void *)v59[v58 + 4];
        int v63 = v58 + *((_DWORD *)a3 + 4);
        uint64_t v64 = *(unsigned int *)(v62 + 8);
        if (v63 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, v58 + *((unsigned int *)a3 + 4));
        }
        id v65 = [v61 getLastOutputWithInt:*(unsigned int *)(v62 + 12 + 4 * v63)];
        id v66 = v65;
        if (v65 == v6->NO_OUTPUT_)
        {
          id v69 = v65;
        }
        else
        {
          fst = v6->fst_;
          if (!fst) {
            goto LABEL_107;
          }
          outputs = fst->outputs_;
          if (!outputs) {
            goto LABEL_107;
          }
          id v69 = [(OrgApacheLuceneUtilFstOutputs *)outputs commonWithId:v93 withId:v66];
          id v70 = [(OrgApacheLuceneUtilFstOutputs *)v6->fst_->outputs_ subtractWithId:v66 withId:v69];
          uint64_t v71 = *((void *)a3 + 1);
          uint64_t v72 = v58 + *((unsigned int *)a3 + 4);
          uint64_t v73 = *(unsigned int *)(v71 + 8);
          if ((v72 & 0x80000000) != 0 || (int)v72 >= (int)v73) {
            IOSArray_throwOutOfBoundsWithMsg(v73, v72);
          }
          [v61 setLastOutputWithInt:*(unsigned int *)(v71 + 12 + 4 * (int)v72) withId:v69];
          if (!v92) {
            goto LABEL_107;
          }
          [v92 prependOutputWithId:v70];
          v6 = v89;
        }
        v74 = v6->fst_;
        if (!v74) {
          goto LABEL_107;
        }
        v75 = v74->outputs_;
        if (!v75) {
          goto LABEL_107;
        }
        id v93 = [(OrgApacheLuceneUtilFstOutputs *)v75 subtractWithId:v93 withId:v69];
      }
      while (v90 != ++v58);
    }
    unsigned int v76 = [(OrgApacheLuceneUtilIntsRefBuilder *)v6->lastInput_ length];
    int v77 = *((_DWORD *)a3 + 5);
    if (v76 == v77 && v88 == v77)
    {
      if (!v87) {
        goto LABEL_107;
      }
      v84 = v6->fst_;
      if (!v84) {
        goto LABEL_107;
      }
      v85 = v84->outputs_;
      if (!v85) {
        goto LABEL_107;
      }
      JreStrongAssign((id *)(v87 + 32), [(OrgApacheLuceneUtilFstOutputs *)v85 mergeWithId:*(void *)(v87 + 32) withId:v93]);
    }
    else
    {
      uint64_t v79 = *((unsigned int *)*p_frontier + 2);
      if ((int)v88 >= (int)v79) {
        IOSArray_throwOutOfBoundsWithMsg(v79, v88);
      }
      v80 = (void *)*((void *)*p_frontier + v16 + 3);
      if (!v80) {
        goto LABEL_107;
      }
      uint64_t v81 = *((void *)a3 + 1);
      if (!v81) {
        goto LABEL_107;
      }
      uint64_t v82 = *(unsigned int *)(v81 + 8);
      int v83 = *((_DWORD *)a3 + 4) + v88;
      if (v83 < 0 || v83 >= (int)v82) {
        IOSArray_throwOutOfBoundsWithMsg(v82, v83);
      }
      [v80 setLastOutputWithInt:*(unsigned int *)(v81 + 12 + 4 * v83) withId:v93];
      v6 = v89;
    }
    lastInput = v6->lastInput_;
    [(OrgApacheLuceneUtilIntsRefBuilder *)lastInput copyIntsWithOrgApacheLuceneUtilIntsRef:a3];
  }
  else
  {
    v25 = v6->frontier_;
    if (!v25) {
      goto LABEL_107;
    }
    uint64_t size = v25->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    elementType = v25->elementType_;
    if (!elementType) {
      goto LABEL_107;
    }
    ++elementType[6].super.isa;
    v28 = v6->frontier_;
    uint64_t v29 = v28->super.size_;
    if ((int)v29 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v29, 0);
    }
    v30 = v28->elementType_;
    if (!v30) {
      goto LABEL_107;
    }
    LOBYTE(v30[5].super.isa) = 1;
    v31 = v6->fst_;
    if (!v31) {
      goto LABEL_107;
    }
    [(OrgApacheLuceneUtilFstFST *)v31 setEmptyOutputWithId:NO_OUTPUT];
  }
}

- (BOOL)validOutputWithId:(id)a3
{
  id NO_OUTPUT = self->NO_OUTPUT_;
  if (NO_OUTPUT == a3) {
    return 1;
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 isEqual:NO_OUTPUT] ^ 1;
}

- (id)finish
{
  frontier = self->frontier_;
  if (!frontier) {
    goto LABEL_23;
  }
  uint64_t size = frontier->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  uint64_t elementType = (uint64_t)frontier->elementType_;
  sub_10013F458((uint64_t)self, 0);
  if (!elementType) {
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)(elementType + 48);
  uint64_t minSuffixCount1 = self->minSuffixCount1_;
  if (v6 >= minSuffixCount1
    && (uint64_t minSuffixCount2 = self->minSuffixCount2_, v6 >= minSuffixCount2)
    && *(_DWORD *)(elementType + 16))
  {
    if (minSuffixCount2)
    {
      lastInput = self->lastInput_;
      if (!lastInput) {
        goto LABEL_23;
      }
      sub_100140300(self, elementType, [(OrgApacheLuceneUtilIntsRefBuilder *)lastInput length]);
    }
  }
  else
  {
    fst = self->fst_;
    if (!fst) {
      goto LABEL_23;
    }
    uint64_t v11 = 0;
    if ((int)minSuffixCount1 > 0 || !fst->emptyOutput_) {
      return v11;
    }
    if (self->minSuffixCount2_ > 0) {
      return 0;
    }
  }
  uint64_t v12 = self->fst_;
  if (!v12
    || (uint64_t v13 = self->lastInput_) == 0
    || (uint64_t v14 = sub_10013F358((uint64_t)self, (int *)elementType, [(OrgApacheLuceneUtilIntsRefBuilder *)v13 length])) == 0)
  {
LABEL_23:
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilFstFST *)v12 finishWithLong:v14->node_];
  uint64_t v11 = self->fst_;
  if (!self->doPackFST_) {
    return v11;
  }
  uint64_t v15 = JavaLangMath_maxWithInt_withInt_(10, [(OrgApacheLuceneUtilFstBuilder *)self getNodeCount] / 4);
  *(float *)&double v16 = self->acceptableOverheadRatio_;
  return [(OrgApacheLuceneUtilFstFST *)v11 packWithOrgApacheLuceneUtilFstBuilder:self withInt:3 withInt:v15 withFloat:v16];
}

- (void)compileAllTargetsWithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3 withInt:(int)a4
{
}

- (int64_t)fstRamBytesUsed
{
  fst = self->fst_;
  if (!fst) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilFstFST *)fst ramBytesUsed];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstBuilder;
  [(OrgApacheLuceneUtilFstBuilder *)&v3 dealloc];
}

@end