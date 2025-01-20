@interface CRTTMergeableStringIndex
- (BOOL)isEqual:(id)a3;
- (BOOL)needToFinalizeTimestamps;
- (CRTTMergeableStringIndex)initWithTimestamp:(id)a3 affinity:(unint64_t)a4 renameGeneration:(int64_t)a5;
- (CRTTMergeableStringIndex)initWithTopoID:(TopoID *)a3 affinity:(unint64_t)a4 renameGeneration:(int64_t)a5 maxCounter:(int64_t)a6;
- (TopoID)index;
- (id).cxx_construct;
- (id)_objCRenameSequence;
- (id)description;
- (id)finalizedInContext:(id)a3;
- (id)renamed:(id)a3;
- (id)timestamp;
- (int64_t)maxCounter;
- (int64_t)renameGeneration;
- (unint64_t)affinity;
- (void)dealloc;
- (void)setRenameGeneration:(int64_t)a3;
@end

@implementation CRTTMergeableStringIndex

- (CRTTMergeableStringIndex)initWithTopoID:(TopoID *)a3 affinity:(unint64_t)a4 renameGeneration:(int64_t)a5 maxCounter:(int64_t)a6
{
  v16.receiver = self;
  v16.super_class = (Class)CRTTMergeableStringIndex;
  v10 = [(CRTTMergeableStringIndex *)&v16 init];
  v11 = v10;
  long long v12 = *(_OWORD *)a3->replica.uuid;
  uint64_t v13 = *(void *)&a3->replica.index;
  *(void *)&v10->_index.replica.index = v13;
  *(_OWORD *)v10->_index.replica.uuid = v12;
  v10->_maxCounter = a6;
  v10->_affinity = a4;
  v10->_renameGeneration = a5;
  if (v13)
  {
    v14 = [(CRTTMergeableStringIndex *)v10 _objCRenameSequence];
    +[CRGlobalContextObjC retainObjCSequence:v14];
  }
  return v11;
}

- (CRTTMergeableStringIndex)initWithTimestamp:(id)a3 affinity:(unint64_t)a4 renameGeneration:(int64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v8 = (ObjCTimestamp *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CRTTMergeableStringIndex;
  v9 = [(CRTTMergeableStringIndex *)&v12 init];
  TopoID::TopoID(&v13, v8);
  v9->_index = v13;
  v9->_renameGeneration = a5;
  v9->_maxCounter = -1;
  v9->_affinity = a4;
  if (v9->_index.replica.index)
  {
    v10 = [(CRTTMergeableStringIndex *)v9 _objCRenameSequence];
    +[CRGlobalContextObjC retainObjCSequence:v10];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(CRTTMergeableStringIndex *)self index];
  if (v5)
  {
    v3 = [(CRTTMergeableStringIndex *)self _objCRenameSequence];
    +[CRGlobalContextObjC releaseObjCSequence:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)CRTTMergeableStringIndex;
  [(CRTTMergeableStringIndex *)&v4 dealloc];
}

- (BOOL)needToFinalizeTimestamps
{
  [(CRTTMergeableStringIndex *)self index];
  return v3 != 0;
}

- (id)finalizedInContext:(id)a3
{
  id v4 = a3;
  if ([(CRTTMergeableStringIndex *)self needToFinalizeTimestamps])
  {
    int v5 = [(CRTTMergeableStringIndex *)self _objCRenameSequence];
    uint64_t v6 = +[CRGlobalContextObjC renameObjCSequence:v5 after:self->_maxCounter in:v4];
    v7 = [(CRTTMergeableStringIndex *)self renamed:v6];
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)renamed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CRTTMergeableStringIndex *)self needToFinalizeTimestamps]
    && ((uint64_t v5 = -[CRTTMergeableStringIndex renameGeneration](self, "renameGeneration"), v5 < [v4 generation])|| (objc_msgSend(v4, "hasLocalRenames") & 1) != 0))
  {
    uint64_t v6 = TopoID::objc(&self->_index);
    v7 = [v4 renamed:v6];

    if (v7)
    {
      v8 = [CRTTMergeableStringIndex alloc];
      TopoID::TopoID(&v12, v7);
      v9 = -[CRTTMergeableStringIndex initWithTopoID:affinity:renameGeneration:maxCounter:](v8, "initWithTopoID:affinity:renameGeneration:maxCounter:", &v12, self->_affinity, [v4 generation], self->_maxCounter);
    }
    else
    {
      v9 = self;
    }
    v10 = v9;
  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (id)timestamp
{
  return TopoID::objc(&self->_index);
}

- (id)_objCRenameSequence
{
  int v3 = objc_alloc_init(ObjCRenameSequence);
  id v4 = TopoReplica::objc(&self->_index.replica);
  -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v4, self->_index.clock, 1);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(CRTTMergeableStringIndex *)self index];
    if (v5)
    {
      [v5 index];
      if ((v19 != 0) != (v16 == 0))
      {
LABEL_4:
        [(CRTTMergeableStringIndex *)self index];
        if (v5)
        {
          [v5 index];
          unsigned int v6 = HIDWORD(v16);
        }
        else
        {
          unsigned int v6 = 0;
          *(void *)uu2 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 0;
        }
        BOOL v7 = v19 == __PAIR64__(v6, v16) && uuid_compare(uu1, uu2) == 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else if (!v19)
    {
      goto LABEL_4;
    }
    v8 = +[CRGlobalContextObjC objCRenames];
    v9 = [(CRTTMergeableStringIndex *)self renamed:v8];
    uint64_t v10 = [v5 renamed:v8];
    v11 = (void *)v10;
    if (v9)
    {
      [v9 index];
      if (v11)
      {
LABEL_10:
        [v11 index];
        unsigned int v12 = HIDWORD(v16);
LABEL_13:
        BOOL v7 = v19 == __PAIR64__(v12, v16) && uuid_compare(uu1, uu2) == 0;

        goto LABEL_21;
      }
    }
    else
    {
      *(void *)uu1 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      if (v10) {
        goto LABEL_10;
      }
    }
    unsigned int v12 = 0;
    *(void *)uu2 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  BOOL v7 = 0;
LABEL_22:

  return v7;
}

- (id)description
{
  int v3 = NSString;
  id v4 = TopoID::toString(&self->_index);
  id v5 = [v3 stringWithFormat:@"<CRTTMergeableStringIndex: %p %@ %@>", self, v4, -[CRTTMergeableStringIndex description]::affinityNames[self->_affinity]];

  return v5;
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (int64_t)maxCounter
{
  return self->_maxCounter;
}

- (unint64_t)affinity
{
  return self->_affinity;
}

- (TopoID)index
{
  *retstr = *(TopoID *)((char *)self + 32);
  return self;
}

- (id).cxx_construct
{
  self->_index.replica.index = 0;
  uuid_clear(self->_index.replica.uuid);
  self->_index.clock = 0;
  return self;
}

@end