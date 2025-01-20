@interface OrgApacheLuceneIndexSegmentInfos
+ (id)getInfoStream;
+ (id)getLastCommitSegmentsFileNameWithNSStringArray:(id)a3;
+ (id)getLastCommitSegmentsFileNameWithOrgApacheLuceneStoreDirectory:(id)a3;
+ (id)readCommitWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4;
+ (id)readLatestCommitWithOrgApacheLuceneStoreDirectory:(id)a3;
+ (int64_t)generationFromSegmentsFileNameWithNSString:(id)a3;
+ (int64_t)getLastCommitGenerationWithNSStringArray:(id)a3;
+ (int64_t)getLastCommitGenerationWithOrgApacheLuceneStoreDirectory:(id)a3;
+ (void)initialize;
+ (void)setInfoStreamWithJavaIoPrintStream:(id)a3;
- (BOOL)containsWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (NSString)description;
- (OrgApacheLuceneIndexSegmentInfos)init;
- (id)asList;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createBackupSegmentInfos;
- (id)filesWithBoolean:(BOOL)a3;
- (id)filesWithOrgApacheLuceneStoreDirectory:(id)a3 withBoolean:(BOOL)a4;
- (id)finishCommitWithOrgApacheLuceneStoreDirectory:(id)a3;
- (id)getCommitLuceneVersion;
- (id)getId;
- (id)getMinSegmentLuceneVersion;
- (id)getSegmentsFileName;
- (id)getUserData;
- (id)infoWithInt:(int)a3;
- (id)iterator;
- (int)indexOfWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (int)size;
- (int)totalMaxDoc;
- (int64_t)getGeneration;
- (int64_t)getLastGeneration;
- (int64_t)getNextPendingGeneration;
- (int64_t)getVersion;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addAllWithJavaLangIterable:(id)a3;
- (void)addWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (void)applyMergeChangesWithOrgApacheLuceneIndexMergePolicy_OneMerge:(id)a3 withBoolean:(BOOL)a4;
- (void)changed;
- (void)clear;
- (void)commitWithOrgApacheLuceneStoreDirectory:(id)a3;
- (void)dealloc;
- (void)prepareCommitWithOrgApacheLuceneStoreDirectory:(id)a3;
- (void)removeWithInt:(int)a3;
- (void)removeWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (void)replaceWithOrgApacheLuceneIndexSegmentInfos:(id)a3;
- (void)rollbackCommitWithOrgApacheLuceneStoreDirectory:(id)a3;
- (void)rollbackSegmentInfosWithJavaUtilList:(id)a3;
- (void)setNextWriteGenerationWithLong:(int64_t)a3;
- (void)setUserDataWithJavaUtilMap:(id)a3;
- (void)updateGenerationVersionAndCounterWithOrgApacheLuceneIndexSegmentInfos:(id)a3;
- (void)updateGenerationWithOrgApacheLuceneIndexSegmentInfos:(id)a3;
- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3;
@end

@implementation OrgApacheLuceneIndexSegmentInfos

- (OrgApacheLuceneIndexSegmentInfos)init
{
  p_userData = &self->userData_;
  v4 = (void *)JavaUtilCollections_emptyMap();
  JreStrongAssign((id *)p_userData, v4);
  v5 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)&self->segments_, v5);
  return self;
}

- (id)infoWithInt:(int)a3
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)segments getWithInt:*(void *)&a3];
}

+ (int64_t)getLastCommitGenerationWithNSStringArray:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_getLastCommitGenerationWithNSStringArray_((uint64_t)a3);
}

+ (int64_t)getLastCommitGenerationWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_getLastCommitGenerationWithOrgApacheLuceneStoreDirectory_(a3);
}

+ (id)getLastCommitSegmentsFileNameWithNSStringArray:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_getLastCommitSegmentsFileNameWithNSStringArray_((uint64_t)a3);
}

+ (id)getLastCommitSegmentsFileNameWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_getLastCommitSegmentsFileNameWithOrgApacheLuceneStoreDirectory_(a3);
}

- (id)getSegmentsFileName
{
  return OrgApacheLuceneIndexIndexFileNames_fileNameFromGenerationWithNSString_withNSString_withLong_(OrgApacheLuceneIndexIndexFileNames_SEGMENTS_, &stru_10048C1F8, self->lastGeneration_);
}

+ (int64_t)generationFromSegmentsFileNameWithNSString:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_generationFromSegmentsFileNameWithNSString_(a3);
}

- (int64_t)getNextPendingGeneration
{
  int64_t generation = self->generation_;
  BOOL v3 = __CFADD__(generation, 1);
  int64_t v4 = generation + 1;
  if (v3) {
    return 1;
  }
  else {
    return v4;
  }
}

- (id)getId
{
  id result = self->id__;
  if (result) {
    return [result clone];
  }
  return result;
}

+ (id)readCommitWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexSegmentInfos_readCommitWithOrgApacheLuceneStoreDirectory_withNSString_(a3, a4);
}

