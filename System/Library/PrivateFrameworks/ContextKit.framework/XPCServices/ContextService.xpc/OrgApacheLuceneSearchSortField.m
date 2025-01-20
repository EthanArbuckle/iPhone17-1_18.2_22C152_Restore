@interface OrgApacheLuceneSearchSortField
+ (void)initialize;
- (BOOL)getReverse;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsScores;
- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchFieldComparatorSource:(id)a4;
- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchFieldComparatorSource:(id)a4 withBoolean:(BOOL)a5;
- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchSortField_TypeEnum:(id)a4;
- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchSortField_TypeEnum:(id)a4 withBoolean:(BOOL)a5;
- (id)description;
- (id)getBytesComparator;
- (id)getComparatorSource;
- (id)getComparatorWithInt:(int)a3 withInt:(int)a4;
- (id)getField;
- (id)getType;
- (unint64_t)hash;
- (void)dealloc;
- (void)initFieldTypeWithNSString:(id)a3 withOrgApacheLuceneSearchSortField_TypeEnum:(id)a4;
- (void)setBytesComparatorWithJavaUtilComparator:(id)a3;
- (void)setMissingValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchSortField

- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchSortField_TypeEnum:(id)a4
{
  return self;
}

- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchSortField_TypeEnum:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (void)setMissingValueWithId:(id)a3
{
  type = self->type_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (type == (OrgApacheLuceneSearchSortField_TypeEnum *)qword_100563510) {
    goto LABEL_20;
  }
  v6 = self->type_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v6 == (OrgApacheLuceneSearchSortField_TypeEnum *)qword_100563540)
  {
LABEL_20:
    if ((id)OrgApacheLuceneSearchSortField_STRING_FIRST_ != a3
      && OrgApacheLuceneSearchSortField_STRING_LAST_ != (void)a3)
    {
      CFStringRef v11 = @"For STRING type, missing value must be either STRING_FIRST or STRING_LAST";
LABEL_28:
      v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
      objc_exception_throw(v13);
    }
  }
  else
  {
    v7 = self->type_;
    if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v7 != (OrgApacheLuceneSearchSortField_TypeEnum *)qword_100563518)
    {
      v8 = self->type_;
      if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v8 != (OrgApacheLuceneSearchSortField_TypeEnum *)qword_100563520)
      {
        v9 = self->type_;
        if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        if (v9 != (OrgApacheLuceneSearchSortField_TypeEnum *)qword_100563528)
        {
          v10 = self->type_;
          if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          if (v10 != (OrgApacheLuceneSearchSortField_TypeEnum *)qword_100563530)
          {
            CFStringRef v11 = @"Missing value only works for numeric or STRING types";
            goto LABEL_28;
          }
        }
      }
    }
  }
  JreStrongAssign(&self->missingValue_, a3);
}

- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchFieldComparatorSource:(id)a4
{
  return self;
}

- (OrgApacheLuceneSearchSortField)initWithNSString:(id)a3 withOrgApacheLuceneSearchFieldComparatorSource:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (void)initFieldTypeWithNSString:(id)a3 withOrgApacheLuceneSearchSortField_TypeEnum:(id)a4
{
}

- (id)getField
{
  return self->field_;
}

- (id)getType
{
  return self->type_;
}

- (BOOL)getReverse
{
  return self->reverse_;
}

