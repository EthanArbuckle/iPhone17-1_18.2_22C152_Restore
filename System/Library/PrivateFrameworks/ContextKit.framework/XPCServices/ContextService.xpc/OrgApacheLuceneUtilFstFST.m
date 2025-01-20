@interface OrgApacheLuceneUtilFstFST
+ (BOOL)targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc:(id)a3;
+ (id)readWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4;
+ (void)initialize;
- (BOOL)assertRootCachedArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4;
- (BOOL)isExpandedTargetWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4;
- (BOOL)shouldExpandWithOrgApacheLuceneUtilFstBuilder:(id)a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a4;
- (NSString)description;
- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4;
- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4 withInt:(int)a5;
- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4 withBoolean:(BOOL)a5 withFloat:(float)a6 withInt:(int)a7;
- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4 withInt:(int)a5;
- (id)findTargetArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_Arc:(id)a5 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a6;
- (id)findTargetArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_Arc:(id)a5 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a6 withBoolean:(BOOL)a7;
- (id)getBytesReader;
- (id)getChildResources;
- (id)getEmptyOutput;
- (id)getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3;
- (id)getInputType;
- (id)packWithOrgApacheLuceneUtilFstBuilder:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6;
- (id)readFirstRealTargetArcWithLong:(int64_t)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5;
- (id)readFirstTargetArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5;
- (id)readLastTargetArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5;
- (id)readNextArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4;
- (id)readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4;
- (int)readLabelWithOrgApacheLuceneStoreDataInput:(id)a3;
- (int)readNextArcLabelWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4;
- (int64_t)addNodeWithOrgApacheLuceneUtilFstBuilder:(id)a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a4;
- (int64_t)getNodeAddressWithLong:(int64_t)a3;
- (int64_t)ramBytesUsed;
- (int64_t)ramBytesUsedWithOrgApacheLuceneUtilFstFST_ArcArray:(id)a3;
- (int64_t)readUnpackedNodeTargetWithOrgApacheLuceneUtilFstFST_BytesReader:(id)a3;
- (uint64_t)cacheRootArcs;
- (void)dealloc;
- (void)finishWithLong:(int64_t)a3;
- (void)saveWithOrgApacheLuceneStoreDataOutput:(id)a3;
- (void)saveWithOrgLukhnosPortmobileFilePath:(id)a3;
- (void)seekToNextNodeWithOrgApacheLuceneUtilFstFST_BytesReader:(id)a3;
- (void)setEmptyOutputWithId:(id)a3;
- (void)writeLabelWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilFstFST

- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4 withBoolean:(BOOL)a5 withFloat:(float)a6 withInt:(int)a7
{
  return self;
}

- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4
{
  return self;
}

- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4 withInt:(int)a5
{
  return self;
}

- (id)getInputType
{
  return self->inputType_;
}

- (int64_t)ramBytesUsedWithOrgApacheLuceneUtilFstFST_ArcArray:(id)a3
{
  return sub_100126F34((uint64_t)self, (uint64_t)a3);
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = qword_1005605D0;
  bytesArray = self->bytesArray_;
  if (bytesArray)
  {
    int64_t size = bytesArray->super.size_;
  }
  else
  {
    bytes = self->bytes_;
    if (!bytes) {
      goto LABEL_13;
    }
    int64_t size = [(OrgApacheLuceneUtilFstBytesStore *)bytes ramBytesUsed];
  }
  v7 = (char *)(size + v3);
  if (self->packed_)
  {
    nodeRefToAddress = self->nodeRefToAddress_;
    if (nodeRefToAddress)
    {
      v9 = (char *)[(OrgApacheLuceneUtilPackedPackedInts_Reader *)nodeRefToAddress ramBytesUsed];
LABEL_11:
      v7 = &v7[(void)v9];
      return (int64_t)&v7[self->cachedArcsBytesUsed_];
    }
    goto LABEL_13;
  }
  nodeAddress = self->nodeAddress_;
  if (nodeAddress)
  {
    int64_t v11 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress ramBytesUsed];
    inCounts = self->inCounts_;
    if (inCounts)
    {
      v9 = &v7[v11];
      v7 = [(OrgApacheLuceneUtilPackedGrowableWriter *)inCounts ramBytesUsed];
      goto LABEL_11;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return (int64_t)&v7[self->cachedArcsBytesUsed_];
}

- (id)getChildResources
{
  v9 = new_JavaUtilArrayList_init();
  if (self->packed_)
  {
    v10 = @"node ref to address";
    uint64_t v11 = 64;
LABEL_5:
    [(JavaUtilArrayList *)v9 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(v10, *(void **)((char *)&self->super.isa + v11), v3, v4, v5, v6, v7, v8)];
    return v9;
  }
  nodeAddress = self->nodeAddress_;
  if (nodeAddress)
  {
    [(JavaUtilArrayList *)v9 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"node addresses", nodeAddress, v3, v4, v5, v6, v7, v8)];
    v10 = @"in counts";
    uint64_t v11 = 88;
    goto LABEL_5;
  }
  return v9;
}

- (NSString)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneUtilFstFST getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$$@$@$Z", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)finishWithLong:(int64_t)a3
{
  if (self->startNode_ != -1)
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"already finished");
    objc_exception_throw(v4);
  }
  if (a3 == -1)
  {
    if (self->emptyOutput_) {
      a3 = 0;
    }
    else {
      a3 = -1;
    }
  }
  self->startNode_ = a3;
  [(OrgApacheLuceneUtilFstBytesStore *)self->bytes_ finish];
  -[OrgApacheLuceneUtilFstFST cacheRootArcs]_0((uint64_t)self);
}

- (uint64_t)cacheRootArcs
{
  id v2 = [OrgApacheLuceneUtilFstFST_Arc alloc];
  objc_msgSend((id)a1, "getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:", v2);
  uint64_t result = OrgApacheLuceneUtilFstFST_targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc_((uint64_t)v2);
  if (result)
  {
    id v4 = [(id)a1 getBytesReader];
    if (qword_100560608 != -1) {
      dispatch_once(&qword_100560608, &stru_1003F2450);
    }
    uint64_t v5 = +[IOSObjectArray arrayWithLength:128 type:qword_100560600];
    objc_opt_class();
    if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    objc_msgSend((id)a1, "readFirstRealTargetArcWithLong:withOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:", v2->target_, v2, v4);
    int label = v2->label_;
    if (label >= v5->super.size_)
    {
      return sub_100126F34(a1, (uint64_t)v5);
    }
    else
    {
      int v7 = 0;
      do
      {
        IOSObjectArray_Set((uint64_t)v5, label, [[OrgApacheLuceneUtilFstFST_Arc alloc] copyFromWithOrgApacheLuceneUtilFstFST_Arc:v2]);
        if ([(OrgApacheLuceneUtilFstFST_Arc *)v2 isLast]) {
          break;
        }
        objc_msgSend((id)a1, "readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:", v2, v4);
        ++v7;
        int label = v2->label_;
      }
      while (label < v5->super.size_);
      uint64_t result = sub_100126F34(a1, (uint64_t)v5);
      if (v7 >= 5)
      {
        int v8 = result;
        uint64_t result = (uint64_t)[(id)a1 ramBytesUsed];
        if (result / 5 > v8)
        {
          uint64_t result = (uint64_t)JreStrongAssign((id *)(a1 + 72), v5);
          *(_DWORD *)(a1 + 100) = v8;
        }
      }
    }
  }
  return result;
}

