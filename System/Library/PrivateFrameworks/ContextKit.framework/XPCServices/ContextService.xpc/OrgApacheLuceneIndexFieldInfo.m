@interface OrgApacheLuceneIndexFieldInfo
- (BOOL)checkConsistency;
- (BOOL)hasNorms;
- (BOOL)hasPayloads;
- (BOOL)hasVectors;
- (BOOL)omitsNorms;
- (OrgApacheLuceneIndexFieldInfo)initWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withOrgApacheLuceneIndexIndexOptionsEnum:(id)a8 withOrgApacheLuceneIndexDocValuesTypeEnum:(id)a9 withLong:(int64_t)a10 withJavaUtilMap:(id)a11;
- (id)attributes;
- (id)getAttributeWithNSString:(id)a3;
- (id)getDocValuesType;
- (id)getIndexOptions;
- (id)putAttributeWithNSString:(id)a3 withNSString:(id)a4;
- (int64_t)getDocValuesGen;
- (void)dealloc;
- (void)setDocValuesGenWithLong:(int64_t)a3;
- (void)setDocValuesTypeWithOrgApacheLuceneIndexDocValuesTypeEnum:(id)a3;
- (void)setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:(id)a3;
- (void)setOmitsNorms;
- (void)setStorePayloads;
- (void)setStoreTermVectors;
- (void)updateWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5 withOrgApacheLuceneIndexIndexOptionsEnum:(id)a6;
@end

@implementation OrgApacheLuceneIndexFieldInfo

- (OrgApacheLuceneIndexFieldInfo)initWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withOrgApacheLuceneIndexIndexOptionsEnum:(id)a8 withOrgApacheLuceneIndexDocValuesTypeEnum:(id)a9 withLong:(int64_t)a10 withJavaUtilMap:(id)a11
{
  return self;
}

