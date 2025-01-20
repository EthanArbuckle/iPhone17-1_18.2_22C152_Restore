@interface OrgApacheLuceneDocumentFieldType
- (BOOL)isEqual:(id)a3;
- (BOOL)omitNorms;
- (BOOL)storeTermVectorOffsets;
- (BOOL)storeTermVectorPayloads;
- (BOOL)storeTermVectorPositions;
- (BOOL)storeTermVectors;
- (BOOL)stored;
- (BOOL)tokenized;
- (NSString)description;
- (OrgApacheLuceneDocumentFieldType)init;
- (OrgApacheLuceneDocumentFieldType)initWithOrgApacheLuceneDocumentFieldType:(id)a3;
- (id)docValuesType;
- (id)indexOptions;
- (id)numericType;
- (int)numericPrecisionStep;
- (unint64_t)hash;
- (void)checkIfFrozen;
- (void)dealloc;
- (void)freeze;
- (void)setDocValuesTypeWithOrgApacheLuceneIndexDocValuesTypeEnum:(id)a3;
- (void)setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:(id)a3;
- (void)setNumericPrecisionStepWithInt:(int)a3;
- (void)setNumericTypeWithOrgApacheLuceneDocumentFieldType_NumericTypeEnum:(id)a3;
- (void)setOmitNormsWithBoolean:(BOOL)a3;
- (void)setStoreTermVectorOffsetsWithBoolean:(BOOL)a3;
- (void)setStoreTermVectorPayloadsWithBoolean:(BOOL)a3;
- (void)setStoreTermVectorPositionsWithBoolean:(BOOL)a3;
- (void)setStoreTermVectorsWithBoolean:(BOOL)a3;
- (void)setStoredWithBoolean:(BOOL)a3;
- (void)setTokenizedWithBoolean:(BOOL)a3;
@end

@implementation OrgApacheLuceneDocumentFieldType

- (OrgApacheLuceneDocumentFieldType)initWithOrgApacheLuceneDocumentFieldType:(id)a3
{
  return self;
}

- (OrgApacheLuceneDocumentFieldType)init
{
  return self;
}

- (void)checkIfFrozen
{
  if (self->frozen_)
  {
    v2 = new_JavaLangIllegalStateException_initWithNSString_(@"this FieldType is already frozen and cannot be changed");
    objc_exception_throw(v2);
  }
}

- (void)freeze
{
  self->frozen_ = 1;
}

- (BOOL)stored
{
  return self->stored_;
}

- (void)setStoredWithBoolean:(BOOL)a3
{
  self->stored_ = a3;
}

- (BOOL)tokenized
{
  return self->tokenized_;
}

- (void)setTokenizedWithBoolean:(BOOL)a3
{
  self->tokenized_ = a3;
}

- (BOOL)storeTermVectors
{
  return self->storeTermVectors_;
}

- (void)setStoreTermVectorsWithBoolean:(BOOL)a3
{
  self->storeTermVectors_ = a3;
}

- (BOOL)storeTermVectorOffsets
{
  return self->storeTermVectorOffsets_;
}

- (void)setStoreTermVectorOffsetsWithBoolean:(BOOL)a3
{
  self->storeTermVectorOffsets_ = a3;
}

- (BOOL)storeTermVectorPositions
{
  return self->storeTermVectorPositions_;
}

- (void)setStoreTermVectorPositionsWithBoolean:(BOOL)a3
{
  self->storeTermVectorPositions_ = a3;
}

- (BOOL)storeTermVectorPayloads
{
  return self->storeTermVectorPayloads_;
}

- (void)setStoreTermVectorPayloadsWithBoolean:(BOOL)a3
{
  self->storeTermVectorPayloads_ = a3;
}

- (BOOL)omitNorms
{
  return self->omitNorms_;
}

- (void)setOmitNormsWithBoolean:(BOOL)a3
{
  self->omitNorms_ = a3;
}

- (id)indexOptions
{
  return self->indexOptions_;
}

- (void)setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:(id)a3
{
  [(OrgApacheLuceneDocumentFieldType *)self checkIfFrozen];
  if (!a3)
  {
    v5 = new_JavaLangNullPointerException_initWithNSString_(@"IndexOptions cannot be null");
    objc_exception_throw(v5);
  }
  JreStrongAssign((id *)&self->indexOptions_, a3);
}

- (void)setNumericTypeWithOrgApacheLuceneDocumentFieldType_NumericTypeEnum:(id)a3
{
  [(OrgApacheLuceneDocumentFieldType *)self checkIfFrozen];
  JreStrongAssign((id *)&self->numericType_, a3);
}

- (id)numericType
{
  return self->numericType_;
}

