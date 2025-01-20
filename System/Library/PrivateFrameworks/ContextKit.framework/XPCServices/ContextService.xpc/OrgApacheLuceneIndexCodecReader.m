@interface OrgApacheLuceneIndexCodecReader
- (OrgApacheLuceneIndexCodecReader)init;
- (id)getBinaryDocValuesWithNSString:(id)a3;
- (id)getChildResources;
- (id)getDVFieldWithNSString:(id)a3 withOrgApacheLuceneIndexDocValuesTypeEnum:(id)a4;
- (id)getDocsWithFieldWithNSString:(id)a3;
- (id)getNormValuesWithNSString:(id)a3;
- (id)getNumericDocValuesWithNSString:(id)a3;
- (id)getSortedDocValuesWithNSString:(id)a3;
- (id)getSortedNumericDocValuesWithNSString:(id)a3;
- (id)getSortedSetDocValuesWithNSString:(id)a3;
- (id)getTermVectorsWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)checkBoundsWithInt:(int)a3;
- (void)checkIntegrity;
- (void)dealloc;
- (void)doClose;
- (void)documentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4;
@end

@implementation OrgApacheLuceneIndexCodecReader

- (OrgApacheLuceneIndexCodecReader)init
{
  return self;
}

- (void)documentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  sub_10001E668(self, a3);
  id v7 = [(OrgApacheLuceneIndexCodecReader *)self getFieldsReader];
  if (!v7) {
    JreThrowNullPointerException();
  }
  [v7 visitDocumentWithInt:v5 withOrgApacheLuceneIndexStoredFieldVisitor:a4];
}

- (id)getTermVectorsWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id result = [(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader];
  if (result)
  {
    id v6 = result;
    sub_10001E668(self, v3);
    return [v6 getWithInt:v3];
  }
  return result;
}

- (void)checkBoundsWithInt:(int)a3
{
}

- (id)getDVFieldWithNSString:(id)a3 withOrgApacheLuceneIndexDocValuesTypeEnum:(id)a4
{
  return sub_10001E76C(self, (uint64_t)a3, a4);
}

