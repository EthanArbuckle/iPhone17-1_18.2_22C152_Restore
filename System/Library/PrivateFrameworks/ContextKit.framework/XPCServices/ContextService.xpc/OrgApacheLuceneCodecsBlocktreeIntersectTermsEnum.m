@interface OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum
+ (id)brToStringWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (void)initialize;
- (BOOL)acceptsSuffixRangeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (BOOL)setSavedStartTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum)initWithOrgApacheLuceneCodecsBlocktreeFieldReader:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4 withOrgApacheLuceneUtilAutomatonRunAutomaton:(id)a5 withOrgApacheLuceneUtilBytesRef:(id)a6 withOrgApacheLuceneUtilBytesRef:(id)a7 withInt:(int)a8;
- (id)getArcWithInt:(int)a3;
- (id)getFrameWithInt:(int)a3;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)pushFrameWithInt:(int)a3;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (id)termState;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (uint64_t)_next;
- (void)dealloc;
- (void)seekExactWithLong:(int64_t)a3;
- (void)seekToStartTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum

- (OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum)initWithOrgApacheLuceneCodecsBlocktreeFieldReader:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4 withOrgApacheLuceneUtilAutomatonRunAutomaton:(id)a5 withOrgApacheLuceneUtilBytesRef:(id)a6 withOrgApacheLuceneUtilBytesRef:(id)a7 withInt:(int)a8
{
  return self;
}

- (BOOL)setSavedStartTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (a3) {
    v4 = OrgApacheLuceneUtilBytesRef_deepCopyOfWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
  }
  else {
    v4 = 0;
  }
  JreStrongAssign((id *)&self->savedStartTerm_, v4);
  return 1;
}

- (id)termState
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)currentFrame decodeMetaData],
        (termState = self->currentFrame_->termState_) == 0))
  {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermState *)termState clone];
}

- (id)getFrameWithInt:(int)a3
{
  return (id)sub_10013BFC4((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)getArcWithInt:(int)a3
{
  return (id)sub_10013C140((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)pushFrameWithInt:(int)a3
{
  return (id)sub_10013C2B4(self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)term
{
  return self->term_;
}

- (int)docFreq
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)currentFrame decodeMetaData],
        (termState = self->currentFrame_->termState_) == 0))
  {
    JreThrowNullPointerException();
  }
  return termState->docFreq_;
}

- (int64_t)totalTermFreq
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || ([(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)currentFrame decodeMetaData],
        (termState = self->currentFrame_->termState_) == 0))
  {
    JreThrowNullPointerException();
  }
  return termState->totalTermFreq_;
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  currentFrame = self->currentFrame_;
  if (!currentFrame
    || (uint64_t v6 = *(void *)&a4,
        [(OrgApacheLuceneCodecsBlocktreeIntersectTermsEnumFrame *)currentFrame decodeMetaData],
        (fr = self->fr_) == 0)
    || (Weak = objc_loadWeak((id *)&fr->parent_)) == 0
    || (v10 = (void *)Weak[2]) == 0)
  {
    JreThrowNullPointerException();
  }
  fieldInfo = self->fr_->fieldInfo_;
  termState = self->currentFrame_->termState_;
  return [v10 postingsWithOrgApacheLuceneIndexFieldInfo:fieldInfo withOrgApacheLuceneCodecsBlockTermState:termState withOrgApacheLuceneIndexPostingsEnum:a3 withInt:v6];
}