- (BOOL)checkConsistency
{
  indexOptions = self->indexOptions_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (indexOptions == (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
  {
    if (self->storeTermVector_ || self->storePayloads_ || self->omitNorms_)
    {
      v11 = @"non-indexed field '";
LABEL_21:
      CFStringRef v14 = JreStrcat("$$$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v11);
      v15 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v14);
      objc_exception_throw(v15);
    }
  }
  else
  {
    v10 = self->indexOptions_;
    if (!v10) {
      JreThrowNullPointerException();
    }
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ([(JavaLangEnum *)v10 compareToWithId:qword_100563208] < 0 && self->storePayloads_)
    {
      v11 = @"indexed field '";
      goto LABEL_21;
    }
  }
  if (self->dvGen_ != -1)
  {
    docValuesType = self->docValuesType_;
    if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (docValuesType == (OrgApacheLuceneIndexDocValuesTypeEnum *)OrgApacheLuceneIndexDocValuesTypeEnum_values_)
    {
      v11 = @"field '";
      goto LABEL_21;
    }
  }
  return 1;
}

- (void)updateWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5 withOrgApacheLuceneIndexIndexOptionsEnum:(id)a6
{
  if (!a6)
  {
    CFStringRef v21 = JreStrcat("$$$", (uint64_t)a2, a3, a4, a5, 0, v6, v7, @"IndexOptions cannot be null (field: \"");
    v22 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v21);
    objc_exception_throw(v22);
  }
  BOOL v11 = a4;
  p_indexOptions = (id *)&self->indexOptions_;
  indexOptions = self->indexOptions_;
  if (indexOptions != a6)
  {
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (indexOptions == (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
    {
      v17 = &self->indexOptions_;
      id v16 = a6;
LABEL_14:
      JreStrongAssign((id *)v17, v16);
      goto LABEL_15;
    }
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ((id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0] != a6)
    {
      if (!*p_indexOptions) {
        goto LABEL_32;
      }
      unsigned int v15 = [*p_indexOptions compareToWithId:a6];
      id v16 = a6;
      if ((v15 & 0x80000000) != 0) {
        id v16 = *p_indexOptions;
      }
      v17 = &self->indexOptions_;
      goto LABEL_14;
    }
  }
LABEL_15:
  id v18 = *p_indexOptions;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v18 != (id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
  {
    self->storeTermVector_ |= a3;
    self->storePayloads_ |= a5;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ((id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0] != a6 && self->omitNorms_ != v11) {
      self->omitNorms_ = 1;
    }
  }
  id v19 = *p_indexOptions;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v19 == (id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0]) {
    goto LABEL_30;
  }
  id v20 = *p_indexOptions;
  if (!v20) {
LABEL_32:
  }
    JreThrowNullPointerException();
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (([v20 compareToWithId:qword_100563208] & 0x80000000) != 0) {
LABEL_30:
  }
    self->storePayloads_ = 0;
}

- (void)setDocValuesTypeWithOrgApacheLuceneIndexDocValuesTypeEnum:(id)a3
{
  if (!a3)
  {
    CFStringRef v12 = JreStrcat("$$$", (uint64_t)a2, 0, v3, v4, v5, v6, v7, @"DocValuesType cannot be null (field: \"");
    v13 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v12);
    goto LABEL_14;
  }
  p_docValuesType = &self->docValuesType_;
  docValuesType = self->docValuesType_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (docValuesType != (OrgApacheLuceneIndexDocValuesTypeEnum *)OrgApacheLuceneIndexDocValuesTypeEnum_values_)
  {
    if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ((id)OrgApacheLuceneIndexDocValuesTypeEnum_values_ != a3 && *p_docValuesType != a3)
    {
      CFStringRef v14 = JreStrcat("$@$@$$C", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, @"cannot change DocValues type from ");
      v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v14);
LABEL_14:
      objc_exception_throw(v13);
    }
  }
  JreStrongAssign((id *)&self->docValuesType_, a3);
}

- (id)getIndexOptions
{
  return self->indexOptions_;
}

- (void)setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:(id)a3
{
  p_indexOptions = &self->indexOptions_;
  indexOptions = self->indexOptions_;
  if (indexOptions != a3)
  {
    id v6 = a3;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (indexOptions == (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
    {
LABEL_11:
      JreStrongAssign((id *)p_indexOptions, v6);
      goto LABEL_12;
    }
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ((id)OrgApacheLuceneIndexIndexOptionsEnum_values_[0] != v6)
    {
      if (!*p_indexOptions) {
        goto LABEL_21;
      }
      if ([(JavaLangEnum *)*p_indexOptions compareToWithId:v6] < 0) {
        id v6 = *p_indexOptions;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v7 = *p_indexOptions;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v7 == (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0]) {
    goto LABEL_19;
  }
  v8 = *p_indexOptions;
  if (!v8) {
LABEL_21:
  }
    JreThrowNullPointerException();
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if ([(JavaLangEnum *)v8 compareToWithId:qword_100563208] < 0) {
LABEL_19:
  }
    self->storePayloads_ = 0;
}

- (id)getDocValuesType
{
  return self->docValuesType_;
}

- (void)setDocValuesGenWithLong:(int64_t)a3
{
  self->dvGen_ = a3;
}

- (int64_t)getDocValuesGen
{
  return self->dvGen_;
}

- (void)setStoreTermVectors
{
  self->storeTermVector_ = 1;
}

- (void)setStorePayloads
{
  indexOptions = self->indexOptions_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (indexOptions != (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
  {
    uint64_t v4 = self->indexOptions_;
    if (!v4) {
      JreThrowNullPointerException();
    }
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (([(JavaLangEnum *)v4 compareToWithId:qword_100563208] & 0x80000000) == 0) {
      self->storePayloads_ = 1;
    }
  }
}

- (BOOL)omitsNorms
{
  return self->omitNorms_;
}

- (void)setOmitsNorms
{
  indexOptions = self->indexOptions_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (indexOptions == (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"cannot omit norms: this field is not indexed");
    objc_exception_throw(v4);
  }
  self->omitNorms_ = 1;
}

- (BOOL)hasNorms
{
  indexOptions = self->indexOptions_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return indexOptions != (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0]
      && !self->omitNorms_;
}

- (BOOL)hasPayloads
{
  return self->storePayloads_;
}

- (BOOL)hasVectors
{
  return self->storeTermVector_;
}

- (id)getAttributeWithNSString:(id)a3
{
  attributes = self->attributes_;
  if (!attributes) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)attributes getWithId:a3];
}

- (id)putAttributeWithNSString:(id)a3 withNSString:(id)a4
{
  attributes = self->attributes_;
  if (!attributes) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)attributes putWithId:a3 withId:a4];
}

- (id)attributes
{
  return self->attributes_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFieldInfo;
  [(OrgApacheLuceneIndexFieldInfo *)&v3 dealloc];
}

@end