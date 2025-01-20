@interface CRTTMergeableStringUndoEditCommand
- (BOOL)_applyToString:(id)a3;
- (BOOL)applyToString:(id)a3;
- (BOOL)hasTemporaryIDs;
- (CRContext)context;
- (CRTTMergeableStringUndoEditCommand)init;
- (id)description;
- (id)renamedWith:(id)a3;
- (id)temporaryIDs;
- (void)dealloc;
- (void)deleteRanges;
- (void)insertStrings;
- (void)retainTemporaryIDs;
- (void)setContext:(id)a3;
- (void)updateInsertTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation CRTTMergeableStringUndoEditCommand

- (CRTTMergeableStringUndoEditCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRTTMergeableStringUndoEditCommand;
  if ([(CRTTMergeableStringUndoEditCommand *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3 = [(CRTTMergeableStringUndoEditCommand *)self temporaryIDs];
  +[CRGlobalContextObjC releaseObjCSequence:v3];

  deleteRanges = (void **)self->_deleteRanges;
  if (deleteRanges)
  {
    v5 = *deleteRanges;
    if (*deleteRanges)
    {
      deleteRanges[1] = v5;
      operator delete(v5);
    }
    MEMORY[0x1C8781440](deleteRanges, 0x20C40960023A9);
  }
  insertStrings = self->_insertStrings;
  if (insertStrings)
  {
    v8 = (void **)self->_insertStrings;
    std::vector<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x1C8781440](insertStrings, 0x20C40960023A9);
  }
  v7.receiver = self;
  v7.super_class = (Class)CRTTMergeableStringUndoEditCommand;
  [(CRTTMergeableStringUndoEditCommand *)&v7 dealloc];
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __p = 0;
  v11 = 0;
  uint64_t v12 = 0;
  deleteRanges = (void **)self->_deleteRanges;
  v8 = (unsigned __int8 *)*deleteRanges;
  v9 = (unsigned __int8 *)deleteRanges[1];
  if (*deleteRanges != v9)
  {
    do
    {
      updateTopoIDRange(v8, (uint64_t)a3, (long long *)a4, &__p);
      v8 += 28;
    }
    while (v8 != v9);
    deleteRanges = (void **)self->_deleteRanges;
  }
  if (deleteRanges != &__p) {
    std::vector<TopoIDRange>::__assign_with_size[abi:ne180100]<TopoIDRange*,TopoIDRange*>((char *)deleteRanges, (char *)__p, (uint64_t)v11, 0x6DB6DB6DB6DB6DB7 * ((v11 - (unsigned char *)__p) >> 2));
  }
  v14[0] = *(_OWORD *)a3->charID.replica.uuid;
  *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)&a3->charID.replica.uuid[12];
  v13[0] = *(_OWORD *)a4->charID.replica.uuid;
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)&a4->charID.replica.uuid[12];
  [(CRTTMergeableStringUndoEditCommand *)self updateInsertTopoIDRange:v14 toNewRangeID:v13];
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
}

- (id)temporaryIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(ObjCRenameSequence);
  deleteRanges = (long long **)self->_deleteRanges;
  v5 = *deleteRanges;
  v6 = deleteRanges[1];
  while (v5 != v6)
  {
    long long v7 = *v5;
    *(_OWORD *)&v16[12] = *(long long *)((char *)v5 + 12);
    *(_OWORD *)v16 = v7;
    if (*(_DWORD *)&v16[16])
    {
      v8 = TopoReplica::objc((TopoReplica *)v16);
      -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v8, *(unsigned int *)&v16[20], *(unsigned int *)&v16[24], *(void *)v16, *(void *)&v16[8]);
    }
    v5 = (long long *)((char *)v5 + 28);
  }
  insertStrings = (long long **)self->_insertStrings;
  v10 = *insertStrings;
  v11 = insertStrings[1];
  while (v10 != v11)
  {
    long long v12 = *v10;
    *(_OWORD *)&v16[12] = *(long long *)((char *)v10 + 12);
    *(_OWORD *)v16 = v12;
    id v13 = *((id *)v10 + 4);
    id v17 = v13;
    if (*(_DWORD *)&v16[16])
    {
      v14 = TopoReplica::objc((TopoReplica *)v16);
      -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v14, *(unsigned int *)&v16[20], *(unsigned int *)&v16[24]);

      id v13 = v17;
    }

    v10 = (long long *)((char *)v10 + 40);
  }
  return v3;
}