- (id)getNumericDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  docValuesLocal = self->docValuesLocal_;
  if (!docValuesLocal) {
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneUtilCloseableThreadLocal *)docValuesLocal get];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = [v6 getWithId:a3];
  if (v8)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      return v9;
    }
  }
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v9 = sub_10001E76C(self, (uint64_t)a3, (id)qword_1005638F8);
  if (v9)
  {
    id v10 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (v10)
    {
      id v9 = [v10 getNumericWithOrgApacheLuceneIndexFieldInfo:v9];
      [v7 putWithId:a3 withId:v9];
      return v9;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return v9;
}

- (id)getDocsWithFieldWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  docsWithFieldLocal = self->docsWithFieldLocal_;
  if (!docsWithFieldLocal) {
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneUtilCloseableThreadLocal *)docsWithFieldLocal get];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = [v6 getWithId:a3];
  if (!v8)
  {
    id v10 = [(OrgApacheLuceneIndexCodecReader *)self getFieldInfos];
    if (v10)
    {
      id v11 = [v10 fieldInfoWithNSString:a3];
      id v8 = v11;
      if (!v11) {
        return v8;
      }
      id v12 = [v11 getDocValuesType];
      if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0)
      {
        id v14 = v12;
        objc_opt_class();
        id v12 = v14;
      }
      if (v12 == (id)OrgApacheLuceneIndexDocValuesTypeEnum_values_) {
        return 0;
      }
      id v13 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
      if (v13)
      {
        id v8 = [v13 getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:v8];
        [v7 putWithId:a3 withId:v8];
        return v8;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return v8;
}

- (id)getBinaryDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v5 = sub_10001E76C(self, (uint64_t)a3, (id)qword_100563900);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  docValuesLocal = self->docValuesLocal_;
  if (!docValuesLocal || (id v8 = [(OrgApacheLuceneUtilCloseableThreadLocal *)docValuesLocal get]) == 0) {
LABEL_13:
  }
    JreThrowNullPointerException();
  id v9 = v8;
  id v10 = [v8 getWithId:a3];
  objc_opt_class();
  if (!v10)
  {
    id v11 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (v11)
    {
      id v10 = [v11 getBinaryWithOrgApacheLuceneIndexFieldInfo:v6];
      [v9 putWithId:a3 withId:v10];
      return v10;
    }
    goto LABEL_13;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v10;
}

- (id)getSortedDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  docValuesLocal = self->docValuesLocal_;
  if (!docValuesLocal) {
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneUtilCloseableThreadLocal *)docValuesLocal get];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = [v6 getWithId:a3];
  if (v8)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      return v9;
    }
  }
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v9 = sub_10001E76C(self, (uint64_t)a3, (id)qword_100563908);
  if (v9)
  {
    id v10 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (v10)
    {
      id v9 = [v10 getSortedWithOrgApacheLuceneIndexFieldInfo:v9];
      [v7 putWithId:a3 withId:v9];
      return v9;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return v9;
}

- (id)getSortedNumericDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  docValuesLocal = self->docValuesLocal_;
  if (!docValuesLocal) {
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneUtilCloseableThreadLocal *)docValuesLocal get];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = [v6 getWithId:a3];
  if (v8)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      return v9;
    }
  }
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v9 = sub_10001E76C(self, (uint64_t)a3, (id)qword_100563910);
  if (v9)
  {
    id v10 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (v10)
    {
      id v9 = [v10 getSortedNumericWithOrgApacheLuceneIndexFieldInfo:v9];
      [v7 putWithId:a3 withId:v9];
      return v9;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return v9;
}

- (id)getSortedSetDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  docValuesLocal = self->docValuesLocal_;
  if (!docValuesLocal) {
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneUtilCloseableThreadLocal *)docValuesLocal get];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = [v6 getWithId:a3];
  if (v8)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      return v9;
    }
  }
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v9 = sub_10001E76C(self, (uint64_t)a3, (id)qword_100563918);
  if (v9)
  {
    id v10 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (v10)
    {
      id v9 = [v10 getSortedSetWithOrgApacheLuceneIndexFieldInfo:v9];
      [v7 putWithId:a3 withId:v9];
      return v9;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return v9;
}

- (id)getNormValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  normsLocal = self->normsLocal_;
  if (!normsLocal) {
    goto LABEL_11;
  }
  id v6 = [(OrgApacheLuceneUtilCloseableThreadLocal *)normsLocal get];
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = v6;
  id v8 = [v6 getWithId:a3];
  if (!v8)
  {
    id v10 = [(OrgApacheLuceneIndexCodecReader *)self getFieldInfos];
    if (v10)
    {
      id v11 = [v10 fieldInfoWithNSString:a3];
      id v8 = v11;
      if (!v11) {
        return v8;
      }
      if (![v11 hasNorms]) {
        return 0;
      }
      id v12 = [(OrgApacheLuceneIndexCodecReader *)self getNormsReader];
      if (v12)
      {
        id v8 = [v12 getNormsWithOrgApacheLuceneIndexFieldInfo:v8];
        [v7 putWithId:a3 withId:v8];
        return v8;
      }
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  return v8;
}

- (void)doClose
{
  docsWithFieldLocal = self->docsWithFieldLocal_;
  v4[0] = self->docValuesLocal_;
  v4[1] = docsWithFieldLocal;
  v4[2] = self->normsLocal_;
  uint64_t v3 = +[IOSObjectArray arrayWithObjects:v4 count:3 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v3);
}

- (int64_t)ramBytesUsed
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  id v3 = [(OrgApacheLuceneIndexCodecReader *)self getPostingsReader];
  if (!v3) {
    goto LABEL_15;
  }
  v4 = (char *)[v3 ramBytesUsed];
  if ([(OrgApacheLuceneIndexCodecReader *)self getNormsReader])
  {
    id v5 = [(OrgApacheLuceneIndexCodecReader *)self getNormsReader];
    if (!v5) {
      goto LABEL_15;
    }
    v4 = &v4[(void)[v5 ramBytesUsed]];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader])
  {
    id v6 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (!v6) {
      goto LABEL_15;
    }
    v4 = &v4[(void)[v6 ramBytesUsed]];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getFieldsReader])
  {
    id v7 = [(OrgApacheLuceneIndexCodecReader *)self getFieldsReader];
    if (!v7) {
      goto LABEL_15;
    }
    v4 = &v4[(void)[v7 ramBytesUsed]];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader])
  {
    id v8 = [(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader];
    if (v8) {
      return (int64_t)&v4[(void)[v8 ramBytesUsed]];
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  return (int64_t)v4;
}

- (id)getChildResources
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  id v3 = new_JavaUtilArrayList_init();
  id v4 = [(OrgApacheLuceneIndexCodecReader *)self getPostingsReader];
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"postings", v4, v5, v6, v7, v8, v9, v10)];
  if ([(OrgApacheLuceneIndexCodecReader *)self getNormsReader])
  {
    id v11 = [(OrgApacheLuceneIndexCodecReader *)self getNormsReader];
    [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"norms", v11, v12, v13, v14, v15, v16, v17)];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader])
  {
    id v18 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"docvalues", v18, v19, v20, v21, v22, v23, v24)];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getFieldsReader])
  {
    id v25 = [(OrgApacheLuceneIndexCodecReader *)self getFieldsReader];
    [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"stored fields", v25, v26, v27, v28, v29, v30, v31)];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader])
  {
    id v32 = [(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader];
    [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"term vectors", v32, v33, v34, v35, v36, v37, v38)];
  }
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(v3);
}

- (void)checkIntegrity
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  id v3 = [(OrgApacheLuceneIndexCodecReader *)self getPostingsReader];
  if (!v3) {
    goto LABEL_17;
  }
  [v3 checkIntegrity];
  if ([(OrgApacheLuceneIndexCodecReader *)self getNormsReader])
  {
    id v4 = [(OrgApacheLuceneIndexCodecReader *)self getNormsReader];
    if (!v4) {
      goto LABEL_17;
    }
    [v4 checkIntegrity];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader])
  {
    id v5 = [(OrgApacheLuceneIndexCodecReader *)self getDocValuesReader];
    if (!v5) {
      goto LABEL_17;
    }
    [v5 checkIntegrity];
  }
  if ([(OrgApacheLuceneIndexCodecReader *)self getFieldsReader])
  {
    id v6 = [(OrgApacheLuceneIndexCodecReader *)self getFieldsReader];
    if (!v6) {
      goto LABEL_17;
    }
    [v6 checkIntegrity];
  }
  if (![(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader]) {
    return;
  }
  id v7 = [(OrgApacheLuceneIndexCodecReader *)self getTermVectorsReader];
  if (!v7) {
LABEL_17:
  }
    JreThrowNullPointerException();
  [v7 checkIntegrity];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexCodecReader;
  [(OrgApacheLuceneIndexLeafReader *)&v3 dealloc];
}

@end