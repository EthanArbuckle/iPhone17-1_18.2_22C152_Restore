@interface NSSQLManyToMany
- (NSSQLManyToMany)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (__CFString)inverseColumnName;
- (__CFString)inverseOrderColumnName;
- (id)columnName;
- (id)correlationTableName;
- (uint64_t)isTableSchemaEqual:(uint64_t)result;
- (void)_setInverseManyToMany:(void *)a1;
- (void)dealloc;
@end

@implementation NSSQLManyToMany

- (NSSQLManyToMany)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLManyToMany;
  result = [(NSSQLRelationship *)&v5 initWithEntity:a3 propertyDescription:a4];
  if (result) {
    result->super.super._propertyType = 9;
  }
  return result;
}

- (__CFString)inverseOrderColumnName
{
  if (result)
  {
    length = (__CFString *)result[1].length;
    if (length == result)
    {
      if (objc_msgSend((id)-[__CFString propertyDescription](result, "propertyDescription"), "isOrdered")) {
        return @"FOK_REFLEXIVE";
      }
      else {
        return 0;
      }
    }
    else if (length)
    {
      return (__CFString *)length[2].data;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_setInverseManyToMany:(void *)a1
{
  v34[3] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v4 = [a1 entity];
  if (a1[7] != a2)
  {
    -[NSSQLRelationship _setInverseRelationship:](a1, (void *)a2);
    if (a1[8])
    {
      if (!a2)
      {
LABEL_12:
        -[NSSQLManyToMany _setInverseManyToMany:](a2, a1);
        goto LABEL_13;
      }
    }
    else
    {
      id v5 = [NSString alloc];
      if (v4) {
        uint64_t v6 = *(unsigned int *)(v4 + 184);
      }
      else {
        uint64_t v6 = 0;
      }
      v7 = (void *)[v5 initWithFormat:@"%@_%d%@", @"Z", v6, objc_msgSend((id)objc_msgSend(a1, "name"), "uppercaseString")];
      v8 = (void *)a1[8];
      if (v8 != v7)
      {

        a1[8] = [v7 copy];
      }

      -[NSSQLRelationship _setInverseRelationship:]((void *)a2, a1);
      if (!a2) {
        goto LABEL_12;
      }
    }
    if (*(unsigned char *)(a2 + 24) != 9)
    {
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3B8];
      v33[0] = @"entity";
      uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entity"), "entityDescription"), "name");
      if (v26) {
        v27 = (__CFString *)v26;
      }
      else {
        v27 = @"nil";
      }
      v34[0] = v27;
      v33[1] = @"relationship";
      uint64_t v28 = [a1 name];
      if (v28) {
        v29 = (__CFString *)v28;
      }
      else {
        v29 = @"nil";
      }
      v34[1] = v29;
      v33[2] = @"inverse";
      uint64_t v30 = [(id)a2 name];
      if (v30) {
        v31 = (__CFString *)v30;
      }
      else {
        v31 = @"nil";
      }
      v34[2] = v31;
      objc_exception_throw((id)objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, @"improper model with nonsensical relationship definitions", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v34, v33, 3)));
    }
    goto LABEL_12;
  }
LABEL_13:
  if (!a1[9])
  {
    id v9 = [NSString alloc];
    if (v4) {
      uint64_t v10 = *(unsigned int *)(v4 + 184);
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = (void *)[v9 initWithFormat:@"%@_%d%@", @"Z", v10, objc_msgSend((id)objc_msgSend((id)a2, "name"), "uppercaseString")];
    if (v4) {
      uint64_t v12 = *(void *)(v4 + 176);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v12, v11);
    v14 = (void *)a1[9];
    if (v14 != (void *)v13)
    {
      v15 = (void *)v13;

      a1[9] = [v15 copy];
    }
  }
  if (!a1[10])
  {
    v16 = a2 ? (void *)[(id)a2 propertyDescription] : 0;
    if ([v16 isOrdered])
    {
      id v17 = [NSString alloc];
      if (v4) {
        uint64_t v18 = *(unsigned int *)(v4 + 184);
      }
      else {
        uint64_t v18 = 0;
      }
      v19 = (void *)[v17 initWithFormat:@"%@_%d%@", @"Z_FOK", v18, objc_msgSend((id)objc_msgSend((id)a2, "name"), "uppercaseString")];
      if (v4) {
        uint64_t v20 = *(void *)(v4 + 176);
      }
      else {
        uint64_t v20 = 0;
      }
      id v32 = v19;
      uint64_t v21 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v20, v19);
      v22 = (void *)a1[10];
      if (v22 != (void *)v21)
      {
        v23 = (void *)v21;

        a1[10] = [v23 copy];
      }
    }
  }
}

- (id)correlationTableName
{
  if (self->_correlationTableName) {
    return self->_correlationTableName;
  }
  else {
    return [(NSSQLRelationship *)self->super._inverse correlationTableName];
  }
}

- (id)columnName
{
  return self->_columnName;
}

- (__CFString)inverseColumnName
{
  if (result)
  {
    if ((__CFString *)result[1].length == result) {
      return @"REFLEXIVE";
    }
    else {
      return (__CFString *)[(id)result[1].length columnName];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLManyToMany;
  [(NSSQLRelationship *)&v3 dealloc];
}

- (uint64_t)isTableSchemaEqual:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  result = objc_msgSend(*(id *)(result + 72), "isEqualToString:", -[__CFString columnName](a2, "columnName"));
  if (!result) {
    return result;
  }
  result = objc_msgSend(*(id *)(v3 + 64), "isEqualToString:", -[__CFString correlationTableName](a2, "correlationTableName"));
  if (!result) {
    return result;
  }
  uint64_t v4 = *(void **)(v3 + 56);
  if (v4 == (void *)v3)
  {
    id v5 = @"REFLEXIVE";
    if (a2) {
      goto LABEL_6;
    }
LABEL_9:
    result = [(__CFString *)v5 isEqualToString:0];
    if (!result) {
      return result;
    }
    if (*(void *)(v3 + 80)) {
      return 0;
    }
    goto LABEL_17;
  }
  id v5 = (__CFString *)[v4 columnName];
  if (!a2) {
    goto LABEL_9;
  }
LABEL_6:
  length = (__CFString *)a2[1].length;
  if (length == a2) {
    v7 = @"REFLEXIVE";
  }
  else {
    v7 = (__CFString *)[(__CFString *)length columnName];
  }
  if (([(__CFString *)v5 isEqualToString:v7] & 1) == 0) {
    return 0;
  }
  v8 = *(void **)(v3 + 80);
  if ((v8 != 0) == (a2[2].data == 0)) {
    return 0;
  }
  if (v8)
  {
    result = objc_msgSend(v8, "isEqualToString:");
    if (!result) {
      return result;
    }
  }
LABEL_17:
  uint64_t v9 = *(void *)(v3 + 56);
  if (v9 == v3)
  {
    if (objc_msgSend((id)objc_msgSend((id)v3, "propertyDescription"), "isOrdered")) {
      uint64_t v10 = @"FOK_REFLEXIVE";
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else if (v9)
  {
    uint64_t v10 = *(__CFString **)(v9 + 80);
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = -[NSSQLManyToMany inverseOrderColumnName](a2);
  if ((v10 != 0) == (v11 == 0)) {
    return 0;
  }
  if (!v10) {
    return 1;
  }
  result = [(__CFString *)v10 isEqualToString:v11];
  if (result) {
    return 1;
  }
  return result;
}

@end