- (BOOL)hasTemporaryIDs
{
  deleteRanges = (uint64_t *)self->_deleteRanges;
  uint64_t v3 = *deleteRanges;
  uint64_t v4 = deleteRanges[1];
  while (v3 != v4)
  {
    if (*(_DWORD *)(v3 + 16)) {
      return 1;
    }
    v3 += 28;
  }
  insertStrings = (uint64_t *)self->_insertStrings;
  uint64_t v7 = *insertStrings;
  uint64_t v6 = insertStrings[1];
  if (v7 == v6) {
    return 0;
  }
  uint64_t v8 = v7 + 40;
  do
  {
    int v9 = *(_DWORD *)(v8 - 24);
    BOOL result = v9 != 0;
    if (v9) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v8 == v6;
    }
    v8 += 40;
  }
  while (!v11);
  return result;
}

- (void)retainTemporaryIDs
{
  id v2 = [(CRTTMergeableStringUndoEditCommand *)self temporaryIDs];
  +[CRGlobalContextObjC retainObjCSequence:](CRGlobalContextObjC, "retainObjCSequence:");
}

- (void)updateInsertTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  insertStrings = (uint64_t *)self->_insertStrings;
  uint64_t v5 = *insertStrings;
  uint64_t v6 = insertStrings[1];
  if (*insertStrings != v6)
  {
    do
    {
      if (*(_DWORD *)(v5 + 16) == a3->charID.replica.index
        && !uuid_compare((const unsigned __int8 *)v5, a3->charID.replica.uuid)
        && (TopoID::operator<(v5, (uint64_t)a3) & 1) == 0)
      {
        long long v11 = *(_OWORD *)a3->charID.replica.uuid;
        unsigned int v9 = a3->length + a3->charID.clock;
        unsigned int index = a3->charID.replica.index;
        unsigned int v13 = v9;
        if ((TopoID::operator>=((unsigned __int8 *)v5, (unsigned __int8 *)&v11) & 1) == 0)
        {
          long long v10 = *(_OWORD *)a4->charID.replica.uuid;
          *(_DWORD *)(v5 + 16) = a4->charID.replica.index;
          *(_OWORD *)uint64_t v5 = v10;
          *(_DWORD *)(v5 + 20) = *(_DWORD *)(v5 + 20) + a4->charID.clock - a3->charID.clock;
        }
      }
      v5 += 40;
    }
    while (v5 != v6);
  }
}

