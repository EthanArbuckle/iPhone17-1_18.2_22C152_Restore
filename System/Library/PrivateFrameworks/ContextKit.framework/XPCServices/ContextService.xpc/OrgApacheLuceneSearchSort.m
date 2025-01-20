@interface OrgApacheLuceneSearchSort
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsScores;
- (OrgApacheLuceneSearchSort)init;
- (OrgApacheLuceneSearchSort)initWithOrgApacheLuceneSearchSortField:(id)a3;
- (OrgApacheLuceneSearchSort)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3;
- (id)description;
- (id)getSort;
- (id)rewriteWithOrgApacheLuceneSearchIndexSearcher:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setSortWithOrgApacheLuceneSearchSortField:(id)a3;
- (void)setSortWithOrgApacheLuceneSearchSortFieldArray:(id)a3;
@end

@implementation OrgApacheLuceneSearchSort

- (OrgApacheLuceneSearchSort)init
{
  return self;
}

- (OrgApacheLuceneSearchSort)initWithOrgApacheLuceneSearchSortField:(id)a3
{
  return self;
}

- (OrgApacheLuceneSearchSort)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3
{
  return self;
}

- (void)setSortWithOrgApacheLuceneSearchSortField:(id)a3
{
  p_fields = &self->fields_;
  id v5 = a3;
  id v4 = +[IOSObjectArray newArrayWithObjects:&v5 count:1 type:OrgApacheLuceneSearchSortField_class_()];
  JreStrongAssignAndConsume((id *)p_fields, v4);
}

- (void)setSortWithOrgApacheLuceneSearchSortFieldArray:(id)a3
{
}

- (id)getSort
{
  return self->fields_;
}

- (id)rewriteWithOrgApacheLuceneSearchIndexSearcher:(id)a3
{
  fields = self->fields_;
  if (!fields) {
LABEL_16:
  }
    JreThrowNullPointerException();
  v6 = +[IOSObjectArray arrayWithLength:fields->super.size_ type:OrgApacheLuceneSearchSortField_class_()];
  v7 = self->fields_;
  if (v7->super.size_ < 1) {
    return self;
  }
  uint64_t v8 = (uint64_t)v6;
  uint64_t v9 = 0;
  char v10 = 0;
  do
  {
    v11 = (&v7->elementType_)[v9];
    if (!v11) {
      goto LABEL_16;
    }
    IOSObjectArray_Set(v8, v9, [(IOSClass *)v11 rewriteWithOrgApacheLuceneSearchIndexSearcher:a3]);
    v12 = self->fields_;
    uint64_t size = v12->super.size_;
    if (v9 >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v9);
    }
    v14 = (&v12->elementType_)[v9];
    uint64_t v15 = *(int *)(v8 + 8);
    if (v9 >= v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v9);
    }
    v10 |= v14 != *(IOSClass **)(v8 + 24 + 8 * v9++);
    v7 = self->fields_;
  }
  while (v9 < v7->super.size_);
  if ((v10 & 1) == 0) {
    return self;
  }
  v16 = [OrgApacheLuceneSearchSort alloc];
  [(OrgApacheLuceneSearchSort *)v16 setSortWithOrgApacheLuceneSearchSortFieldArray:v8];
  return v16;
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  fields = self->fields_;
  if (!fields) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id v5 = v3;
  uint64_t v6 = 0;
  while (v6 < fields->super.size_)
  {
    v7 = (&fields->elementType_)[v6];
    if (v7)
    {
      [(JavaLangStringBuilder *)v5 appendWithNSString:[(IOSClass *)v7 description]];
      fields = self->fields_;
      if (fields->super.size_ > (int)v6 + 1)
      {
        [(JavaLangStringBuilder *)v5 appendWithChar:44];
        fields = self->fields_;
      }
      ++v6;
      if (fields) {
        continue;
      }
    }
    goto LABEL_8;
  }
  return [(JavaLangStringBuilder *)v5 description];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  fields = self->fields_;
  uint64_t v6 = *((void *)a3 + 1);
  return JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)fields, v6);
}

- (unint64_t)hash
{
  return (int)(JavaUtilArrays_hashCodeWithNSObjectArray_((uint64_t)self->fields_) + 1168832101);
}

- (BOOL)needsScores
{
  fields = self->fields_;
  if (!fields) {
LABEL_7:
  }
    JreThrowNullPointerException();
  p_elementType = (void **)&fields->elementType_;
  unint64_t v4 = (unint64_t)&(&fields->elementType_)[fields->super.size_];
  do
  {
    id v5 = p_elementType;
    if ((unint64_t)p_elementType >= v4) {
      break;
    }
    uint64_t v6 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_7;
    }
    ++p_elementType;
  }
  while (![v6 needsScores]);
  return (unint64_t)v5 < v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchSort;
  [(OrgApacheLuceneSearchSort *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneSearchSort alloc];
    OrgApacheLuceneSearchSort_init(v2);
    JreStrongAssignAndConsume(&OrgApacheLuceneSearchSort_RELEVANCE_, v2);
    if ((atomic_load_explicit(OrgApacheLuceneSearchSortField__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v3 = OrgApacheLuceneSearchSortField_FIELD_DOC_;
    unint64_t v4 = [OrgApacheLuceneSearchSort alloc];
    [(OrgApacheLuceneSearchSort *)v4 setSortWithOrgApacheLuceneSearchSortField:v3];
    JreStrongAssignAndConsume(&OrgApacheLuceneSearchSort_INDEXORDER_, v4);
    atomic_store(1u, OrgApacheLuceneSearchSort__initialized);
  }
}

@end