- (void)setNumericPrecisionStepWithInt:(int)a3
{
  [(OrgApacheLuceneDocumentFieldType *)self checkIfFrozen];
  if (a3 <= 0)
  {
    CFStringRef v12 = JreStrcat("$IC", v5, v6, v7, v8, v9, v10, v11, @"precisionStep must be >= 1 (got ");
    v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  self->numericPrecisionStep_ = a3;
}

- (int)numericPrecisionStep
{
  return self->numericPrecisionStep_;
}

- (NSString)description
{
  v3 = new_JavaLangStringBuilder_init();
  if ([(OrgApacheLuceneDocumentFieldType *)self stored]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@"stored"];
  }
  indexOptions = self->indexOptions_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (indexOptions != (OrgApacheLuceneIndexIndexOptionsEnum *)OrgApacheLuceneIndexIndexOptionsEnum_values_[0])
  {
    if ([(JavaLangStringBuilder *)v3 length] >= 1) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@","];
    }
    [(JavaLangStringBuilder *)v3 appendWithNSString:@"indexed"];
    if ([(OrgApacheLuceneDocumentFieldType *)self tokenized]) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",tokenized"];
    }
    if ([(OrgApacheLuceneDocumentFieldType *)self storeTermVectors]) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",termVector"];
    }
    if ([(OrgApacheLuceneDocumentFieldType *)self storeTermVectorOffsets]) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",termVectorOffsets"];
    }
    if ([(OrgApacheLuceneDocumentFieldType *)self storeTermVectorPositions]) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",termVectorPosition"];
    }
    if ([(OrgApacheLuceneDocumentFieldType *)self storeTermVectorPayloads]) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",termVectorPayloads"];
    }
    if ([(OrgApacheLuceneDocumentFieldType *)self omitNorms]) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",omitNorms"];
    }
    uint64_t v5 = self->indexOptions_;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v5 != (OrgApacheLuceneIndexIndexOptionsEnum *)qword_100563208)
    {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",indexOptions="];
      [(JavaLangStringBuilder *)v3 appendWithId:self->indexOptions_];
    }
    if (self->numericType_)
    {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",numericType="];
      [(JavaLangStringBuilder *)v3 appendWithId:self->numericType_];
      [(JavaLangStringBuilder *)v3 appendWithNSString:@",numericPrecisionStep="];
      [(JavaLangStringBuilder *)v3 appendWithInt:self->numericPrecisionStep_];
    }
  }
  docValuesType = self->docValuesType_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (docValuesType != (OrgApacheLuceneIndexDocValuesTypeEnum *)OrgApacheLuceneIndexDocValuesTypeEnum_values_[0])
  {
    if ([(JavaLangStringBuilder *)v3 length] >= 1) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@","];
    }
    [(JavaLangStringBuilder *)v3 appendWithNSString:@"docValuesType="];
    [(JavaLangStringBuilder *)v3 appendWithId:self->docValuesType_];
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)docValuesType
{
  return self->docValuesType_;
}

- (void)setDocValuesTypeWithOrgApacheLuceneIndexDocValuesTypeEnum:(id)a3
{
  [(OrgApacheLuceneDocumentFieldType *)self checkIfFrozen];
  if (!a3)
  {
    uint64_t v5 = new_JavaLangNullPointerException_initWithNSString_(@"DocValuesType cannot be null");
    objc_exception_throw(v5);
  }
  JreStrongAssign((id *)&self->docValuesType_, a3);
}

- (unint64_t)hash
{
  docValuesType = self->docValuesType_;
  if (docValuesType) {
    unsigned int v4 = 31 * [(JavaLangEnum *)docValuesType hash] + 961;
  }
  else {
    unsigned int v4 = 961;
  }
  indexOptions = self->indexOptions_;
  if (!indexOptions) {
    JreThrowNullPointerException();
  }
  unsigned int v6 = [(JavaLangEnum *)indexOptions hash];
  int numericPrecisionStep = self->numericPrecisionStep_;
  numericType = self->numericType_;
  if (numericType) {
    LODWORD(numericType) = [(JavaLangEnum *)numericType hash];
  }
  int v9 = numericPrecisionStep - (v4 + v6) + 32 * (v4 + v6);
  int v10 = numericType - v9 + 32 * v9;
  if (self->omitNorms_) {
    int v11 = 1231;
  }
  else {
    int v11 = 1237;
  }
  int v12 = v11 - v10 + 32 * v10;
  if (self->storeTermVectorOffsets_) {
    int v13 = 1231;
  }
  else {
    int v13 = 1237;
  }
  int v14 = v13 - v12 + 32 * v12;
  if (self->storeTermVectorPayloads_) {
    int v15 = 1231;
  }
  else {
    int v15 = 1237;
  }
  int v16 = v15 - v14 + 32 * v14;
  if (self->storeTermVectorPositions_) {
    int v17 = 1231;
  }
  else {
    int v17 = 1237;
  }
  int v18 = v17 - v16 + 32 * v16;
  if (self->storeTermVectors_) {
    int v19 = 1231;
  }
  else {
    int v19 = 1237;
  }
  int v20 = v19 - v18 + 32 * v18;
  if (self->stored_) {
    int v21 = 1231;
  }
  else {
    int v21 = 1237;
  }
  int v22 = v21 - v20 + 32 * v20;
  if (self->tokenized_) {
    int v23 = 1231;
  }
  else {
    int v23 = 1237;
  }
  return v23 - v22 + 32 * v22;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    id v5 = [(OrgApacheLuceneDocumentFieldType *)self getClass];
    if (v5 == [a3 getClass])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      if (self->docValuesType_ == (OrgApacheLuceneIndexDocValuesTypeEnum *)*((void *)a3 + 5)
        && self->indexOptions_ == (OrgApacheLuceneIndexIndexOptionsEnum *)*((void *)a3 + 2)
        && self->numericPrecisionStep_ == *((_DWORD *)a3 + 9)
        && self->numericType_ == (OrgApacheLuceneDocumentFieldType_NumericTypeEnum *)*((void *)a3 + 3)
        && self->omitNorms_ == *((unsigned __int8 *)a3 + 14)
        && self->storeTermVectorOffsets_ == *((unsigned __int8 *)a3 + 11)
        && self->storeTermVectorPayloads_ == *((unsigned __int8 *)a3 + 13)
        && self->storeTermVectorPositions_ == *((unsigned __int8 *)a3 + 12)
        && self->storeTermVectors_ == *((unsigned __int8 *)a3 + 10)
        && self->stored_ == *((unsigned __int8 *)a3 + 8))
      {
        return self->tokenized_ == *((unsigned __int8 *)a3 + 9);
      }
    }
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneDocumentFieldType;
  [(OrgApacheLuceneDocumentFieldType *)&v3 dealloc];
}

@end