- (id)renamedWith:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  uint64_t v4 = objc_alloc_init(CRTTMergeableStringUndoEditCommand);
  v76 = self;
  deleteRanges = (long long **)self->_deleteRanges;
  uint64_t v6 = *deleteRanges;
  uint64_t v7 = deleteRanges[1];
  if (*deleteRanges != v7)
  {
    v77 = v87;
    do
    {
      long long v8 = *v6;
      *(_OWORD *)&v90[12] = *(long long *)((char *)v6 + 12);
      *(_OWORD *)v90 = v8;
      if (*(_DWORD *)&v90[16])
      {
        unsigned int v9 = TopoReplica::objc((TopoReplica *)v90);
        long long v10 = objc_msgSend(v78, "renamedWithRange:replica:", *(unsigned int *)&v90[20], *(unsigned int *)&v90[24], v9);
        if ([v10 rangeCount])
        {
          uint64_t v11 = *(unsigned int *)&v90[20];
          uint64_t v12 = *(unsigned int *)&v90[24];
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v87[0] = __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke;
          v87[1] = &unk_1E64C1A08;
          v88 = v4;
          v89[0] = *(_OWORD *)v90;
          *(_OWORD *)((char *)v89 + 12) = *(_OWORD *)&v90[12];
          objc_msgSend(v10, "enumerateRangesIn::", v11, v12, v86);
        }
        else
        {
          uint64_t v18 = [(CRTTMergeableStringUndoEditCommand *)v4 deleteRanges];
          unint64_t v19 = (unint64_t)v18[2];
          v20 = v18[1];
          if ((unint64_t)v20 >= v19)
          {
            uint64_t v28 = 0x6DB6DB6DB6DB6DB7 * (((char *)v20 - (unsigned char *)*v18) >> 2);
            unint64_t v29 = v28 + 1;
            if ((unint64_t)(v28 + 1) > 0x924924924924924) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v30 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v19 - (void)*v18) >> 2);
            if (2 * v30 > v29) {
              unint64_t v29 = 2 * v30;
            }
            if (v30 >= 0x492492492492492) {
              unint64_t v31 = 0x924924924924924;
            }
            else {
              unint64_t v31 = v29;
            }
            if (v31) {
              v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v18 + 2), v31);
            }
            else {
              v32 = 0;
            }
            v39 = &v32[28 * v28];
            long long v40 = *(_OWORD *)v90;
            *(_OWORD *)(v39 + 12) = *(_OWORD *)&v90[12];
            *(_OWORD *)v39 = v40;
            v42 = (char *)*v18;
            v41 = (char *)v18[1];
            v43 = v39;
            if (v41 != *v18)
            {
              do
              {
                long long v44 = *(_OWORD *)(v41 - 28);
                *(v43 - 1) = *((_OWORD *)v41 - 1);
                *(_OWORD *)((char *)v43 - 28) = v44;
                v43 = (_OWORD *)((char *)v43 - 28);
                v41 -= 28;
              }
              while (v41 != v42);
              v41 = (char *)*v18;
            }
            v22 = v39 + 28;
            *uint64_t v18 = v43;
            v18[1] = v39 + 28;
            v18[2] = &v32[28 * v31];
            if (v41) {
              operator delete(v41);
            }
          }
          else
          {
            long long v21 = *(_OWORD *)v90;
            *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)&v90[12];
            _OWORD *v20 = v21;
            v22 = (char *)v20 + 28;
          }
          v18[1] = v22;
        }
      }
      else
      {
        unsigned int v13 = [(CRTTMergeableStringUndoEditCommand *)v4 deleteRanges];
        unint64_t v14 = (unint64_t)v13[2];
        uint64_t v15 = v13[1];
        if ((unint64_t)v15 >= v14)
        {
          uint64_t v23 = 0x6DB6DB6DB6DB6DB7 * (((char *)v15 - (unsigned char *)*v13) >> 2);
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) > 0x924924924924924) {
            std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v25 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v14 - (void)*v13) >> 2);
          if (2 * v25 > v24) {
            unint64_t v24 = 2 * v25;
          }
          if (v25 >= 0x492492492492492) {
            unint64_t v26 = 0x924924924924924;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26) {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v13 + 2), v26);
          }
          else {
            v27 = 0;
          }
          v33 = &v27[28 * v23];
          long long v34 = *(_OWORD *)v90;
          *(_OWORD *)(v33 + 12) = *(_OWORD *)&v90[12];
          *(_OWORD *)v33 = v34;
          v36 = (char *)*v13;
          v35 = (char *)v13[1];
          v37 = v33;
          if (v35 != *v13)
          {
            do
            {
              long long v38 = *(_OWORD *)(v35 - 28);
              *(v37 - 1) = *((_OWORD *)v35 - 1);
              *(_OWORD *)((char *)v37 - 28) = v38;
              v37 = (_OWORD *)((char *)v37 - 28);
              v35 -= 28;
            }
            while (v35 != v36);
            v35 = (char *)*v13;
          }
          id v17 = v33 + 28;
          *unsigned int v13 = v37;
          v13[1] = v33 + 28;
          _OWORD v13[2] = &v27[28 * v26];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          long long v16 = *(_OWORD *)v90;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&v90[12];
          *uint64_t v15 = v16;
          id v17 = (char *)v15 + 28;
        }
        v13[1] = v17;
      }
      uint64_t v6 = (long long *)((char *)v6 + 28);
    }
    while (v6 != v7);
  }
  insertStrings = (long long **)v76->_insertStrings;
  v46 = *insertStrings;
  v47 = insertStrings[1];
  if (*insertStrings != v47)
  {
    do
    {
      long long v48 = *v46;
      *(_OWORD *)&v84[12] = *(long long *)((char *)v46 + 12);
      *(_OWORD *)v84 = v48;
      id v85 = *((id *)v46 + 4);
      if (v85)
      {
        if (*(_DWORD *)&v84[16])
        {
          v49 = TopoReplica::objc((TopoReplica *)v84);
          v50 = objc_msgSend(v78, "renamedWithRange:replica:", *(unsigned int *)&v84[20], *(unsigned int *)&v84[24], v49);
          uint64_t v51 = *(unsigned int *)&v84[20];
          uint64_t v52 = *(unsigned int *)&v84[24];
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3321888768;
          v79[2] = __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke_2;
          v79[3] = &unk_1F1F9E250;
          v80 = v4;
          v82[0] = *(_OWORD *)v84;
          *(_OWORD *)((char *)v82 + 12) = *(_OWORD *)&v84[12];
          id v83 = v85;
          id v53 = v49;
          id v81 = v53;
          objc_msgSend(v50, "enumerateRangesIn::", v51, v52, v79);
        }
        else
        {
          v54 = [(CRTTMergeableStringUndoEditCommand *)v4 insertStrings];
          unint64_t v55 = (unint64_t)v54[2];
          unint64_t v56 = (unint64_t)v54[1];
          if (v56 >= v55)
          {
            unint64_t v59 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v56 - (void)*v54) >> 3);
            unint64_t v60 = v59 + 1;
            if (v59 + 1 > 0x666666666666666) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v61 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v55 - (void)*v54) >> 3);
            if (2 * v61 > v60) {
              unint64_t v60 = 2 * v61;
            }
            if (v61 >= 0x333333333333333) {
              unint64_t v62 = 0x666666666666666;
            }
            else {
              unint64_t v62 = v60;
            }
            v91 = v54 + 2;
            if (v62)
            {
              v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v54 + 2), v62);
              uint64_t v65 = v64;
            }
            else
            {
              v63 = 0;
              uint64_t v65 = 0;
            }
            v66 = &v63[40 * v59];
            long long v67 = *(_OWORD *)v84;
            *(_OWORD *)(v66 + 12) = *(_OWORD *)&v84[12];
            *(_OWORD *)v66 = v67;
            *((void *)v66 + 4) = v85;
            v69 = *v54;
            v68 = v54[1];
            if (v68 == *v54)
            {
              v73 = v54[1];
              v70 = v66;
            }
            else
            {
              v70 = v66;
              do
              {
                long long v71 = *(_OWORD *)(v68 - 40);
                *(_OWORD *)(v70 - 28) = *(_OWORD *)(v68 - 28);
                *(_OWORD *)(v70 - 40) = v71;
                uint64_t v72 = *((void *)v68 - 1);
                *((void *)v68 - 1) = 0;
                *((void *)v70 - 1) = v72;
                v70 -= 40;
                v68 -= 40;
              }
              while (v68 != v69);
              v73 = *v54;
              v68 = v54[1];
            }
            v58 = v66 + 40;
            *v54 = v70;
            *(void *)v90 = v73;
            *(void *)&v90[8] = v73;
            v54[1] = v58;
            *(void *)&v90[16] = v68;
            v74 = v54[2];
            v54[2] = &v63[40 * v65];
            *(void *)&v90[24] = v74;
            std::__split_buffer<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::~__split_buffer((uint64_t)v90);
          }
          else
          {
            long long v57 = *(_OWORD *)v84;
            *(_OWORD *)(v56 + 12) = *(_OWORD *)&v84[12];
            *(_OWORD *)unint64_t v56 = v57;
            *(void *)(v56 + 32) = v85;
            v58 = (char *)(v56 + 40);
          }
          v54[1] = v58;
        }
      }

      v46 = (long long *)((char *)v46 + 40);
    }
    while (v46 != v47);
  }
  [(CRTTMergeableStringUndoEditCommand *)v4 retainTemporaryIDs];

  return v4;
}