- (int64_t)getNodeAddressWithLong:(int64_t)a3
{
  nodeAddress = self->nodeAddress_;
  if (nodeAddress) {
    return [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress getWithInt:a3];
  }
  else {
    return a3;
  }
}

- (id)getEmptyOutput
{
  return self->emptyOutput_;
}

- (void)setEmptyOutputWithId:(id)a3
{
  p_emptyOutput = &self->emptyOutput_;
  if (self->emptyOutput_)
  {
    outputs = self->outputs_;
    if (!outputs) {
      JreThrowNullPointerException();
    }
    a3 = -[OrgApacheLuceneUtilFstOutputs mergeWithId:withId:](outputs, "mergeWithId:withId:");
  }
  JreStrongAssign(p_emptyOutput, a3);
}

- (void)saveWithOrgApacheLuceneStoreDataOutput:(id)a3
{
  if (self->startNode_ == -1)
  {
    CFStringRef v25 = @"call finish first";
    goto LABEL_55;
  }
  if (self->nodeAddress_)
  {
    CFStringRef v25 = @"cannot save an FST pre-packed FST; it must first be packed";
    goto LABEL_55;
  }
  if (self->packed_)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFStringRef v25 = @"cannot save a FST which has been loaded from disk ";
LABEL_55:
      v26 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v25);
      objc_exception_throw(v26);
    }
  }
  OrgApacheLuceneCodecsCodecUtil_writeHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_(a3, @"FST", 5);
  if (self->packed_)
  {
    if (!a3) {
      goto LABEL_50;
    }
    uint64_t v5 = 1;
  }
  else
  {
    if (!a3) {
      goto LABEL_50;
    }
    uint64_t v5 = 0;
  }
  [a3 writeByteWithByte:v5];
  if (self->emptyOutput_)
  {
    [a3 writeByteWithByte:1];
    uint64_t v6 = new_OrgApacheLuceneStoreRAMOutputStream_init();
    outputs = self->outputs_;
    if (!outputs) {
      goto LABEL_50;
    }
    [(OrgApacheLuceneUtilFstOutputs *)outputs writeFinalOutputWithId:self->emptyOutput_ withOrgApacheLuceneStoreDataOutput:v6];
    int v8 = +[IOSByteArray arrayWithLength:(int)[(OrgApacheLuceneStoreRAMOutputStream *)v6 getFilePointer]];
    [(OrgApacheLuceneStoreRAMOutputStream *)v6 writeToWithByteArray:v8 withInt:0];
    if (!self->packed_)
    {
      unint64_t size = v8->super.size_;
      if ((int)size >= 2)
      {
        uint64_t v10 = 0;
        unint64_t v11 = size >> 1;
        int v12 = -1;
        do
        {
          uint64_t v13 = v8->super.size_;
          if (v10 >= v13) {
            IOSArray_throwOutOfBoundsWithMsg(v13, v10);
          }
          char v14 = *((unsigned char *)&v8->super.size_ + v10 + 4);
          int v15 = v13 + v12;
          if ((int)v13 + v12 < 0 || v15 >= (int)v13) {
            IOSArray_throwOutOfBoundsWithMsg(v13, v15);
          }
          if (v10 >= (int)v13) {
            IOSArray_throwOutOfBoundsWithMsg(v13, v10);
          }
          *((unsigned char *)&v8->super.size_ + v10 + 4) = *((unsigned char *)&v8->super.size_ + (int)v13 + v12 + 4);
          uint64_t v16 = v8->super.size_;
          int v17 = v12 + v16;
          if (v12 + (int)v16 < 0 || v17 >= (int)v16) {
            IOSArray_throwOutOfBoundsWithMsg(v16, v17);
          }
          *((unsigned char *)&v8->super.size_ + v17 + 4) = v14;
          ++v10;
          --v12;
        }
        while (v11 != v10);
      }
    }
    [a3 writeVIntWithInt:v8->super.size_];
    [a3 writeBytesWithByteArray:v8 withInt:0 withInt:v8->super.size_];
  }
  else
  {
    [a3 writeByteWithByte:0];
  }
  inputType = self->inputType_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (inputType == (OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum *)OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum_values_)
  {
    char v20 = 0;
  }
  else
  {
    v19 = self->inputType_;
    if ((atomic_load_explicit(OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v19 == (OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum *)qword_1005639F8) {
      char v20 = 1;
    }
    else {
      char v20 = 2;
    }
  }
  [a3 writeByteWithByte:v20];
  if (self->packed_)
  {
    nodeRefToAddress = self->nodeRefToAddress_;
    objc_opt_class();
    if (!nodeRefToAddress) {
      goto LABEL_50;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    [(OrgApacheLuceneUtilPackedPackedInts_Reader *)nodeRefToAddress saveWithOrgApacheLuceneStoreDataOutput:a3];
  }
  [a3 writeVLongWithLong:self->startNode_];
  bytes = self->bytes_;
  if (bytes)
  {
    objc_msgSend(a3, "writeVLongWithLong:", -[OrgApacheLuceneUtilFstBytesStore getPosition](bytes, "getPosition"));
    v23 = self->bytes_;
    [(OrgApacheLuceneUtilFstBytesStore *)v23 writeToWithOrgApacheLuceneStoreDataOutput:a3];
    return;
  }
  bytesArray = self->bytesArray_;
  if (!bytesArray) {
LABEL_50:
  }
    JreThrowNullPointerException();
  [a3 writeVLongWithLong:bytesArray->super.size_];
  objc_msgSend(a3, "writeBytesWithByteArray:withInt:withInt:");
}

- (void)saveWithOrgLukhnosPortmobileFilePath:(id)a3
{
  id v4 = OrgLukhnosPortmobileFileFiles_newOutputStreamWithOrgLukhnosPortmobileFilePath_(a3);
  uint64_t v5 = new_JavaIoBufferedOutputStream_initWithJavaIoOutputStream_(v4);
  [(OrgApacheLuceneUtilFstFST *)self saveWithOrgApacheLuceneStoreDataOutput:new_OrgApacheLuceneStoreOutputStreamDataOutput_initWithJavaIoOutputStream_(v5)];
  if (v5) {
    [(JavaIoBufferedOutputStream *)v5 close];
  }
}

+ (id)readWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4
{
  return OrgApacheLuceneUtilFstFST_readWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneUtilFstOutputs_(a3, a4);
}

- (void)writeLabelWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4
{
}

- (int)readLabelWithOrgApacheLuceneStoreDataInput:(id)a3
{
  inputType = self->inputType_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (inputType == (OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum *)OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum_values_)
  {
    if (a3) {
      return [a3 readByte];
    }
    goto LABEL_15;
  }
  uint64_t v6 = self->inputType_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v6 == (OrgApacheLuceneUtilFstFST_INPUT_TYPEEnum *)qword_1005639F8)
  {
    if (a3) {
      return (unsigned __int16)[a3 readShort];
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_15;
  }
  return [a3 readVInt];
}

+ (BOOL)targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc:(id)a3
{
  return OrgApacheLuceneUtilFstFST_targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc_((uint64_t)a3);
}

- (int64_t)addNodeWithOrgApacheLuceneUtilFstBuilder:(id)a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a4
{
  id v4 = self;
  outputs = self->outputs_;
  if (!outputs) {
    goto LABEL_80;
  }
  id v89 = [(OrgApacheLuceneUtilFstOutputs *)outputs getNoOutput];
  if (!a4) {
    goto LABEL_80;
  }
  if (!*((_DWORD *)a4 + 4)) {
    return -(uint64_t)*((char *)a4 + 40);
  }
  if (!a3) {
    goto LABEL_80;
  }
  int v8 = (void *)*((void *)a3 + 7);
  if (!v8) {
    goto LABEL_80;
  }
  v80 = (char *)[v8 getPosition];
  v81 = v4;
  BOOL v87 = sub_1001284FC((uint64_t)a3, (uint64_t)a4);
  if (v87)
  {
    uint64_t v15 = *((void *)a3 + 3);
    if (!v15) {
      goto LABEL_80;
    }
    signed int v16 = *((_DWORD *)a4 + 4);
    if (*(_DWORD *)(v15 + 8) < v16)
    {
      id v17 = +[IOSIntArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v16, 1, v9, v10, v11, v12, v13, v14)];
      JreStrongAssignAndConsume((id *)a3 + 3, v17);
    }
  }
  *((void *)a3 + 4) += *((int *)a4 + 4);
  int v18 = *((_DWORD *)a4 + 4);
  unsigned int v19 = [*((id *)a3 + 7) getPosition];
  if (*((int *)a4 + 4) >= 1)
  {
    unsigned int v82 = v19;
    uint64_t v20 = 0;
    uint64_t v86 = 0;
    int v83 = v18 - 1;
    v84 = (id *)a3;
    v85 = a4;
    while (1)
    {
      uint64_t v21 = *((void *)a4 + 3);
      if (!v21) {
        goto LABEL_80;
      }
      uint64_t v22 = *(unsigned int *)(v21 + 8);
      if ((int)v20 >= (int)v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v20);
      }
      uint64_t v23 = *(void *)(v21 + 24 + 8 * v20);
      if (!v23) {
        goto LABEL_80;
      }
      Weak = objc_loadWeak((id *)(v23 + 16));
      objc_opt_class();
      if (!Weak) {
        goto LABEL_80;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      uint64_t v25 = Weak[1];
      if (v87) {
        char v26 = 2 * (v83 == v20);
      }
      else {
        char v26 = (2 * (v83 == v20)) | 4;
      }
      if (*((void *)a3 + 2) == v25) {
        char v27 = v26;
      }
      else {
        char v27 = 2 * (v83 == v20);
      }
      if (*(unsigned char *)(v23 + 24))
      {
        if (*(id *)(v23 + 40) == v89) {
          char v28 = 1;
        }
        else {
          char v28 = 33;
        }
        v27 |= v28;
      }
      if (v25 <= 0)
      {
        v27 += 8;
        uint64_t v30 = (uint64_t)v4;
      }
      else
      {
        inCounts = v4->inCounts_;
        if (inCounts) {
          [(OrgApacheLuceneUtilPackedGrowableWriter *)inCounts setWithInt:v25 withLong:(char *)[(OrgApacheLuceneUtilPackedGrowableWriter *)inCounts getWithInt:Weak[1]] + 1];
        }
        uint64_t v30 = (uint64_t)v81;
      }
      if (*(id *)(v23 + 32) != v89) {
        v27 += 16;
      }
      a3 = v84;
      [v84[7] writeByteWithByte:v27];
      sub_100127B04(v30, v84[7], *(unsigned int *)(v23 + 8));
      id v4 = (OrgApacheLuceneUtilFstFST *)v30;
      if (*(id *)(v23 + 32) != v89) {
        objc_msgSend(*(id *)(v30 + 40), "writeWithId:withOrgApacheLuceneStoreDataOutput:");
      }
      id v31 = *(id *)(v23 + 40);
      if (v31 != v89) {
        [*(id *)(v30 + 40) writeFinalOutputWithId:v31 withOrgApacheLuceneStoreDataOutput:v84[7]];
      }
      BOOL v32 = v25 >= 1 && (v27 & 4) == 0;
      a4 = v85;
      if (v32) {
        [v84[7] writeVLongWithLong:Weak[1]];
      }
      if (v87)
      {
        unsigned int v33 = [v84[7] getPosition];
        v34 = v84[3];
        if (!v34) {
          goto LABEL_80;
        }
        unsigned int v35 = v33;
        uint64_t v36 = v34[2];
        if ((int)v20 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, v20);
        }
        v34[v20 + 3] = v35 - v82;
        unsigned int v82 = [v84[7] getPosition];
        v37 = v84[3];
        uint64_t v38 = v37[2];
        if ((int)v20 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, v20);
        }
        uint64_t v86 = JavaLangMath_maxWithInt_withInt_(v86, v37[v20 + 3]);
      }
      if ((int)++v20 >= v85[4]) {
        goto LABEL_57;
      }
    }
  }
  uint64_t v86 = 0;