+ (id)readLatestCommitWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_readLatestCommitWithOrgApacheLuceneStoreDirectory_(a3);
}

- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3
{
}

- (id)clone
{
  v14.receiver = self;
  v14.super_class = (Class)OrgApacheLuceneIndexSegmentInfos;
  BOOL v3 = [(OrgApacheLuceneIndexSegmentInfos *)&v14 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int64_t v4 = new_JavaUtilArrayList_initWithInt_([(OrgApacheLuceneIndexSegmentInfos *)self size]);
  JreStrongAssignAndConsume(v3 + 7, v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = [(OrgApacheLuceneIndexSegmentInfos *)self countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        objc_msgSend(v3, "addWithOrgApacheLuceneIndexSegmentCommitInfo:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "clone"));
      }
      unint64_t v5 = [(OrgApacheLuceneIndexSegmentInfos *)self countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
  v8 = new_JavaUtilHashMap_initWithJavaUtilMap_(self->userData_);
  JreStrongAssignAndConsume(v3 + 3, v8);
  return v3;
}

- (int64_t)getVersion
{
  return self->version__;
}

- (int64_t)getGeneration
{
  return self->generation_;
}

- (int64_t)getLastGeneration
{
  return self->lastGeneration_;
}

+ (void)setInfoStreamWithJavaIoPrintStream:(id)a3
{
}

+ (id)getInfoStream
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneIndexSegmentInfos__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return (id)qword_10055FCC0;
  }
}

- (void)updateGenerationWithOrgApacheLuceneIndexSegmentInfos:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->lastGeneration_ = *((void *)a3 + 6);
  self->generation_ = *((void *)a3 + 5);
}

- (void)updateGenerationVersionAndCounterWithOrgApacheLuceneIndexSegmentInfos:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->version__ = *((void *)a3 + 2);
  self->counter_ = *((_DWORD *)a3 + 2);
}

- (void)setNextWriteGenerationWithLong:(int64_t)a3
{
  self->generation_ = a3;
}

- (void)rollbackCommitWithOrgApacheLuceneStoreDirectory:(id)a3
{
}

- (void)prepareCommitWithOrgApacheLuceneStoreDirectory:(id)a3
{
}

- (id)filesWithOrgApacheLuceneStoreDirectory:(id)a3 withBoolean:(BOOL)a4
{
  return [(OrgApacheLuceneIndexSegmentInfos *)self filesWithBoolean:a4];
}

- (id)filesWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = new_JavaUtilHashSet_init();
  if (v3)
  {
    id v6 = [(OrgApacheLuceneIndexSegmentInfos *)self getSegmentsFileName];
    if (v6) {
      [(JavaUtilHashSet *)v5 addWithId:v6];
    }
  }
  int v7 = [(OrgApacheLuceneIndexSegmentInfos *)self size];
  if (v7 >= 1)
  {
    int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      id v10 = [(OrgApacheLuceneIndexSegmentInfos *)self infoWithInt:v9];
      if (!v10) {
        JreThrowNullPointerException();
      }
      -[JavaUtilAbstractCollection addAllWithJavaUtilCollection:](v5, "addAllWithJavaUtilCollection:", [v10 files]);
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
  return v5;
}

- (id)finishCommitWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return sub_10001C354((uint64_t)self, a3);
}

- (void)commitWithOrgApacheLuceneStoreDirectory:(id)a3
{
  sub_10001C264((uint64_t)self, a3);
  sub_10001C354((uint64_t)self, a3);
}

- (NSString)description
{
  BOOL v3 = new_JavaLangStringBuilder_init();
  id v4 = [(JavaLangStringBuilder *)v3 appendWithNSString:[(OrgApacheLuceneIndexSegmentInfos *)self getSegmentsFileName]];
  if (!v4) {
    goto LABEL_11;
  }
  [v4 appendWithNSString:@": "];
  int v5 = [(OrgApacheLuceneIndexSegmentInfos *)self size];
  if (v5 >= 1)
  {
    int v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      if (v7) {
        [(JavaLangStringBuilder *)v3 appendWithChar:32];
      }
      id v8 = [(OrgApacheLuceneIndexSegmentInfos *)self infoWithInt:v7];
      if (!v8) {
        break;
      }
      -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v8 toStringWithInt:0]);
      uint64_t v7 = (v7 + 1);
      if (v6 == v7) {
        goto LABEL_8;
      }
    }
LABEL_11:
    JreThrowNullPointerException();
  }
LABEL_8:
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)getUserData
{
  return self->userData_;
}

- (void)setUserDataWithJavaUtilMap:(id)a3
{
  p_userData = &self->userData_;
  if (a3)
  {
    int v5 = &self->userData_;
    int v6 = a3;
  }
  else
  {
    int v6 = (void *)JavaUtilCollections_emptyMap();
    int v5 = p_userData;
  }
  JreStrongAssign((id *)v5, v6);
  [(OrgApacheLuceneIndexSegmentInfos *)self changed];
}