uint64_t __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke(uint64_t a1, int a2, int a3, void *a4, uint64_t a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = a4;
  if (a5 < 0)
  {
    long long v36 = *(_OWORD *)(a1 + 40);
    LODWORD(v37) = *(_DWORD *)(a1 + 56);
    long long v10 = (void **)[*(id *)(a1 + 32) deleteRanges];
    unsigned int v13 = (char *)v10[2];
    uint64_t v12 = (char *)v10[1];
    if (v12 < v13)
    {
      *(_OWORD *)uint64_t v12 = v36;
      *((_DWORD *)v12 + 4) = v37;
      *((_DWORD *)v12 + 5) = a2;
      goto LABEL_6;
    }
    uint64_t v20 = 0x6DB6DB6DB6DB6DB7 * ((v12 - (unsigned char *)*v10) >> 2);
    unint64_t v21 = v20 + 1;
    if ((unint64_t)(v20 + 1) > 0x924924924924924) {
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v22 = 0x6DB6DB6DB6DB6DB7 * ((v13 - (unsigned char *)*v10) >> 2);
    if (2 * v22 > v21) {
      unint64_t v21 = 2 * v22;
    }
    if (v22 >= 0x492492492492492) {
      unint64_t v23 = 0x924924924924924;
    }
    else {
      unint64_t v23 = v21;
    }
    if (v23) {
      unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v10 + 2), v23);
    }
    else {
      unint64_t v24 = 0;
    }
    unint64_t v25 = &v24[28 * v20];
    unint64_t v26 = &v24[28 * v23];
    int v30 = v37;
    *(_OWORD *)unint64_t v25 = v36;
    *((_DWORD *)v25 + 4) = v30;
    *((_DWORD *)v25 + 5) = a2;
    *((_DWORD *)v25 + 6) = a3;
    unint64_t v14 = v25 + 28;
    unint64_t v31 = (char *)*v10;
    v27 = (char *)v10[1];
    if (v27 != *v10)
    {
      do
      {
        long long v32 = *(_OWORD *)(v27 - 28);
        *((_OWORD *)v25 - 1) = *((_OWORD *)v27 - 1);
        *(_OWORD *)(v25 - 28) = v32;
        v25 -= 28;
        v27 -= 28;
      }
      while (v27 != v31);
      goto LABEL_30;
    }
  }
  else
  {
    TopoReplica::TopoReplica((TopoReplica *)&v34, v9, 0);
    HIDWORD(v35) = a5;
    long long v36 = v34;
    uint64_t v37 = v35;
    long long v10 = (void **)[*(id *)(a1 + 32) deleteRanges];
    uint64_t v11 = (char *)v10[2];
    uint64_t v12 = (char *)v10[1];
    if (v12 < v11)
    {
      *(_OWORD *)uint64_t v12 = v36;
      *((void *)v12 + 2) = v37;
LABEL_6:
      *((_DWORD *)v12 + 6) = a3;
      unint64_t v14 = v12 + 28;
      goto LABEL_33;
    }
    uint64_t v15 = 0x6DB6DB6DB6DB6DB7 * ((v12 - (unsigned char *)*v10) >> 2);
    unint64_t v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) > 0x924924924924924) {
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v11 - (unsigned char *)*v10) >> 2);
    if (2 * v17 > v16) {
      unint64_t v16 = 2 * v17;
    }
    if (v17 >= 0x492492492492492) {
      unint64_t v18 = 0x924924924924924;
    }
    else {
      unint64_t v18 = v16;
    }
    if (v18) {
      unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v10 + 2), v18);
    }
    else {
      unint64_t v19 = 0;
    }
    unint64_t v25 = &v19[28 * v15];
    unint64_t v26 = &v19[28 * v18];
    *((void *)v25 + 2) = v37;
    *(_OWORD *)unint64_t v25 = v36;
    *((_DWORD *)v25 + 6) = a3;
    unint64_t v14 = v25 + 28;
    uint64_t v28 = (char *)*v10;
    v27 = (char *)v10[1];
    if (v27 != *v10)
    {
      do
      {
        long long v29 = *(_OWORD *)(v27 - 28);
        *((_OWORD *)v25 - 1) = *((_OWORD *)v27 - 1);
        *(_OWORD *)(v25 - 28) = v29;
        v25 -= 28;
        v27 -= 28;
      }
      while (v27 != v28);
LABEL_30:
      v27 = (char *)*v10;
    }
  }
  void *v10 = v25;
  v10[1] = v14;
  v10[2] = v26;
  if (v27) {
    operator delete(v27);
  }