LABEL_57:
  if (v87)
  {
    v88 = +[IOSByteArray arrayWithLength:11];
    v40 = new_OrgApacheLuceneStoreByteArrayDataOutput_initWithByteArray_((uint64_t)v88);
    [(OrgApacheLuceneStoreByteArrayDataOutput *)v40 writeByteWithByte:32];
    [(OrgApacheLuceneStoreDataOutput *)v40 writeVIntWithInt:*((unsigned int *)a4 + 4)];
    [(OrgApacheLuceneStoreDataOutput *)v40 writeVIntWithInt:v86];
    uint64_t v90 = [(OrgApacheLuceneStoreByteArrayDataOutput *)v40 getPosition];
    v41 = (char *)[*((id *)a3 + 7) getPosition];
    int v42 = *((_DWORD *)a4 + 4) * v86;
    v43 = &v80[v90 + v42];
    if ((uint64_t)v43 > (uint64_t)v41)
    {
      v44 = v41;
      [*((id *)a3 + 7) skipBytesWithInt:(v43 - v41)];
      int v45 = *((_DWORD *)a4 + 4);
      uint64_t v46 = (v45 - 1);
      if (v45 - 1 >= 0)
      {
        v47 = &v80[v90 + v42 - (int)v86];
        do
        {
          uint64_t v48 = *((void *)a3 + 3);
          if (!v48) {
            goto LABEL_80;
          }
          uint64_t v49 = *(unsigned int *)(v48 + 8);
          if ((int)v46 >= (int)v49) {
            IOSArray_throwOutOfBoundsWithMsg(v49, v46);
          }
          v44 -= *(int *)(v48 + 12 + 4 * v46);
          if (v47 != v44)
          {
            uint64_t v50 = *((void *)a3 + 3);
            uint64_t v51 = *(unsigned int *)(v50 + 8);
            if ((int)v46 >= (int)v51) {
              IOSArray_throwOutOfBoundsWithMsg(v51, v46);
            }
            [*((id *)a3 + 7) copyBytesWithLong:v44 withLong:v47 withInt:*(unsigned int *)(v50 + 12 + 4 * v46)];
            id v4 = v81;
          }
          --v45;
          --v46;
          v47 -= (int)v86;
        }
        while (v45 > 0);
      }
    }
    [*((id *)a3 + 7) writeBytesWithLong:v80 withByteArray:v88 withInt:0 withInt:v90];
  }
  v39 = (char *)[*((id *)a3 + 7) getPosition] - 1;
  [*((id *)a3 + 7) reverseWithLong:v80 withLong:v39];
  p_nodeAddress = (id *)&v4->nodeAddress_;
  uint64_t v53 = *((void *)a3 + 5);
  if (v4->nodeAddress_ && v53 == 0x7FFFFFFF)
  {
    v79 = new_JavaLangIllegalStateException_initWithNSString_(@"cannot create a packed FST with more than 2.1 billion nodes");
    objc_exception_throw(v79);
  }
  *((void *)a3 + 5) = v53 + 1;
  if (*p_nodeAddress)
  {
    int v54 = *((_DWORD *)a3 + 10);
    if ([*p_nodeAddress size] == v54)
    {
      nodeAddress = v4->nodeAddress_;
      v56 = v4;
      unsigned int v57 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress size] + 1;
      uint64_t v58 = [(OrgApacheLuceneUtilPackedGrowableWriter *)v56->nodeAddress_ getBitsPerValue];
      id v65 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress resizeWithInt:OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v57, v58, v59, v60, v61, v62, v63, v64)];
      JreStrongAssign(p_nodeAddress, v65);
      v68 = v56->inCounts_;
      p_inCounts = (id *)&v56->inCounts_;
      v67 = v68;
      if (!v68) {
        goto LABEL_80;
      }
      unsigned int v69 = [(OrgApacheLuceneUtilPackedGrowableWriter *)v67 size] + 1;
      id v70 = [*p_inCounts getBitsPerValue];
      id v77 = [(OrgApacheLuceneUtilPackedGrowableWriter *)v67 resizeWithInt:OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v69, (uint64_t)v70, v71, v72, v73, v74, v75, v76)];
      JreStrongAssign(p_inCounts, v77);
    }
    if (!*p_nodeAddress) {
LABEL_80:
    }
      JreThrowNullPointerException();
    [*p_nodeAddress setWithInt:*((unsigned int *)a3 + 10) withLong:v39];
    return *((void *)a3 + 5);
  }
  return (int64_t)v39;
}