- (id)getComparatorSource
{
  return self->comparatorSource_;
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  switch([(JavaLangEnum *)self->type_ ordinal])
  {
    case 0:
      CFStringRef v4 = @"<score>";
      goto LABEL_4;
    case 1:
      CFStringRef v4 = @"<doc>";
LABEL_4:
      v5 = v3;
      goto LABEL_21;
    case 2:
      CFStringRef v6 = @"<string: \"";
      goto LABEL_18;
    case 3:
      CFStringRef v6 = @"<int: \"";
      goto LABEL_18;
    case 4:
      CFStringRef v6 = @"<float: \"";
      goto LABEL_18;
    case 5:
      CFStringRef v6 = @"<long: \"";
      goto LABEL_18;
    case 6:
      CFStringRef v6 = @"<double: \"";
      goto LABEL_18;
    case 7:
      id v7 = [(JavaLangStringBuilder *)v3 appendWithNSString:@"<custom:\""];
      if (!v7) {
        goto LABEL_29;
      }
      id v8 = [v7 appendWithNSString:self->field_];
      if (!v8) {
        goto LABEL_29;
      }
      id v9 = [v8 appendWithNSString:@"\": "];
      if (!v9) {
        goto LABEL_29;
      }
      id v10 = [v9 appendWithId:self->comparatorSource_];
      if (!v10) {
        goto LABEL_29;
      }
      [v10 appendWithChar:62];
      break;
    case 8:
      CFStringRef v6 = @"<string_val: \"";
      goto LABEL_18;
    case 0xA:
      CFStringRef v6 = @"<rewriteable: \"";
      goto LABEL_18;
    default:
      CFStringRef v6 = @"<???: \"";
LABEL_18:
      id v11 = [(JavaLangStringBuilder *)v3 appendWithNSString:v6];
      if (!v11 || (v5 = (JavaLangStringBuilder *)[v11 appendWithNSString:self->field_]) == 0) {
LABEL_29:
      }
        JreThrowNullPointerException();
      CFStringRef v4 = @"\">";
LABEL_21:
      [(JavaLangStringBuilder *)v5 appendWithNSString:v4];
      break;
  }
  if (self->reverse_) {
    [(JavaLangStringBuilder *)v3 appendWithChar:33];
  }
  if (self->missingValue_)
  {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" missingValue="];
    [(JavaLangStringBuilder *)v3 appendWithId:self->missingValue_];
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  unsigned int v5 = OrgApacheLuceneUtilStringHelper_equalsWithNSString_withNSString_(*((void **)a3 + 3), (uint64_t)self->field_);
  if (v5)
  {
    if ((OrgApacheLuceneSearchSortField_TypeEnum *)*((void *)a3 + 4) == self->type_
      && *((unsigned __int8 *)a3 + 8) == self->reverse_)
    {
      CFStringRef v6 = (void *)*((void *)a3 + 5);
      comparatorSource = self->comparatorSource_;
      if (v6)
      {
        LOBYTE(v5) = [v6 isEqual:comparatorSource];
      }
      else
      {
        LOBYTE(v5) = comparatorSource == 0;
      }
      return v5;
    }
LABEL_12:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  type = self->type_;
  if (!type) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = [(JavaLangEnum *)type hash];
  signed int v5 = ([(id)JavaLangBoolean_valueOfWithBoolean_(self->reverse_) hash] + 879060445) ^ v4 ^ 0xAF5998BB;
  field = self->field_;
  if (field) {
    v5 += [(NSString *)field hash] ^ 0xFF5685DD;
  }
  comparatorSource = self->comparatorSource_;
  if (comparatorSource) {
    v5 += [(OrgApacheLuceneSearchFieldComparatorSource *)comparatorSource hash];
  }
  return v5;
}

- (void)setBytesComparatorWithJavaUtilComparator:(id)a3
{
}

- (id)getBytesComparator
{
  return self->bytesComparator_;
}

- (id)getComparatorWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  switch([(JavaLangEnum *)self->type_ ordinal])
  {
    case 0:
      v14 = new_OrgApacheLuceneSearchFieldComparator_RelevanceComparator_initWithInt_(v5);
      goto LABEL_22;
    case 1:
      v14 = new_OrgApacheLuceneSearchFieldComparator_DocComparator_initWithInt_(v5);
      goto LABEL_22;
    case 2:
      v14 = new_OrgApacheLuceneSearchFieldComparator_TermOrdValComparator_initWithInt_withNSString_withBoolean_(v5, self->field_, self->missingValue_ == (id)OrgApacheLuceneSearchSortField_STRING_LAST_);
      goto LABEL_22;
    case 3:
      p_id missingValue = &self->missingValue_;
      id missingValue = self->missingValue_;
      id v16 = p_missingValue[1];
      objc_opt_class();
      if (missingValue && (objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_25;
      }
      v14 = new_OrgApacheLuceneSearchFieldComparator_IntComparator_initWithInt_withNSString_withJavaLangInteger_(v5, v16, missingValue);
      goto LABEL_22;
    case 4:
      v20 = &self->missingValue_;
      id v18 = self->missingValue_;
      id v19 = v20[1];
      objc_opt_class();
      if (v18 && (objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_25;
      }
      v14 = new_OrgApacheLuceneSearchFieldComparator_FloatComparator_initWithInt_withNSString_withJavaLangFloat_(v5, v19, v18);
      goto LABEL_22;
    case 5:
      v23 = &self->missingValue_;
      id v21 = self->missingValue_;
      id v22 = v23[1];
      objc_opt_class();
      if (v21 && (objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_25;
      }
      v14 = new_OrgApacheLuceneSearchFieldComparator_LongComparator_initWithInt_withNSString_withJavaLangLong_(v5, v22, v21);
      goto LABEL_22;
    case 6:
      v26 = &self->missingValue_;
      id v24 = self->missingValue_;
      id v25 = v26[1];
      objc_opt_class();
      if (v24 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_25:
      }
        JreThrowClassCastException();
      v14 = new_OrgApacheLuceneSearchFieldComparator_DoubleComparator_initWithInt_withNSString_withJavaLangDouble_(v5, v25, v24);
      goto LABEL_22;
    case 7:
      comparatorSource = self->comparatorSource_;
      if (!comparatorSource) {
        JreThrowNullPointerException();
      }
      field = self->field_;
      BOOL reverse = self->reverse_;
      return [(OrgApacheLuceneSearchFieldComparatorSource *)comparatorSource newComparatorWithNSString:field withInt:v5 withInt:v4 withBoolean:reverse];
    case 8:
      v14 = new_OrgApacheLuceneSearchFieldComparator_TermValComparator_initWithInt_withNSString_withBoolean_(v5, self->field_, self->missingValue_ == (id)OrgApacheLuceneSearchSortField_STRING_LAST_);
LABEL_22:
      return v14;
    case 0xA:
      CFStringRef v30 = @"SortField needs to be rewritten through Sort.rewrite(..) and SortField.rewrite(..)";
      break;
    default:
      CFStringRef v30 = JreStrcat("$@", v7, v8, v9, v10, v11, v12, v13, @"Illegal sort type: ");
      break;
  }
  v31 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v30);
  objc_exception_throw(v31);
}

- (BOOL)needsScores
{
  type = self->type_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return type == (OrgApacheLuceneSearchSortField_TypeEnum *)OrgApacheLuceneSearchSortField_TypeEnum_values_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchSortField;
  [(OrgApacheLuceneSearchSortField *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v2 = (void *)OrgApacheLuceneSearchSortField_TypeEnum_values_;
    objc_super v3 = [OrgApacheLuceneSearchSortField alloc];
    OrgApacheLuceneSearchSortField_initWithNSString_withOrgApacheLuceneSearchSortField_TypeEnum_((uint64_t)v3, 0, v2);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchSortField_FIELD_SCORE_, v3);
    if ((atomic_load_explicit(OrgApacheLuceneSearchSortField_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v4 = (void *)qword_100563508;
    uint64_t v5 = [OrgApacheLuceneSearchSortField alloc];
    OrgApacheLuceneSearchSortField_initWithNSString_withOrgApacheLuceneSearchSortField_TypeEnum_((uint64_t)v5, 0, v4);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchSortField_FIELD_DOC_, v5);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchSortField_STRING_FIRST_, [OrgApacheLuceneSearchSortField__1 alloc]);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchSortField_STRING_LAST_, [OrgApacheLuceneSearchSortField__2 alloc]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchSortField__initialized);
  }
}

@end