LABEL_33:
  v10[1] = v14;

  return 0;
}

uint64_t __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke_2(id *a1, int a2, int a3, void *a4, uint64_t a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = a4;
  if (a5 < 0)
  {
    unint64_t v26 = [a1[5] uuid];
    TopoReplica::TopoReplica((TopoReplica *)&v41, v26, [a1[5] index]);
    HIDWORD(v42) = a2;
    long long v45 = v41;
    uint64_t v46 = v42;

    long long v10 = (char **)[a1[4] insertStrings];
    id v11 = a1[10];
    unint64_t v27 = (unint64_t)v10[2];
    unint64_t v13 = (unint64_t)v10[1];
    if (v13 >= v27)
    {
      unint64_t v29 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - (void)*v10) >> 3);
      unint64_t v30 = v29 + 1;
      if (v29 + 1 > 0x666666666666666) {
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v31 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v27 - (void)*v10) >> 3);
      if (2 * v31 > v30) {
        unint64_t v30 = 2 * v31;
      }
      if (v31 >= 0x333333333333333) {
        unint64_t v32 = 0x666666666666666;
      }
      else {
        unint64_t v32 = v30;
      }
      long long v40 = v10 + 2;
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v10 + 2), v32);
      uint64_t v20 = &v18[40 * v29];
      *((void *)v20 + 2) = v46;
      *(_OWORD *)uint64_t v20 = v45;
      *((_DWORD *)v20 + 6) = a3;
      *((void *)v20 + 4) = v11;
      v33 = *v10;
      unint64_t v21 = v10[1];
      if (v21 != *v10)
      {
        unint64_t v23 = &v18[40 * v29];
        do
        {
          long long v34 = *(_OWORD *)(v21 - 40);
          *(_OWORD *)(v23 - 28) = *(_OWORD *)(v21 - 28);
          *(_OWORD *)(v23 - 40) = v34;
          uint64_t v35 = *((void *)v21 - 1);
          *((void *)v21 - 1) = 0;
          *((void *)v23 - 1) = v35;
          v23 -= 40;
          v21 -= 40;
        }
        while (v21 != v33);
        goto LABEL_24;
      }