- (id)getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3
{
  outputs = self->outputs_;
  if (!outputs) {
    goto LABEL_9;
  }
  id v6 = [(OrgApacheLuceneUtilFstOutputs *)outputs getNoOutput];
  if (!self->emptyOutput_)
  {
    if (a3)
    {
      *((unsigned char *)a3 + 40) = 2;
      JreStrongAssign((id *)a3 + 6, v6);
      goto LABEL_8;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_9;
  }
  *((unsigned char *)a3 + 40) = 3;
  JreStrongAssign((id *)a3 + 6, self->emptyOutput_);
  if (self->emptyOutput_ != v6) {
    *((unsigned char *)a3 + 40) |= 0x20u;
  }
LABEL_8:
  JreStrongAssign((id *)a3 + 2, v6);
  *((void *)a3 + 4) = self->startNode_;
  return a3;
}

- (id)readLastTargetArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5
{
  if (!OrgApacheLuceneUtilFstFST_targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc_((uint64_t)a3))
  {
    if (a4)
    {
      *((_DWORD *)a4 + 2) = -1;
      *((void *)a4 + 4) = -1;
      JreStrongAssign((id *)a4 + 2, *((void **)a3 + 6));
      *((unsigned char *)a4 + 40) = 2;
      return a4;
    }
LABEL_32:
    JreThrowNullPointerException();
  }
  if (!a5 || !a3) {
    goto LABEL_32;
  }
  id v9 = (id)*((void *)a3 + 4);
  nodeAddress = self->nodeAddress_;
  if (nodeAddress) {
    id v9 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress getWithInt:v9];
  }
  [a5 setPositionWithLong:v9];
  if (!a4) {
    goto LABEL_32;
  }
  *((void *)a4 + 3) = *((void *)a3 + 4);
  unsigned int v11 = [a5 readByte];
  if (v11 == 32)
  {
    *((_DWORD *)a4 + 20) = [a5 readVInt];
    if (self->packed_ || self->version__ >= 4) {
      unsigned int v12 = [a5 readVInt];
    }
    else {
      unsigned int v12 = [a5 readInt];
    }
    *((_DWORD *)a4 + 18) = v12;
    *((void *)a4 + 8) = [a5 getPosition];
    *((_DWORD *)a4 + 19) = *((_DWORD *)a4 + 20) - 2;
  }
  else
  {
    *((unsigned char *)a4 + 40) = v11;
    *((_DWORD *)a4 + 18) = 0;
    if (([a4 isLast] & 1) == 0)
    {
      do
      {
        [(OrgApacheLuceneUtilFstFST *)self readLabelWithOrgApacheLuceneStoreDataInput:a5];
        if ([a4 flagWithInt:16])
        {
          outputs = self->outputs_;
          if (!outputs) {
            goto LABEL_32;
          }
          [(OrgApacheLuceneUtilFstOutputs *)outputs skipOutputWithOrgApacheLuceneStoreDataInput:a5];
        }
        if ([a4 flagWithInt:32])
        {
          uint64_t v14 = self->outputs_;
          if (!v14) {
            goto LABEL_32;
          }
          [(OrgApacheLuceneUtilFstOutputs *)v14 skipFinalOutputWithOrgApacheLuceneStoreDataInput:a5];
        }
        if (([a4 flagWithInt:8] & 1) == 0
          && ([a4 flagWithInt:4] & 1) == 0)
        {
          if (self->packed_ || self->version__ > 3) {
            [a5 readVLong];
          }
          else {
            [a5 readInt];
          }
        }
        *((unsigned char *)a4 + 40) = [a5 readByte];
      }
      while (![a4 isLast]);
    }
    [a5 skipBytesWithLong:-1];
    *((void *)a4 + 7) = [a5 getPosition];
  }
  [(OrgApacheLuceneUtilFstFST *)self readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:a4 withOrgApacheLuceneUtilFstFST_BytesReader:a5];
  return a4;
}