- (void)seekToStartTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  sub_10013C828((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (id)next
{
  return (id)-[OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum _next]_0((uint64_t)self);
}

- (uint64_t)_next
{
  v2 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
  if (*(unsigned char *)(a1 + 120)) {
    unsigned __int8 v3 = sub_10013CF2C(a1);
  }
  else {
    unsigned __int8 v3 = sub_10013CD7C(a1);
  }
  unsigned __int8 v11 = v3;
LABEL_5:
  uint64_t v12 = *(void *)(a1 + 72);
  if (!*(_DWORD *)(v12 + 212))
  {
    uint64_t v30 = *(unsigned int *)(v12 + 48);
    uint64_t v31 = *(unsigned int *)(v12 + 52);
    if (v11) {
      goto LABEL_29;
    }
    goto LABEL_69;
  }
  uint64_t v13 = *(void *)(v12 + 64);
  if (!v13) {
    goto LABEL_107;
  }
  int v14 = *(_DWORD *)(v12 + 208);
  uint64_t v15 = v14;
  uint64_t v16 = *(unsigned int *)(v13 + 8);
  if (v14 < 0 || v14 >= (int)v16) {
    IOSArray_throwOutOfBoundsWithMsg(v16, v14);
  }
  uint64_t v17 = *(void *)(a1 + 80);
  if (!v17) {
    goto LABEL_107;
  }
  int v18 = *(unsigned __int8 *)(v13 + 12 + v15);
  int v19 = *(_DWORD *)(v17 + 16);
  if (v19 > v18)
  {
    while (1)
    {
      v20 = *(_DWORD **)(a1 + 72);
      if (v20[30] >= v20[29]) {
        goto LABEL_84;
      }
      unsigned __int8 v11 = [v20 next];
      int v21 = *(_DWORD *)(*(void *)(a1 + 72) + 208);
      uint64_t v22 = *(unsigned int *)(v13 + 8);
      if (v21 < 0 || v21 >= (int)v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v21);
      }
      if (v19 <= *(unsigned __int8 *)(v13 + 12 + v21)) {
        goto LABEL_5;
      }
    }
  }
  while (1)
  {
    if (*(_DWORD *)(v17 + 20) >= v18)
    {
      uint64_t v40 = *(void *)(a1 + 48);
      if (!((v40 == 0) | v11 & 1))
      {
        v57 = *(int **)(a1 + 72);
        if (!v57) {
          goto LABEL_107;
        }
        uint64_t v58 = v57[28];
        int v59 = v57[53];
        int v60 = *(_DWORD *)(v40 + 20);
        if (v59 + (int)v58 < v60) {
          goto LABEL_84;
        }
        uint64_t v61 = *(void *)(v40 + 8);
        if (v60 - v59 < 1)
        {
          int v86 = 0;
          uint64_t v87 = (v59 - v60 + v57[52]);
        }
        else
        {
          uint64_t v62 = *(void *)(a1 + 88);
          if (!v62) {
            goto LABEL_107;
          }
          uint64_t v63 = 0;
          uint64_t v64 = *(void *)(v62 + 8);
          uint64_t v65 = (int)v58 - (v60 - v59);
          int v66 = v58 + v59 - v60;
          while (1)
          {
            uint64_t v67 = v65 + v63;
            if (v65 + v63 >= v58) {
              break;
            }
            if (!v64) {
              goto LABEL_107;
            }
            uint64_t v68 = *(unsigned int *)(v64 + 8);
            if (v67 < 0 || v67 >= (int)v68) {
              IOSArray_throwOutOfBoundsWithMsg(v68, (v66 + v63));
            }
            if (!v61) {
              goto LABEL_107;
            }
            int v69 = *(unsigned __int8 *)(v64 + v65 + 12 + v63);
            uint64_t v70 = *(unsigned int *)(v61 + 8);
            if ((v63 & 0x80000000) != 0 || (int)v63 >= (int)v70) {
              IOSArray_throwOutOfBoundsWithMsg(v70, v63);
            }
            int v71 = *(unsigned __int8 *)(v61 + 12 + (int)v63++);
            if (v69 != v71)
            {
LABEL_62:
              unsigned __int8 v11 = sub_10013CD7C(a1);
              v2 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
              goto LABEL_5;
            }
          }
          uint64_t v87 = *(unsigned int *)(*(void *)(a1 + 72) + 208);
          int v60 = *(_DWORD *)(*(void *)(a1 + 48) + 20);
          int v86 = v63;
        }
        uint64_t v88 = v86;
        if (v86 > v60) {
          int v60 = v86;
        }
        uint64_t v89 = v60;
        while (v89 != v88)
        {
          uint64_t v90 = *(unsigned int *)(v13 + 8);
          if ((v87 & 0x80000000) != 0 || (int)v87 >= (int)v90) {
            IOSArray_throwOutOfBoundsWithMsg(v90, v87);
          }
          if (!v61) {
            goto LABEL_107;
          }
          int v91 = *(unsigned __int8 *)(v13 + 12 + (int)v87);
          uint64_t v92 = *(unsigned int *)(v61 + 8);
          if (v88 < 0 || v88 >= (int)v92) {
            IOSArray_throwOutOfBoundsWithMsg(v92, v88);
          }
          int v93 = *(unsigned __int8 *)(v61 + 12 + v88++);
          uint64_t v87 = (v87 + 1);
          if (v91 != v93) {
            goto LABEL_62;
          }
        }
      }
      v41 = *(unsigned int **)(a1 + 72);
      if (!v41) {
        goto LABEL_107;
      }
      uint64_t v42 = *(void *)(a1 + 80);
      if (!v42) {
        goto LABEL_107;
      }
      uint64_t v30 = *(unsigned int *)(v42 + 12);
      unsigned int v43 = v41[52];
      unsigned int v44 = v41[53];
      signed int v45 = v44 + v43;
      signed int v46 = v43 + 1;
      if (v46 < v45)
      {
        uint64_t v47 = v46;
        unsigned int v48 = v44 - 1;
        while (1)
        {
          uint64_t v31 = v30;
          if (!*(void *)(a1 + 32)) {
            goto LABEL_107;
          }
          uint64_t v49 = *(unsigned int *)(v13 + 8);
          if (v47 < 0 || v47 >= (int)v49) {
            IOSArray_throwOutOfBoundsWithMsg(v49, v47);
          }
          id v50 = [*(id *)(a1 + 32) stepWithInt:v30 withInt:*(unsigned __int8 *)(v13 + 12 + v47)];
          if (v50 == -1) {
            goto LABEL_62;
          }
          uint64_t v30 = (uint64_t)v50;
          ++v47;
          if (!--v48) {
            goto LABEL_66;
          }
        }
      }
      uint64_t v31 = v41[12];
LABEL_66:
      if (v11)
      {
        v2 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
LABEL_29:
        sub_10013E1E8(a1, v4, v5, v6, v7, v8, v9, v10);
        v38 = (void *)sub_10013C2B4((void *)a1, v30, v32, v33, v34, v35, v36, v37);
        JreStrongAssign((id *)(a1 + 72), v38);
        uint64_t v39 = *(void *)(a1 + 72);
        if (v39)
        {
          JreStrongAssign((id *)(a1 + 80), *(void **)(v39 + 136));
          *(_DWORD *)(*(void *)(a1 + 72) + 52) = v31;
          goto LABEL_84;
        }
        goto LABEL_107;
      }
      uint64_t v12 = *(void *)(a1 + 72);
      v2 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
      if (!v12) {
        goto LABEL_107;
      }
LABEL_69:
      if (!*(unsigned char *)(v12 + 224))
      {
        v76 = *(void **)(a1 + 32);
        if (!v76) {
          goto LABEL_107;
        }
        if (![v76 isAcceptWithInt:v30]) {
          goto LABEL_84;
        }
        sub_10013E1E8(a1, v77, v78, v79, v80, v81, v82, v83);
        return *(void *)(a1 + 88);
      }
      if (!*(unsigned char *)(a1 + 104)) {
        goto LABEL_84;
      }
      uint64_t v72 = *(unsigned int *)(v12 + 220);
      if (v72 == -1)
      {
        BOOL v84 = v30 == *(_DWORD *)(a1 + 108);
      }
      else
      {
        int v73 = *(_DWORD *)(v12 + 216);
        if (v73 == -1)
        {
          v85 = *(void **)(a1 + 40);
          if (!v85) {
            goto LABEL_107;
          }
          if (![v85 isAcceptWithInt:v30])
          {
LABEL_83:
            if (!*(unsigned char *)(a1 + v2[500])) {
              goto LABEL_84;
            }
            sub_10013E1E8(a1, v4, v5, v72, v7, v8, v9, v10);
            uint64_t v95 = *(void *)(*(void *)(a1 + 72) + 168);
            if (v95)
            {
              *(unsigned char *)(v95 + 48) = 0;
              return *(void *)(a1 + 88);
            }
LABEL_107:
            JreThrowNullPointerException();
          }
          LODWORD(v72) = *(_DWORD *)(*(void *)(a1 + 72) + 220);
          uint64_t v74 = a1;
          uint64_t v75 = v30;
          int v73 = 0;
        }
        else
        {
          uint64_t v74 = a1;
          uint64_t v75 = v31;
        }
        BOOL v84 = sub_10013E004(v74, v75, v73, v72);
      }
      *(unsigned char *)(a1 + v2[500]) = v84;
      goto LABEL_83;
    }
    v23 = *(_DWORD **)(a1 + 72);
    int v24 = v23[36];
    if (v24 >= v23[37] - 1) {
      break;
    }
    v23[36] = v24 + 1;
    v25 = *(void **)(a1 + 40);
    if (!v25) {
      goto LABEL_107;
    }
    [v25 getNextTransitionWithOrgApacheLuceneUtilAutomatonTransition:*(void *)(a1 + 80)];
    uint64_t v17 = *(void *)(a1 + 80);
    if (!v17) {
      goto LABEL_107;
    }
    int v26 = *(_DWORD *)(v17 + 16);
    if (v26 > v18)
    {
      while (1)
      {
        v27 = *(_DWORD **)(a1 + 72);
        if (v27[30] >= v27[29]) {
          break;
        }
        unsigned __int8 v11 = [v27 next];
        int v28 = *(_DWORD *)(*(void *)(a1 + 72) + 208);
        uint64_t v29 = *(unsigned int *)(v13 + 8);
        if (v28 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, v28);
        }
        if (v26 <= *(unsigned __int8 *)(v13 + 12 + v28)) {
          goto LABEL_5;
        }
      }
LABEL_84:
      unsigned __int8 v11 = sub_10013CD7C(a1);
      goto LABEL_5;
    }
  }
  v51 = (id *)(a1 + 72);
  int v52 = v23[2];
  if (v52)
  {
    uint64_t v53 = *(void *)(a1 + 24);
    if (v53)
    {
      uint64_t v54 = *(unsigned int *)(v53 + 8);
      int v55 = v52 - 1;
      if (v55 < 0 || v55 >= (int)v54) {
        IOSArray_throwOutOfBoundsWithMsg(v54, v55);
      }
      JreStrongAssign(v51, *(void **)(v53 + 24 + 8 * v55));
      uint64_t v56 = *(void *)(a1 + 72);
      if (v56)
      {
        JreStrongAssign((id *)(a1 + 80), *(void **)(v56 + 136));
        goto LABEL_84;
      }
    }
    goto LABEL_107;
  }
  JreStrongAssign(v51, 0);
  return 0;
}

- (BOOL)acceptsSuffixRangeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_10013E004((uint64_t)self, *(uint64_t *)&a3, a4, a5);
}

+ (id)brToStringWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return (id)OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_brToStringWithOrgApacheLuceneUtilBytesRef_(a3);
}

- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  unsigned __int8 v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (void)seekExactWithLong:(int64_t)a3
{
  unsigned __int8 v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (int64_t)ord
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  unsigned __int8 v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    Singleton = (void *)OrgApacheLuceneUtilFstByteSequenceOutputs_getSingleton();
    JreStrongAssign((id *)&OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_fstOutputs_, Singleton);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum__initialized);
  }
}

@end