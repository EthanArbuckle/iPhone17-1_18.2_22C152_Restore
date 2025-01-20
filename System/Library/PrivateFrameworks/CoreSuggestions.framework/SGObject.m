@interface SGObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSuggestion:(id)a3;
- (SGObject)initWithCoder:(id)a3;
- (SGObject)initWithRecordId:(id)a3 origin:(id)a4;
- (SGOrigin)origin;
- (SGRecordId)recordId;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);

  objc_storeStrong((id *)&self->_recordId, 0);
}

- (SGOrigin)origin
{
  return self->_origin;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGObject\n  recordId:%@\n  origin:%@\n]", self->_recordId, self->_origin];

  return v2;
}

- (unint64_t)hash
{
  return [(SGRecordId *)self->_recordId hash];
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  v4 = (id *)a3;
  recordId = self->_recordId;
  v6 = (SGRecordId *)v4[1];
  if (recordId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = recordId;
    BOOL v9 = [(SGRecordId *)v8 isEqual:v7];

    if (!v9)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_origin;
  v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[SGOrigin isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGObject *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGObject *)self isEqualToSuggestion:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  recordId = self->_recordId;
  id v5 = a3;
  [v5 encodeObject:recordId forKey:@"recordId"];
  [v5 encodeObject:self->_origin forKey:@"origin"];
}

- (SGObject)initWithCoder:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGObject;
  BOOL v6 = [(SGObject *)&v16 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"recordId"];

    if (v8)
    {
      BOOL v9 = v8;
      recordId = v6->_recordId;
      v6->_recordId = v9;
    }
    else
    {
      recordId = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(recordId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGObject.m", 34, @"nonnull property %s *%s was null when decoded", "SGRecordId", "recordId");
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v12 = [v5 decodeObjectOfClasses:v11 forKey:@"origin"];

    if (v12)
    {
      v13 = v12;
      origin = v6->_origin;
      v6->_origin = v13;
    }
    else
    {
      origin = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(origin, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGObject.m", 35, @"nonnull property %s *%s was null when decoded", "SGOrigin", "origin");
    }
  }
  return v6;
}

- (SGObject)initWithRecordId:(id)a3 origin:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SGObject;
  BOOL v9 = [(SGObject *)&v17 init];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        uint64_t v10 = [v7 copy];
        recordId = v9->_recordId;
        v9->_recordId = (SGRecordId *)v10;

        uint64_t v12 = [v8 copy];
        origin = v9->_origin;
        v9->_origin = (SGOrigin *)v12;

        goto LABEL_5;
      }
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v9, @"SGObject.m", 23, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];

      if (v8) {
        goto LABEL_4;
      }
    }
    objc_super v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v9, @"SGObject.m", 24, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end