- (int64_t)readUnpackedNodeTargetWithOrgApacheLuceneUtilFstFST_BytesReader:(id)a3
{
  if (self->version__ <= 3)
  {
    if (a3) {
      return (int)[a3 readInt];
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_8;
  }
  return (int64_t)[a3 readVLong];
}

- (id)readFirstTargetArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5
{
  if (!a3) {
    goto LABEL_11;
  }
  if ([a3 isFinal])
  {
    if (a4)
    {
      *((_DWORD *)a4 + 2) = -1;
      JreStrongAssign((id *)a4 + 2, *((void **)a3 + 6));
      *((unsigned char *)a4 + 40) = 1;
      uint64_t v9 = *((void *)a3 + 4);
      if (v9 <= 0)
      {
        *((unsigned char *)a4 + 40) = 3;
      }
      else
      {
        *((void *)a4 + 3) = v9;
        *((void *)a4 + 7) = *((void *)a3 + 4);
      }
      *((void *)a4 + 4) = -1;
      return a4;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  uint64_t v10 = *((void *)a3 + 4);
  return [(OrgApacheLuceneUtilFstFST *)self readFirstRealTargetArcWithLong:v10 withOrgApacheLuceneUtilFstFST_Arc:a4 withOrgApacheLuceneUtilFstFST_BytesReader:a5];
}

- (id)readFirstRealTargetArcWithLong:(int64_t)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5
{
  nodeAddress = self->nodeAddress_;
  id v10 = (id)a3;
  if (nodeAddress) {
    id v10 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress getWithInt:a3];
  }
  if (!a5 || ([a5 setPositionWithLong:v10], !a4)) {
    JreThrowNullPointerException();
  }
  *((void *)a4 + 3) = a3;
  if ([a5 readByte] == 32)
  {
    *((_DWORD *)a4 + 20) = [a5 readVInt];
    if (self->packed_ || self->version__ >= 4) {
      unsigned int v11 = [a5 readVInt];
    }
    else {
      unsigned int v11 = [a5 readInt];
    }
    *((_DWORD *)a4 + 18) = v11;
    *((_DWORD *)a4 + 19) = -1;
    id v12 = [a5 getPosition];
    *((void *)a4 + 7) = v12;
    *((void *)a4 + 8) = v12;
  }
  else
  {
    *((void *)a4 + 7) = v10;
    *((_DWORD *)a4 + 18) = 0;
  }
  return [(OrgApacheLuceneUtilFstFST *)self readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:a4 withOrgApacheLuceneUtilFstFST_BytesReader:a5];
}

- (BOOL)isExpandedTargetWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4
{
  BOOL HasArcsWithOrgApacheLuceneUtilFstFST_Arc = OrgApacheLuceneUtilFstFST_targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc_((uint64_t)a3);
  if (HasArcsWithOrgApacheLuceneUtilFstFST_Arc)
  {
    if (!a4 || !a3) {
      JreThrowNullPointerException();
    }
    id v8 = (id)*((void *)a3 + 4);
    nodeAddress = self->nodeAddress_;
    if (nodeAddress) {
      id v8 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress getWithInt:v8];
    }
    [a4 setPositionWithLong:v8];
    LOBYTE(HasArcsWithOrgApacheLuceneUtilFstFST_Arc) = [a4 readByte] == 32;
  }
  return HasArcsWithOrgApacheLuceneUtilFstFST_Arc;
}

- (id)readNextArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (*((_DWORD *)a3 + 2) == -1)
  {
    if (*((uint64_t *)a3 + 7) <= 0)
    {
      uint64_t v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"cannot readNextArc when arc.isLast()=true");
      objc_exception_throw(v5);
    }
    return -[OrgApacheLuceneUtilFstFST readFirstRealTargetArcWithLong:withOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:](self, "readFirstRealTargetArcWithLong:withOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:");
  }
  else
  {
    return -[OrgApacheLuceneUtilFstFST readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:](self, "readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:");
  }
}

- (int)readNextArcLabelWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4
{
  if (*((_DWORD *)a3 + 2) == -1)
  {
    id v7 = (id)*((void *)a3 + 7);
    nodeAddress = self->nodeAddress_;
    if (nodeAddress) {
      id v7 = [(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress getWithInt:v7];
    }
    if (!a4) {
      goto LABEL_20;
    }
    [a4 setPositionWithLong:v7];
    if ([a4 readByte] == 32)
    {
      [a4 readVInt];
      if (self->packed_ || self->version__ >= 4) {
        [a4 readVInt];
      }
      else {
        [a4 readInt];
      }
      goto LABEL_16;
    }
    id v10 = a4;
    id v9 = v7;
  }
  else
  {
    if (*((_DWORD *)a3 + 18))
    {
      if (a4)
      {
        [a4 setPositionWithLong:*((void *)a3 + 8)];
        [a4 skipBytesWithLong:*((_DWORD *)a3 + 18) + *((_DWORD *)a3 + 18) * *((_DWORD *)a3 + 19)];
        goto LABEL_16;
      }
LABEL_20:
      JreThrowNullPointerException();
    }
    if (!a4) {
      goto LABEL_20;
    }
    id v9 = (id)*((void *)a3 + 7);
    id v10 = a4;
  }
  [v10 setPositionWithLong:v9];
LABEL_16:
  [a4 readByte];
  return [(OrgApacheLuceneUtilFstFST *)self readLabelWithOrgApacheLuceneStoreDataInput:a4];
}

- (id)readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4
{
  if (!a3) {
    goto LABEL_41;
  }
  if (*((_DWORD *)a3 + 18))
  {
    ++*((_DWORD *)a3 + 19);
    if (!a4) {
      goto LABEL_41;
    }
    [a4 setPositionWithLong:*((void *)a3 + 8)];
    [a4 skipBytesWithLong:*((_DWORD *)a3 + 18) * *((_DWORD *)a3 + 19)];
  }
  else
  {
    if (!a4) {
      goto LABEL_41;
    }
    [a4 setPositionWithLong:*((void *)a3 + 7)];
  }
  *((unsigned char *)a3 + 40) = [a4 readByte];
  *((_DWORD *)a3 + 2) = [(OrgApacheLuceneUtilFstFST *)self readLabelWithOrgApacheLuceneStoreDataInput:a4];
  unsigned int v7 = [a3 flagWithInt:16];
  outputs = self->outputs_;
  if (v7)
  {
    if (!outputs) {
      goto LABEL_41;
    }
    id v9 = (id *)((char *)a3 + 16);
    id v10 = [(OrgApacheLuceneUtilFstOutputs *)outputs readWithOrgApacheLuceneStoreDataInput:a4];
  }
  else
  {
    if (!outputs) {
      goto LABEL_41;
    }
    id v9 = (id *)((char *)a3 + 16);
    id v10 = [(OrgApacheLuceneUtilFstOutputs *)outputs getNoOutput];
  }
  JreStrongAssign(v9, v10);
  unsigned int v11 = [a3 flagWithInt:32];
  id v12 = self->outputs_;
  if (v11)
  {
    if (!v12) {
      goto LABEL_41;
    }
    uint64_t v13 = (id *)((char *)a3 + 48);
    id v14 = [(OrgApacheLuceneUtilFstOutputs *)v12 readFinalOutputWithOrgApacheLuceneStoreDataInput:a4];
  }
  else
  {
    if (!v12) {
      goto LABEL_41;
    }
    uint64_t v13 = (id *)((char *)a3 + 48);
    id v14 = [(OrgApacheLuceneUtilFstOutputs *)v12 getNoOutput];
  }
  JreStrongAssign(v13, v14);
  if ([a3 flagWithInt:8])
  {
    *((void *)a3 + 4) = (uint64_t)((void)[a3 flagWithInt:1] << 63) >> 63;
LABEL_36:
    id v15 = [a4 getPosition];
    uint64_t v20 = 56;
    goto LABEL_40;
  }
  if (![a3 flagWithInt:4])
  {
    if (!self->packed_)
    {
      if (self->version__ <= 3)
      {
        uint64_t v17 = (int)[a4 readInt];
        goto LABEL_35;
      }
      id v19 = [a4 readVLong];
LABEL_34:
      uint64_t v17 = (uint64_t)v19;
      goto LABEL_35;
    }
    id v16 = [a4 getPosition];
    uint64_t v17 = (uint64_t)[a4 readVLong];
    if ([a3 flagWithInt:64])
    {
      v17 += (uint64_t)v16;
LABEL_35:
      *((void *)a3 + 4) = v17;
      goto LABEL_36;
    }
    nodeRefToAddress = self->nodeRefToAddress_;
    if (nodeRefToAddress)
    {
      if (v17 >= (int)[(OrgApacheLuceneUtilPackedPackedInts_Reader *)nodeRefToAddress size]) {
        goto LABEL_35;
      }
      id v19 = [(OrgApacheLuceneUtilPackedPackedInts_Reader *)self->nodeRefToAddress_ getWithInt:v17];
      goto LABEL_34;
    }
LABEL_41:
    JreThrowNullPointerException();
  }
  *((void *)a3 + 7) = [a4 getPosition];
  if (self->nodeAddress_)
  {
    id v15 = (id)(*((void *)a3 + 3) - 1);
  }
  else
  {
    if (([a3 flagWithInt:2] & 1) == 0)
    {
      if (*((_DWORD *)a3 + 18))
      {
        [a4 setPositionWithLong:*((void *)a3 + 8)];
        [a4 skipBytesWithLong:*((_DWORD *)a3 + 20) * *((_DWORD *)a3 + 18)];
      }
      else
      {
        sub_100128E98((uint64_t)self, a4);
      }
    }
    id v15 = [a4 getPosition];
  }
  uint64_t v20 = 32;
LABEL_40:
  *(void *)((char *)a3 + v20) = v15;
  return a3;
}

- (BOOL)assertRootCachedArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = [OrgApacheLuceneUtilFstFST_Arc alloc];
  [(OrgApacheLuceneUtilFstFST *)self getFirstArcWithOrgApacheLuceneUtilFstFST_Arc:v6];
  sub_10012905C((uint64_t)self, v4, (uint64_t)v6, v6, [(OrgApacheLuceneUtilFstFST *)self getBytesReader], 0);
  return 1;
}

