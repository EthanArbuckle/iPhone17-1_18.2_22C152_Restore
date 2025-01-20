@interface OrgApacheLuceneDocumentDocument
+ (void)initialize;
- (NSString)description;
- (OrgApacheLuceneDocumentDocument)init;
- (id)getBinaryValueWithNSString:(id)a3;
- (id)getBinaryValuesWithNSString:(id)a3;
- (id)getFieldWithNSString:(id)a3;
- (id)getFields;
- (id)getFieldsWithNSString:(id)a3;
- (id)getValuesWithNSString:(id)a3;
- (id)getWithNSString:(id)a3;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addWithOrgApacheLuceneIndexIndexableField:(id)a3;
- (void)dealloc;
- (void)removeAllFields;
- (void)removeFieldWithNSString:(id)a3;
- (void)removeFieldsWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneDocumentDocument

- (OrgApacheLuceneDocumentDocument)init
{
  p_fields = &self->fields_;
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_fields, v4);
  return self;
}

- (id)iterator
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)fields iterator];
}

- (void)addWithOrgApacheLuceneIndexIndexableField:(id)a3
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)fields addWithId:a3];
}

- (void)removeAllFields
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)fields clear];
}

- (void)removeFieldWithNSString:(id)a3
{
  fields = self->fields_;
  if (!fields || (id v5 = [(JavaUtilList *)fields iterator]) == 0) {
LABEL_12:
  }
    JreThrowNullPointerException();
  v6 = v5;
  while (([v6 hasNext] & 1) != 0)
  {
    id v7 = [v6 next];
    if (!v7) {
      goto LABEL_12;
    }
    id v8 = [v7 name];
    if (!v8) {
      goto LABEL_12;
    }
    if ([v8 isEqual:a3])
    {
      [v6 remove];
      return;
    }
  }
}

- (void)removeFieldsWithNSString:(id)a3
{
  fields = self->fields_;
  if (!fields) {
    goto LABEL_10;
  }
  id v5 = [(JavaUtilList *)fields iterator];
  if (!v5) {
    goto LABEL_10;
  }
  v6 = v5;
  if ([v5 hasNext])
  {
    while (1)
    {
      id v7 = [v6 next];
      if (!v7) {
        break;
      }
      id v8 = [v7 name];
      if (!v8) {
        break;
      }
      if ([v8 isEqual:a3]) {
        [v6 remove];
      }
      if (([v6 hasNext] & 1) == 0) {
        return;
      }
    }
LABEL_10:
    JreThrowNullPointerException();
  }
}

- (id)getBinaryValuesWithNSString:(id)a3
{
  id v5 = new_JavaUtilArrayList_init();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  fields = self->fields_;
  if (!fields) {
LABEL_15:
  }
    JreThrowNullPointerException();
  id v7 = v5;
  id v8 = [(JavaUtilList *)fields countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(fields);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_15;
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "name", (void)v16);
        if (!v13) {
          goto LABEL_15;
        }
        if ([v13 isEqual:a3])
        {
          id v14 = [v12 binaryValue];
          if (v14) {
            [(JavaUtilArrayList *)v7 addWithId:v14];
          }
        }
      }
      id v9 = [(JavaUtilList *)fields countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return [(JavaUtilArrayList *)v7 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v7 size] type:OrgApacheLuceneUtilBytesRef_class_()]];
}

- (id)getBinaryValueWithNSString:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  fields = self->fields_;
  if (!fields) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id result = [(JavaUtilList *)self->fields_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(fields);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (!v9) {
          goto LABEL_14;
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "name", (void)v11);
        if (!v10) {
          goto LABEL_14;
        }
        if ([v10 isEqual:a3])
        {
          id result = [v9 binaryValue];
          if (result) {
            return result;
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [(JavaUtilList *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = result;
    }
    while (result);
  }
  return result;
}

- (id)getFieldWithNSString:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  fields = self->fields_;
  if (!fields) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id v5 = [(JavaUtilList *)self->fields_ countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(fields);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_14;
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name", (void)v12);
        if (!v10) {
          goto LABEL_14;
        }
        if ([v10 isEqual:a3]) {
          return v9;
        }
      }
      id v6 = [(JavaUtilList *)fields countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return 0;
}

- (id)getFieldsWithNSString:(id)a3
{
  id v5 = new_JavaUtilArrayList_init();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  fields = self->fields_;
  if (!fields) {
LABEL_14:
  }
    JreThrowNullPointerException();
  uint64_t v7 = v5;
  id v8 = [(JavaUtilList *)fields countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(fields);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_14;
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "name", (void)v15);
        if (!v13) {
          goto LABEL_14;
        }
        if ([v13 isEqual:a3]) {
          [(JavaUtilArrayList *)v7 addWithId:v12];
        }
      }
      id v9 = [(JavaUtilList *)fields countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return [(JavaUtilArrayList *)v7 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v7 size] type:OrgApacheLuceneIndexIndexableField_class_()]];
}

- (id)getFields
{
  return self->fields_;
}

- (id)getValuesWithNSString:(id)a3
{
  id v5 = new_JavaUtilArrayList_init();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  fields = self->fields_;
  if (!fields) {
LABEL_16:
  }
    JreThrowNullPointerException();
  uint64_t v7 = v5;
  id v8 = [(JavaUtilList *)fields countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(fields);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_16;
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "name", (void)v15);
        if (!v13) {
          goto LABEL_16;
        }
        if ([v13 isEqual:a3] && objc_msgSend(v12, "stringValue")) {
          -[JavaUtilArrayList addWithId:](v7, "addWithId:", [v12 stringValue]);
        }
      }
      id v9 = [(JavaUtilList *)fields countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  if ([(JavaUtilArrayList *)v7 size]) {
    return [(JavaUtilArrayList *)v7 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v7 size] type:NSString_class_()]];
  }
  else {
    return (id)qword_100560610;
  }
}

- (id)getWithNSString:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  fields = self->fields_;
  if (!fields) {
LABEL_16:
  }
    JreThrowNullPointerException();
  id result = [(JavaUtilList *)self->fields_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(fields);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (!v9) {
          goto LABEL_16;
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "name", (void)v11);
        if (!v10) {
          goto LABEL_16;
        }
        if ([v10 isEqual:a3] && objc_msgSend(v9, "stringValue")) {
          return [v9 stringValue];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [(JavaUtilList *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSString)description
{
  v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"Document<"];
  fields = self->fields_;
  if (!fields) {
LABEL_8:
  }
    JreThrowNullPointerException();
  uint64_t v5 = 0;
  while ((int)v5 < (int)[(JavaUtilList *)fields size])
  {
    id v6 = [(JavaUtilList *)self->fields_ getWithInt:v5];
    if (v6)
    {
      -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v6 description]);
      if (v5 != [(JavaUtilList *)self->fields_ size] - 1) {
        [(JavaLangStringBuilder *)v3 appendWithNSString:@" "];
      }
      uint64_t v5 = (v5 + 1);
      fields = self->fields_;
      if (fields) {
        continue;
      }
    }
    goto LABEL_8;
  }
  [(JavaLangStringBuilder *)v3 appendWithNSString:@">"];
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneDocumentDocument;
  [(OrgApacheLuceneDocumentDocument *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:NSString_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560610, v2);
    atomic_store(1u, OrgApacheLuceneDocumentDocument__initialized);
  }
}

@end