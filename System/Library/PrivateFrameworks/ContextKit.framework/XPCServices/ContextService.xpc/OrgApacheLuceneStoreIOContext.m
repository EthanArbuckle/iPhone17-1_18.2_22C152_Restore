@interface OrgApacheLuceneStoreIOContext
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneStoreIOContext)init;
- (OrgApacheLuceneStoreIOContext)initWithBoolean:(BOOL)a3;
- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreFlushInfo:(id)a3;
- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreIOContext:(id)a3 withBoolean:(BOOL)a4;
- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreIOContext_ContextEnum:(id)a3;
- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreIOContext_ContextEnum:(id)a3 withOrgApacheLuceneStoreMergeInfo:(id)a4;
- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreMergeInfo:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneStoreIOContext

- (OrgApacheLuceneStoreIOContext)init
{
  return self;
}

- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreFlushInfo:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreIOContext_ContextEnum:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreIOContext)initWithBoolean:(BOOL)a3
{
  return self;
}

- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreMergeInfo:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreIOContext_ContextEnum:(id)a3 withOrgApacheLuceneStoreMergeInfo:(id)a4
{
  return self;
}

- (OrgApacheLuceneStoreIOContext)initWithOrgApacheLuceneStoreIOContext:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (unint64_t)hash
{
  context = self->context_;
  if (context) {
    unsigned int v4 = 31 * [(JavaLangEnum *)context hash] + 961;
  }
  else {
    unsigned int v4 = 961;
  }
  flushInfo = self->flushInfo_;
  if (flushInfo) {
    unsigned int v6 = [(OrgApacheLuceneStoreFlushInfo *)flushInfo hash];
  }
  else {
    unsigned int v6 = 0;
  }
  mergeInfo = self->mergeInfo_;
  if (mergeInfo) {
    LODWORD(mergeInfo) = [(OrgApacheLuceneStoreMergeInfo *)mergeInfo hash];
  }
  if (self->readOnce_) {
    int v9 = 1231;
  }
  else {
    int v9 = 1237;
  }
  unsigned int v8 = mergeInfo - (v6 + v4) + 32 * (v6 + v4);
  return (int)(v9 - v8 + 32 * v8);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3) {
    goto LABEL_6;
  }
  id v5 = [(OrgApacheLuceneStoreIOContext *)self getClass];
  if (v5 != [a3 getClass]) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->context_ != (OrgApacheLuceneStoreIOContext_ContextEnum *)*((void *)a3 + 1)) {
    goto LABEL_6;
  }
  flushInfo = self->flushInfo_;
  uint64_t v8 = *((void *)a3 + 3);
  if (flushInfo)
  {
    unsigned int v6 = [(OrgApacheLuceneStoreFlushInfo *)flushInfo isEqual:v8];
    if (!v6) {
      return v6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  mergeInfo = self->mergeInfo_;
  uint64_t v10 = *((void *)a3 + 2);
  if (mergeInfo)
  {
    unsigned int v6 = [(OrgApacheLuceneStoreMergeInfo *)mergeInfo isEqual:v10];
    if (!v6) {
      return v6;
    }
    goto LABEL_17;
  }
  if (!v10)
  {
LABEL_17:
    LOBYTE(v6) = self->readOnce_ == *((unsigned __int8 *)a3 + 32);
    return v6;
  }
LABEL_6:
  LOBYTE(v6) = 0;
  return v6;
}

- (id)description
{
  return (id)JreStrcat("$@$@$@$ZC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"IOContext [context=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreIOContext;
  [(OrgApacheLuceneStoreIOContext *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(OrgApacheLuceneStoreIOContext_ContextEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v2 = (void *)qword_100563870;
    objc_super v3 = [OrgApacheLuceneStoreIOContext alloc];
    sub_1000EC630((uint64_t)v3, v2, 0);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneStoreIOContext_DEFAULT_, v3);
    uint64_t v4 = [OrgApacheLuceneStoreIOContext alloc];
    sub_1000EC4F4((uint64_t)v4, 1);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneStoreIOContext_READONCE_, v4);
    uint64_t v5 = [OrgApacheLuceneStoreIOContext alloc];
    sub_1000EC4F4((uint64_t)v5, 0);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneStoreIOContext_READ_, v5);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneStoreIOContext__initialized);
  }
}

@end