LABEL_25:
      long long v36 = v21;
      unint64_t v23 = v20;
      goto LABEL_26;
    }
  }
  else
  {
    TopoReplica::TopoReplica((TopoReplica *)&v43, v9, 0);
    HIDWORD(v44) = a5;
    long long v45 = v43;
    uint64_t v46 = v44;
    long long v10 = (char **)[a1[4] insertStrings];
    id v11 = a1[10];
    unint64_t v12 = (unint64_t)v10[2];
    unint64_t v13 = (unint64_t)v10[1];
    if (v13 >= v12)
    {
      unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - (void)*v10) >> 3);
      unint64_t v15 = v14 + 1;
      if (v14 + 1 > 0x666666666666666) {
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (void)*v10) >> 3);
      if (2 * v16 > v15) {
        unint64_t v15 = 2 * v16;
      }
      if (v16 >= 0x333333333333333) {
        unint64_t v17 = 0x666666666666666;
      }
      else {
        unint64_t v17 = v15;
      }
      long long v40 = v10 + 2;
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v10 + 2), v17);
      uint64_t v20 = &v18[40 * v14];
      *((void *)v20 + 2) = v46;
      *(_OWORD *)uint64_t v20 = v45;
      *((_DWORD *)v20 + 6) = a3;
      *((void *)v20 + 4) = v11;
      unint64_t v22 = *v10;
      unint64_t v21 = v10[1];
      if (v21 != *v10)
      {
        unint64_t v23 = &v18[40 * v14];
        do
        {
          long long v24 = *(_OWORD *)(v21 - 40);
          *(_OWORD *)(v23 - 28) = *(_OWORD *)(v21 - 28);
          *(_OWORD *)(v23 - 40) = v24;
          uint64_t v25 = *((void *)v21 - 1);
          *((void *)v21 - 1) = 0;
          *((void *)v23 - 1) = v25;
          v23 -= 40;
          v21 -= 40;
        }
        while (v21 != v22);
LABEL_24:
        long long v36 = *v10;
        unint64_t v21 = v10[1];
LABEL_26:
        uint64_t v28 = v20 + 40;
        void *v10 = v23;
        v39[0] = v36;
        v39[1] = v36;
        v10[1] = v20 + 40;
        v39[2] = v21;
        uint64_t v37 = v10[2];
        v10[2] = &v18[40 * v19];
        v39[3] = v37;
        std::__split_buffer<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::~__split_buffer((uint64_t)v39);
        goto LABEL_27;
      }
      goto LABEL_25;
    }
  }
  *(_OWORD *)unint64_t v13 = v45;
  *(void *)(v13 + 16) = v46;
  *(_DWORD *)(v13 + 24) = a3;
  *(void *)(v13 + 32) = v11;
  uint64_t v28 = (char *)(v13 + 40);