- (id)findTargetArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_Arc:(id)a5 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a6
{
  return sub_10012905C((uint64_t)self, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, 1);
}

- (id)findTargetArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilFstFST_Arc:(id)a5 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a6 withBoolean:(BOOL)a7
{
  return sub_10012905C((uint64_t)self, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, a7);
}

- (void)seekToNextNodeWithOrgApacheLuceneUtilFstFST_BytesReader:(id)a3
{
}

- (BOOL)shouldExpandWithOrgApacheLuceneUtilFstBuilder:(id)a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a4
{
  return sub_1001284FC((uint64_t)a3, (uint64_t)a4);
}

- (id)getBytesReader
{
  bytesArray = self->bytesArray_;
  if (self->packed_)
  {
    if (bytesArray)
    {
      uint64_t v3 = new_OrgApacheLuceneUtilFstForwardBytesReader_initWithByteArray_(self->bytesArray_);
LABEL_6:
      return v3;
    }
    bytes = self->bytes_;
    if (bytes)
    {
      return [(OrgApacheLuceneUtilFstBytesStore *)bytes getForwardReader];
    }
LABEL_17:
    JreThrowNullPointerException();
  }
  if (bytesArray)
  {
    uint64_t v3 = new_OrgApacheLuceneUtilFstReverseBytesReader_initWithByteArray_(self->bytesArray_);
    goto LABEL_6;
  }
  id v6 = self->bytes_;
  if (!v6) {
    goto LABEL_17;
  }
  return [(OrgApacheLuceneUtilFstBytesStore *)v6 getReverseReader];
}

- (OrgApacheLuceneUtilFstFST)initWithOrgApacheLuceneUtilFstFST_INPUT_TYPEEnum:(id)a3 withOrgApacheLuceneUtilFstOutputs:(id)a4 withInt:(int)a5
{
  return self;
}