- (void)replaceWithOrgApacheLuceneIndexSegmentInfos:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneIndexSegmentInfos rollbackSegmentInfosWithJavaUtilList:](self, "rollbackSegmentInfosWithJavaUtilList:", [a3 asList]);
  self->lastGeneration_ = *((void *)a3 + 6);
}

- (int)totalMaxDoc
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = [(OrgApacheLuceneIndexSegmentInfos *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  int v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(self);
      }
      uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
      if (!v8 || (uint64_t v9 = *(void **)(v8 + 8)) == 0) {
        JreThrowNullPointerException();
      }
      v5 += [v9 maxDoc];
    }
    unint64_t v4 = [(OrgApacheLuceneIndexSegmentInfos *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v5;
}

- (void)changed
{
}

- (void)applyMergeChangesWithOrgApacheLuceneIndexMergePolicy_OneMerge:(id)a3 withBoolean:(BOOL)a4
{
  if (!a3) {
    goto LABEL_17;
  }
  BOOL v4 = a4;
  uint64_t v7 = new_JavaUtilHashSet_initWithJavaUtilCollection_(*((void **)a3 + 8));
  segments = self->segments_;
  if (!segments) {
    goto LABEL_17;
  }
  int v9 = [(JavaUtilList *)segments size];
  if (v9 < 1)
  {
    int v13 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    int v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    int v13 = 0;
    do
    {
      id v14 = [(JavaUtilList *)self->segments_ getWithInt:v11];
      if ([(JavaUtilHashSet *)v7 containsWithId:v14])
      {
        if (((v13 | v4) & 1) == 0)
        {
          [(JavaUtilList *)self->segments_ setWithInt:v11 withId:*((void *)a3 + 1)];
          uint64_t v12 = (v12 + 1);
          int v13 = 1;
        }
      }
      else
      {
        [(JavaUtilList *)self->segments_ setWithInt:v12 withId:v14];
        uint64_t v12 = (v12 + 1);
      }
      uint64_t v11 = (v11 + 1);
    }
    while (v10 != v11);
  }
  id v15 = [(JavaUtilList *)self->segments_ subListWithInt:v12 withInt:[(JavaUtilList *)self->segments_ size]];
  if (!v15) {
LABEL_17:
  }
    JreThrowNullPointerException();
  [v15 clear];
  if (((v13 | v4) & 1) == 0)
  {
    v16 = self->segments_;
    uint64_t v17 = *((void *)a3 + 1);
    [(JavaUtilList *)v16 addWithInt:0 withId:v17];
  }
}

- (id)createBackupSegmentInfos
{
  unint64_t v3 = new_JavaUtilArrayList_initWithInt_([(OrgApacheLuceneIndexSegmentInfos *)self size]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v4 = [(OrgApacheLuceneIndexSegmentInfos *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(self);
        }
        -[JavaUtilArrayList addWithId:](v3, "addWithId:", [*(id *)(*((void *)&v9 + 1) + 8 * v7++) clone]);
      }
      while (v5 != v7);
      unint64_t v5 = [(OrgApacheLuceneIndexSegmentInfos *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return v3;
}

- (void)rollbackSegmentInfosWithJavaUtilList:(id)a3
{
  [(OrgApacheLuceneIndexSegmentInfos *)self clear];
  [(OrgApacheLuceneIndexSegmentInfos *)self addAllWithJavaLangIterable:a3];
}

- (id)iterator
{
  id v2 = [(OrgApacheLuceneIndexSegmentInfos *)self asList];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 iterator];
}

- (id)asList
{
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(self->segments_);
}

- (int)size
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)segments size];
}

- (void)addWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)segments addWithId:a3];
}

- (void)addAllWithJavaLangIterable:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[OrgApacheLuceneIndexSegmentInfos addWithOrgApacheLuceneIndexSegmentCommitInfo:](self, "addWithOrgApacheLuceneIndexSegmentCommitInfo:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)clear
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)segments clear];
}

- (void)removeWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)segments removeWithId:a3];
}

- (void)removeWithInt:(int)a3
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)segments removeWithInt:*(void *)&a3];
}

- (BOOL)containsWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)segments containsWithId:a3];
}

- (int)indexOfWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  segments = self->segments_;
  if (!segments) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)segments indexOfWithId:a3];
}

- (id)getCommitLuceneVersion
{
  return self->luceneVersion_;
}

- (id)getMinSegmentLuceneVersion
{
  return self->minSegmentLuceneVersion_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentInfos;
  [(OrgApacheLuceneIndexSegmentInfos *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneIndexSegmentInfos *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssign((id *)&qword_10055FCC0, 0);
    CFStringRef v4 = @"Lucene3x";
    id v2 = +[IOSObjectArray arrayWithObjects:&v4 count:1 type:NSString_class_()];
    id v3 = JavaUtilArrays_asListWithNSObjectArray_(v2);
    JreStrongAssign((id *)&qword_10055FCC8, v3);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneIndexSegmentInfos__initialized);
  }
}

@end