LABEL_27:
  v10[1] = v28;

  return 0;
}

- (BOOL)applyToString:(id)a3
{
  id v4 = a3;
  [v4 useRenameIfAvailable];
  uint64_t v5 = +[CRGlobalContextObjC objCRenames];
  [v4 apply:v5 skipRetain:0 alwaysApply:0];
  if ([(CRTTMergeableStringUndoEditCommand *)self hasTemporaryIDs])
  {
    uint64_t v6 = [(CRTTMergeableStringUndoEditCommand *)self renamedWith:v5];
    char v7 = [v6 _applyToString:v4];
  }
  else
  {
    char v7 = [(CRTTMergeableStringUndoEditCommand *)self _applyToString:v4];
  }

  return v7;
}

- (BOOL)_applyToString:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 hasAllIDsIn:self->_insertStrings]) {
    goto LABEL_21;
  }
  deleteRanges = (long long **)self->_deleteRanges;
  if (deleteRanges[1] == *deleteRanges) {
    goto LABEL_20;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __p = 0;
  unint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v6 = *deleteRanges;
  char v7 = deleteRanges[1];
  if (*deleteRanges == v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *((unsigned int *)v6 + 6);
      uint64_t v10 = *((void *)v6 + 2);
      long long v22 = *v6;
      uint64_t v23 = v10;
      int v24 = v9;
      objc_msgSend(v4, "getSubstrings:forTopoIDRange:", &v19, &v22, __p);
      v8 += v9;
      uint64_t v6 = (long long *)((char *)v6 + 28);
    }
    while (v6 != v7);
  }
  [v4 getCharacterRanges:&__p forSubstrings:&v19];
  id v11 = __p;
  if (__p == v17)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v13 = __p;
    do
    {
      v12 += v13[1];
      v13 += 2;
    }
    while (v13 != v17);
  }
  if (v12 == v8)
  {
    [v4 deleteSubstrings:&v19 withCharacterRanges:&__p];
    id v11 = __p;
  }
  if (v11)
  {
    unint64_t v17 = v11;
    operator delete(v11);
  }
  if (v19)
  {
    uint64_t v20 = v19;
    operator delete(v19);
  }
  if (v12 == v8)
  {
LABEL_20:
    objc_msgSend(v4, "undeleteSubstrings:", self->_insertStrings, __p);
    BOOL v14 = 1;
  }
  else
  {
LABEL_21:
    BOOL v14 = 0;
  }
  objc_msgSend(v4, "coalesce", __p);
  if (v14) {
    [v4 updateSubstringIndexes];
  }

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"<CRTTMergeableStringUndoEditCommand %p Delete:", self);
  deleteRanges = (unsigned int **)self->_deleteRanges;
  uint64_t v5 = *deleteRanges;
  uint64_t v6 = deleteRanges[1];
  if (*deleteRanges != v6)
  {
    do
    {
      char v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v5];
      uint64_t v8 = [v7 CRTTShortDescription];
      [v3 appendFormat:@"%@.%d:%d-%u, ", v8, v5[4], v5[5], v5[5] + v5[6] - 1];

      v5 += 7;
    }
    while (v5 != v6);
  }
  [v3 appendFormat:@"  Insert:"];
  insertStrings = (uint64_t *)self->_insertStrings;
  uint64_t v10 = *insertStrings;
  uint64_t v11 = insertStrings[1];
  if (*insertStrings != v11)
  {
    do
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v10];
      unint64_t v13 = [v12 CRTTShortDescription];
      [v3 appendFormat:@"%@.%d:%d-%u=>'%@', ", v13, *(unsigned int *)(v10 + 16), *(unsigned int *)(v10 + 20), (*(_DWORD *)(v10 + 20) + *(_DWORD *)(v10 + 24) - 1), *(void *)(v10 + 32)];

      v10 += 40;
    }
    while (v10 != v11);
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (void)deleteRanges
{
  return self->_deleteRanges;
}

- (void)insertStrings
{
  return self->_insertStrings;
}

- (CRContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (CRContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end