- (id)packWithOrgApacheLuceneUtilFstBuilder:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6
{
  if (!self->nodeAddress_)
  {
    v111 = new_JavaLangIllegalArgumentException_initWithNSString_(@"this FST was not built with willPackFST=true");
    objc_exception_throw(v111);
  }
  outputs = self->outputs_;
  if (!outputs) {
    goto LABEL_118;
  }
  uint64_t v9 = *(void *)&a5;
  id v11 = [(OrgApacheLuceneUtilFstOutputs *)outputs getNoOutput];
  id v12 = [OrgApacheLuceneUtilFstFST_Arc alloc];
  id v122 = [(OrgApacheLuceneUtilFstFST *)self getBytesReader];
  p_inCounts = &self->inCounts_;
  inCounts = self->inCounts_;
  if (!inCounts) {
    goto LABEL_118;
  }
  uint64_t v15 = JavaLangMath_minWithInt_withInt_(v9, [(OrgApacheLuceneUtilPackedGrowableWriter *)inCounts size]);
  id v16 = [OrgApacheLuceneUtilFstFST_NodeQueue alloc];
  OrgApacheLuceneUtilPriorityQueue_initWithInt_withBoolean_((uint64_t)v16, v15, 0, v17, v18, v19, v20, v21);
  uint64_t v22 = v16;
  v123 = self;
  if ([(OrgApacheLuceneUtilPackedGrowableWriter *)*p_inCounts size] >= 1)
  {
    uint64_t v23 = 0;
    v24 = 0;
    do
    {
      if ([(OrgApacheLuceneUtilPackedGrowableWriter *)*p_inCounts getWithInt:v23] >= a4)
      {
        int64_t v25 = [(OrgApacheLuceneUtilPackedGrowableWriter *)*p_inCounts getWithInt:v23];
        int v26 = v25;
        if (v24)
        {
          if (v25 > v24[3])
          {
            unsigned int v27 = [(OrgApacheLuceneUtilPackedGrowableWriter *)*p_inCounts getWithInt:v23];
            char v28 = [OrgApacheLuceneUtilFstFST_NodeAndInCount alloc];
            v28->node_ = v23;
            v28->count_ = v27;
            [(OrgApacheLuceneUtilPriorityQueue *)v22 insertWithOverflowWithId:v28];
          }
        }
        else
        {
          v29 = [OrgApacheLuceneUtilFstFST_NodeAndInCount alloc];
          v29->node_ = v23;
          v29->count_ = v26;
          [(OrgApacheLuceneUtilPriorityQueue *)v22 addWithId:v29];
          if ([(OrgApacheLuceneUtilPriorityQueue *)v22 size] == v15) {
            v24 = [(OrgApacheLuceneUtilPriorityQueue *)v22 top];
          }
          else {
            v24 = 0;
          }
        }
      }
      uint64_t v23 = (v23 + 1);
    }
    while ((int)v23 < [(OrgApacheLuceneUtilPackedGrowableWriter *)*p_inCounts size]);
  }
  JreStrongAssign((id *)p_inCounts, 0);
  v120 = new_JavaUtilHashMap_init();
  unsigned int v30 = [(OrgApacheLuceneUtilPriorityQueue *)v22 size];
  if ((int)(v30 - 1) >= 0)
  {
    int v31 = v30;
    while (1)
    {
      BOOL v32 = [(OrgApacheLuceneUtilPriorityQueue *)v22 pop];
      if (!v32) {
        break;
      }
      --v31;
      unsigned int v33 = JavaLangInteger_valueOfWithInt_(v32[2]);
      [(JavaUtilHashMap *)v120 putWithId:v33 withId:JavaLangInteger_valueOfWithInt_(v31)];
      if (v31 <= 0) {
        goto LABEL_18;
      }
    }
LABEL_118:
    JreThrowNullPointerException();
  }
LABEL_18:
  v34 = (id *)a3;
  if (!a3) {
    goto LABEL_118;
  }
  unsigned int v35 = (void *)*((void *)a3 + 7);
  if (!v35) {
    goto LABEL_118;
  }
  id v36 = [v35 getPosition];
  uint64_t v44 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_((unint64_t)v36, v37, v38, v39, v40, v41, v42, v43);
  int v45 = new_OrgApacheLuceneUtilPackedGrowableWriter_initWithInt_withInt_withFloat_(v44, (*((_DWORD *)a3 + 10) + 1), a6);
  v124 = v45;
  if (*((uint64_t *)a3 + 5) < 1) {
    goto LABEL_88;
  }
  uint64_t v46 = 1;
  do
  {
    v47 = [*((id *)a3 + 7) getPosition];
    nodeAddress = v123->nodeAddress_;
    if (!nodeAddress) {
      goto LABEL_118;
    }
    [(OrgApacheLuceneUtilPackedGrowableWriter *)v45 setWithInt:v46 withLong:v47 - (unsigned char *)[(OrgApacheLuceneUtilPackedGrowableWriter *)nodeAddress getWithInt:v46] + 1];
    uint64_t v46 = (v46 + 1);
  }
  while (*((void *)a3 + 5) >= (int)v46);
LABEL_88:
  while (2)
  {
    inputType = v123->inputType_;
    uint64_t v74 = v123->outputs_;
    int v75 = [v34[7] getBlockBits];
    uint64_t v76 = [OrgApacheLuceneUtilFstFST alloc];
    sub_1001293F8((uint64_t)v76, inputType, v74, v75);
    id v77 = v76;
    uint64_t v118 = (uint64_t)v77;
    bytes = v77->bytes_;
    if (!bytes) {
      goto LABEL_118;
    }
    [(OrgApacheLuceneUtilFstBytesStore *)v77->bytes_ writeByteWithByte:0];
    id v79 = v34[5];
    if ((int)v79 < 1) {
      break;
    }
    int64_t v117 = 0;
    char v113 = 0;
    uint64_t v49 = v34[5];
    LODWORD(v119) = v79;
    p_isa = (id *)&v123->super.isa;
    do
    {
      v114 = [(OrgApacheLuceneUtilFstBytesStore *)bytes getPosition];
      if (v114 != (unsigned char *)[(OrgApacheLuceneUtilPackedGrowableWriter *)v45 getWithInt:v49])
      {
        int64_t v117 = v114 - (unsigned char *)[(OrgApacheLuceneUtilPackedGrowableWriter *)v45 getWithInt:v49];
        -[OrgApacheLuceneUtilPackedGrowableWriter setWithInt:withLong:](v45, "setWithInt:withLong:", v49);
        char v113 = 1;
      }
      uint64_t v115 = v49;
      LODWORD(v51) = 0;
      char v116 = 0;
      uint64_t v52 = v118;
      uint64_t v119 = (v119 - 1);
      while (2)
      {
        objc_msgSend(p_isa, "readFirstRealTargetArcWithLong:withOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:", v115, v12, v122);
        unsigned int bytesPerArc = v12->bytesPerArc_;
        if (bytesPerArc)
        {
          if (v51) {
            uint64_t v51 = v51;
          }
          else {
            uint64_t v51 = bytesPerArc;
          }
          [(OrgApacheLuceneUtilFstBytesStore *)bytes writeByteWithByte:32];
          [(OrgApacheLuceneStoreDataOutput *)bytes writeVIntWithInt:v12->numArcs_];
          [(OrgApacheLuceneStoreDataOutput *)bytes writeVIntWithInt:v51];
        }
        BOOL v55 = v115 != 1 && bytesPerArc == 0;
        BOOL v125 = v55;
        unsigned int v126 = bytesPerArc;
        int v121 = v51;
        uint64_t v51 = 0;
        while (1)
        {
          unsigned int v56 = [(OrgApacheLuceneUtilFstBytesStore *)bytes getPosition];
          if ([(OrgApacheLuceneUtilFstFST_Arc *)v12 isLast]) {
            char v57 = 2;
          }
          else {
            char v57 = 0;
          }
          if (v125 && v12->target_ == v119) {
            v57 |= 4u;
          }
          if ([(OrgApacheLuceneUtilFstFST_Arc *)v12 isFinal])
          {
            if (v12->nextFinalOutput_ == v11) {
              ++v57;
            }
            else {
              v57 += 33;
            }
          }
          BOOL HasArcsWithOrgApacheLuceneUtilFstFST_Arc = OrgApacheLuceneUtilFstFST_targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc_((uint64_t)v12);
          char v59 = v57 + 8;
          if (HasArcsWithOrgApacheLuceneUtilFstFST_Arc) {
            char v59 = v57;
          }
          if (v12->output_ == v11) {
            char v60 = v59;
          }
          else {
            char v60 = v59 + 16;
          }
          BOOL v61 = OrgApacheLuceneUtilFstFST_targetHasArcsWithOrgApacheLuceneUtilFstFST_Arc_((uint64_t)v12);
          BOOL v62 = (v60 & 4) == 0 && v61;
          if (v62)
          {
            id v63 = [(JavaUtilHashMap *)v120 getWithId:JavaLangLong_valueOfWithLong_(v12->target_)];
            if (v63)
            {
              uint64_t v64 = (int)[v63 intValue];
              id v65 = v124;
            }
            else
            {
              signed int v66 = [(JavaUtilHashMap *)v120 size];
              id v65 = v124;
              uint64_t v64 = [(OrgApacheLuceneUtilPackedGrowableWriter *)v124 getWithInt:LODWORD(v12->target_)]
                  + v117
                  + v66;
            }
            v67 = [(OrgApacheLuceneUtilPackedGrowableWriter *)v65 getWithInt:LODWORD(v12->target_)];
            v68 = [(OrgApacheLuceneUtilFstBytesStore *)bytes getPosition];
            uint64_t v52 = v118;
            if (((&v67[v117 - 2] - v68) & ~((&v67[v117 - 2] - v68) >> 63)) < v64) {
              v60 |= 0x40u;
            }
            p_isa = (id *)&v123->super.isa;
          }
          else
          {
            uint64_t v64 = 0;
          }
          [(OrgApacheLuceneUtilFstBytesStore *)bytes writeByteWithByte:v60];
          sub_100127B04(v52, bytes, v12->label_);
          id output = v12->output_;
          if (output != v11) {
            [p_isa[5] writeWithId:output withOrgApacheLuceneStoreDataOutput:bytes];
          }
          id nextFinalOutput = v12->nextFinalOutput_;
          if (nextFinalOutput != v11) {
            [p_isa[5] writeFinalOutputWithId:nextFinalOutput withOrgApacheLuceneStoreDataOutput:bytes];
          }
          if (v62)
          {
            uint64_t v71 = [(OrgApacheLuceneUtilPackedGrowableWriter *)v124 getWithInt:LODWORD(v12->target_)];
            uint64_t v72 = [(OrgApacheLuceneUtilFstBytesStore *)bytes getPosition];
            if (atomic_load_explicit(OrgApacheLuceneUtilFstFST__initialized, memory_order_acquire))
            {
              if ((v60 & 0x40) != 0) {
                goto LABEL_77;
              }
            }
            else
            {
              objc_opt_class();
              if ((v60 & 0x40) != 0)
              {
LABEL_77:
                [(OrgApacheLuceneStoreDataOutput *)bytes writeVLongWithLong:(&v71[v117] - v72) & ~((&v71[v117] - v72) >> 63)];
                p_isa = (id *)&v123->super.isa;
                goto LABEL_78;
              }
            }
            [(OrgApacheLuceneStoreDataOutput *)bytes writeVLongWithLong:v64];
            p_isa = (id *)&v123->super.isa;
            if ((v116 & 1) == 0) {
              [(JavaUtilHashMap *)v120 size];
            }
          }
LABEL_78:
          if (v126)
          {
            uint64_t v51 = JavaLangMath_maxWithInt_withInt_(v51, [(OrgApacheLuceneUtilFstBytesStore *)bytes getPosition] - v56);
            [(OrgApacheLuceneUtilFstBytesStore *)bytes skipBytesWithInt:v56 + v121 - [(OrgApacheLuceneUtilFstBytesStore *)bytes getPosition]];
          }
          if ([(OrgApacheLuceneUtilFstFST_Arc *)v12 isLast]) {
            break;
          }
          objc_msgSend(p_isa, "readNextRealArcWithOrgApacheLuceneUtilFstFST_Arc:withOrgApacheLuceneUtilFstFST_BytesReader:", v12, v122);
        }
        if (v126 && v51 != v121 && (v116 & ((int)v51 <= v121)) == 0)
        {
          [(OrgApacheLuceneUtilFstBytesStore *)bytes truncateWithLong:v114];
          char v116 = 1;
          continue;
        }
        break;
      }
      uint64_t v49 = v115 - 1;
      int v45 = v124;
    }
    while (v115 > 1);
    v34 = (id *)a3;
    if (v113) {
      continue;
    }
    break;
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v80 = [(JavaUtilHashMap *)v120 keySet];
  if (!v80) {
    goto LABEL_118;
  }
  v81 = v80;
  id v82 = [v80 countByEnumeratingWithState:&v131 objects:v136 count:16];
  if (v82)
  {
    id v83 = v82;
    uint64_t v84 = 0;
    uint64_t v85 = *(void *)v132;
    do
    {
      for (i = 0; i != v83; i = (char *)i + 1)
      {
        if (*(void *)v132 != v85) {
          objc_enumerationMutation(v81);
        }
        BOOL v87 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        if (!v87) {
          goto LABEL_118;
        }
        uint64_t v84 = JavaLangMath_maxWithLong_withLong_(v84, -[OrgApacheLuceneUtilPackedGrowableWriter getWithInt:](v45, "getWithInt:", [v87 intValue]));
      }
      id v83 = [v81 countByEnumeratingWithState:&v131 objects:v136 count:16];
    }
    while (v83);
  }
  else
  {
    uint64_t v84 = 0;
  }
  uint64_t v88 = [(JavaUtilHashMap *)v120 size];
  uint64_t v96 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(v84, v89, v90, v91, v92, v93, v94, v95);
  MutableWithInt_withInt_withFloat = OrgApacheLuceneUtilPackedPackedInts_getMutableWithInt_withInt_withFloat_(v88, v96, a6);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v98 = [(JavaUtilHashMap *)v120 entrySet];
  if (!v98) {
    goto LABEL_118;
  }
  v99 = v98;
  id v100 = [v98 countByEnumeratingWithState:&v127 objects:v135 count:16];
  v101 = v123;
  if (v100)
  {
    id v102 = v100;
    uint64_t v103 = *(void *)v128;
    do
    {
      for (j = 0; j != v102; j = (char *)j + 1)
      {
        if (*(void *)v128 != v103) {
          objc_enumerationMutation(v99);
        }
        if (!MutableWithInt_withInt_withFloat) {
          goto LABEL_118;
        }
        v105 = *(void **)(*((void *)&v127 + 1) + 8 * (void)j);
        if (!v105) {
          goto LABEL_118;
        }
        id v106 = [*(id *)(*((void *)&v127 + 1) + 8 * (void)j) getValue];
        if (!v106) {
          goto LABEL_118;
        }
        id v107 = [v106 intValue];
        id v108 = [v105 getKey];
        if (!v108) {
          goto LABEL_118;
        }
        -[OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock1 setWithInt:withLong:](MutableWithInt_withInt_withFloat, "setWithInt:withLong:", v107, -[OrgApacheLuceneUtilPackedGrowableWriter getWithInt:](v124, "getWithInt:", [v108 intValue]));
        v101 = v123;
      }
      id v102 = [v99 countByEnumeratingWithState:&v127 objects:v135 count:16];
    }
    while (v102);
  }
  if (!v118) {
    goto LABEL_118;
  }
  JreStrongAssign((id *)(v118 + 64), MutableWithInt_withInt_withFloat);
  *(void *)(v118 + 48) = [(OrgApacheLuceneUtilPackedGrowableWriter *)v124 getWithInt:LODWORD(v101->startNode_)];
  if (v101->emptyOutput_) {
    objc_msgSend((id)v118, "setEmptyOutputWithId:");
  }
  v109 = *(void **)(v118 + 24);
  if (!v109) {
    goto LABEL_118;
  }
  [v109 finish];
  -[OrgApacheLuceneUtilFstFST cacheRootArcs]_0(v118);
  return (id)v118;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstFST;
  [(OrgApacheLuceneUtilFstFST *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = (void *)OrgApacheLuceneUtilFstFST_class_();
    qword_1005605D0 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    if (qword_100560608 != -1) {
      dispatch_once(&qword_100560608, &stru_1003F2450);
    }
    qword_1005605D8 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_((void *)qword_100560600);
    if ((atomic_load_explicit(OrgApacheLuceneUtilConstants__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (OrgApacheLuceneUtilConstants_JRE_IS_64BIT_) {
      int v3 = 30;
    }
    else {
      int v3 = 28;
    }
    OrgApacheLuceneUtilFstFST_DEFAULT_MAX_BLOCK_BITS_ = v3;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilFstFST__initialized);
  }
}

@end