@interface OrgApacheLuceneIndexFieldInfos
- (BOOL)hasDocValues;
- (BOOL)hasFreq;
- (BOOL)hasNorms;
- (BOOL)hasOffsets;
- (BOOL)hasPayloads;
- (BOOL)hasProx;
- (BOOL)hasVectors;
- (OrgApacheLuceneIndexFieldInfos)initWithOrgApacheLuceneIndexFieldInfoArray:(id)a3;
- (id)fieldInfoWithInt:(int)a3;
- (id)fieldInfoWithNSString:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexFieldInfos

- (OrgApacheLuceneIndexFieldInfos)initWithOrgApacheLuceneIndexFieldInfoArray:(id)a3
{
  return self;
}

- (BOOL)hasFreq
{
  return self->hasFreq_;
}

- (BOOL)hasProx
{
  return self->hasProx_;
}

- (BOOL)hasPayloads
{
  return self->hasPayloads_;
}

- (BOOL)hasOffsets
{
  return self->hasOffsets_;
}

- (BOOL)hasVectors
{
  return self->hasVectors_;
}

- (BOOL)hasNorms
{
  return self->hasNorms_;
}

- (BOOL)hasDocValues
{
  return self->hasDocValues_;
}

- (int)size
{
  byName = self->byName_;
  if (!byName) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)byName size];
}

- (id)iterator
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)values iterator];
}

- (id)fieldInfoWithNSString:(id)a3
{
  byName = self->byName_;
  if (!byName) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)byName getWithId:a3];
}

- (id)fieldInfoWithInt:(int)a3
{
  if (a3 < 0)
  {
    CFStringRef v12 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"Illegal field number: ");
    v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  byNumberTable = self->byNumberTable_;
  if (byNumberTable)
  {
    if (byNumberTable->super.size_ <= a3) {
      return 0;
    }
    else {
      return (&byNumberTable->elementType_)[a3];
    }
  }
  else
  {
    byNumberMap = self->byNumberMap_;
    if (!byNumberMap) {
      JreThrowNullPointerException();
    }
    v11 = JavaLangInteger_valueOfWithInt_(a3);
    return [(JavaUtilSortedMap *)byNumberMap getWithId:v11];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFieldInfos;
  [(OrgApacheLuceneIndexFieldInfos *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end