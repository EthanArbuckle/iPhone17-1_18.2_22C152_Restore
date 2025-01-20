@interface SGName
+ (BOOL)supportsSecureCoding;
+ (id)nameWithFirstName:(id)a3 lastName:(id)a4 middleName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 withRecordId:(id)a9 origin:(id)a10;
+ (id)nameWithFirstName:(id)a3 lastName:(id)a4 withRecordId:(id)a5 origin:(id)a6;
+ (id)nameWithFirstName:(id)a3 withRecordId:(id)a4 origin:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToName:(id)a3;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)prefix;
- (NSString)suffix;
- (SGExtractionInfo)extractionInfo;
- (SGName)initWithCoder:(id)a3;
- (SGName)initWithFirstName:(id)a3 middleName:(id)a4 lastName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 recordId:(id)a9 origin:(id)a10;
- (SGName)initWithFirstName:(id)a3 middleName:(id)a4 lastName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 recordId:(id)a9 origin:(id)a10 extractionInfo:(id)a11;
- (id)description;
- (id)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGName

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (id)description
{
  id v3 = [NSString alloc];
  fullName = self->_fullName;
  id v15 = v3;
  prefix = self->_prefix;
  if (prefix) {
    v5 = (__CFString *)[[NSString alloc] initWithFormat:@"%@ ", self->_prefix];
  }
  else {
    v5 = &stru_1EF915628;
  }
  if (self->_firstName) {
    firstName = (__CFString *)self->_firstName;
  }
  else {
    firstName = &stru_1EF915628;
  }
  middleName = self->_middleName;
  if (middleName) {
    v8 = @" ";
  }
  else {
    v8 = &stru_1EF915628;
  }
  if (middleName) {
    v9 = (__CFString *)self->_middleName;
  }
  else {
    v9 = &stru_1EF915628;
  }
  if (self->_lastName) {
    lastName = (__CFString *)self->_lastName;
  }
  else {
    lastName = &stru_1EF915628;
  }
  if (self->_suffix)
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"%@ ", self->_suffix];
    v12 = (void *)[v15 initWithFormat:@"<SGName[%@]: %@{%@}%@%@ {%@}%@>", fullName, v5, firstName, v8, v9, lastName, v11];

    if (!prefix) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v12 = (void *)[v15 initWithFormat:@"<SGName[%@]: %@{%@}%@%@ {%@}%@>", fullName, v5, firstName, v8, v9, lastName, &stru_1EF915628];
  if (prefix) {
LABEL_18:
  }

LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_firstName hash];
  NSUInteger v4 = [(NSString *)self->_lastName hash] - v3 + 32 * v3;
  return [(NSString *)self->_fullName hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToName:(id)a3
{
  NSUInteger v4 = a3;
  if ([(SGObject *)self isEqualToSuggestion:v4])
  {
    v5 = self->_fullName;
    v6 = v5;
    if (v5 == (NSString *)v4[3]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGName *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGName *)self isEqualToName:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGName;
  id v4 = a3;
  [(SGObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_firstName, @"firstName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_middleName forKey:@"middleName"];
  [v4 encodeObject:self->_lastName forKey:@"lastName"];
  [v4 encodeObject:self->_fullName forKey:@"fullName"];
  [v4 encodeObject:self->_prefix forKey:@"prefix"];
  [v4 encodeObject:self->_suffix forKey:@"suffix"];
  [v4 encodeObject:self->_extractionInfo forKey:@"extractionInfo"];
}

- (SGName)initWithCoder:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SGName;
  BOOL v6 = [(SGObject *)&v30 initWithCoder:v5];
  if (v6)
  {
    char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"firstName"];
    firstName = v6->_firstName;
    v6->_firstName = (NSString *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v5 decodeObjectOfClasses:v10 forKey:@"middleName"];
    middleName = v6->_middleName;
    v6->_middleName = (NSString *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"lastName"];
    lastName = v6->_lastName;
    v6->_lastName = (NSString *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v17 = [v5 decodeObjectOfClasses:v16 forKey:@"fullName"];

    if (v17)
    {
      v18 = v17;
      fullName = v6->_fullName;
      v6->_fullName = v18;
    }
    else
    {
      fullName = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(fullName, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGName.m", 71, @"nonnull property %s *%s was null when decoded", "NSString", "fullName");
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v5 decodeObjectOfClasses:v20 forKey:@"prefix"];
    prefix = v6->_prefix;
    v6->_prefix = (NSString *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v24 = [v5 decodeObjectOfClasses:v23 forKey:@"suffix"];
    suffix = v6->_suffix;
    v6->_suffix = (NSString *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v27 = [v5 decodeObjectOfClasses:v26 forKey:@"extractionInfo"];
    extractionInfo = v6->_extractionInfo;
    v6->_extractionInfo = (SGExtractionInfo *)v27;
  }
  return v6;
}

- (id)name
{
  return self->_fullName;
}

- (SGName)initWithFirstName:(id)a3 middleName:(id)a4 lastName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 recordId:(id)a9 origin:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = +[SGExtractionInfo extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
  v26 = [(SGName *)self initWithFirstName:v24 middleName:v23 lastName:v22 fullName:v21 prefix:v20 suffix:v19 recordId:v18 origin:v17 extractionInfo:v25];

  return v26;
}

- (SGName)initWithFirstName:(id)a3 middleName:(id)a4 lastName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 recordId:(id)a9 origin:(id)a10 extractionInfo:(id)a11
{
  id v41 = a3;
  id v40 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (!v18)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SGName.m", 27, @"Invalid parameter not satisfying: %@", @"fullName" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)SGName;
  id v24 = [(SGObject *)&v42 initWithRecordId:v21 origin:v22];
  if (v24)
  {
    uint64_t v25 = [v41 copy];
    firstName = v24->_firstName;
    v24->_firstName = (NSString *)v25;

    uint64_t v27 = [v40 copy];
    middleName = v24->_middleName;
    v24->_middleName = (NSString *)v27;

    uint64_t v29 = [v17 copy];
    lastName = v24->_lastName;
    v24->_lastName = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    prefix = v24->_prefix;
    v24->_prefix = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    suffix = v24->_suffix;
    v24->_suffix = (NSString *)v33;

    uint64_t v35 = [v18 copy];
    fullName = v24->_fullName;
    v24->_fullName = (NSString *)v35;

    objc_storeStrong((id *)&v24->_extractionInfo, a11);
  }

  return v24;
}

+ (id)nameWithFirstName:(id)a3 withRecordId:(id)a4 origin:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[SGName alloc] initWithFirstName:v9 middleName:0 lastName:0 fullName:v9 prefix:0 suffix:0 recordId:v8 origin:v7];

  return v10;
}

+ (id)nameWithFirstName:(id)a3 lastName:(id)a4 withRecordId:(id)a5 origin:(id)a6
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [SGName alloc];
  v18[0] = v12;
  v18[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v15 = objc_msgSend(v14, "_pas_componentsJoinedByString:", @" ");
  v16 = [(SGName *)v13 initWithFirstName:v12 middleName:0 lastName:v11 fullName:v15 prefix:0 suffix:0 recordId:v10 origin:v9];

  return v16;
}

+ (id)nameWithFirstName:(id)a3 lastName:(id)a4 middleName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 withRecordId:(id)a9 origin:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = [[SGName alloc] initWithFirstName:v23 middleName:v21 lastName:v22 fullName:v20 prefix:v19 suffix:v18 recordId:v17 origin:v16];

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end