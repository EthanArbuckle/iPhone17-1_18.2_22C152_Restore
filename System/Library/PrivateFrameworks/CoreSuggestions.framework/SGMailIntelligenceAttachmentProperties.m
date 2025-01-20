@interface SGMailIntelligenceAttachmentProperties
+ (BOOL)supportsSecureCoding;
- (NSArray)authors;
- (NSArray)keywords;
- (NSNumber)fileSizeInBytes;
- (NSString)fileDescription;
- (NSString)fileName;
- (SGMailIntelligenceAttachmentProperties)initWithCoder:(id)a3;
- (SGMailIntelligenceAttachmentProperties)initWithFileName:(id)a3 fileSizeInBytes:(id)a4 fileDescription:(id)a5 keywords:(id)a6 authors:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMailIntelligenceAttachmentProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_fileDescription, 0);
  objc_storeStrong((id *)&self->_fileSizeInBytes, 0);

  objc_storeStrong((id *)&self->_fileName, 0);
}

- (NSArray)authors
{
  return self->_authors;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)fileDescription
{
  return self->_fileDescription;
}

- (NSNumber)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGMailIntelligenceAttachmentProperties: %@ (%@B) %@>", self->_fileName, self->_fileSizeInBytes, self->_fileDescription];

  return v2;
}

- (SGMailIntelligenceAttachmentProperties)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  v6 = sgMailIntelligenceLogHandle();
  v33 = objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, @"fileName", v3, 0, v6);

  v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  v9 = sgMailIntelligenceLogHandle();
  uint64_t v34 = [v7 robustDecodeObjectOfClass:v8 forKey:@"fileSizeInBytes" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v9];

  v10 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v11 = objc_opt_class();
  v12 = sgMailIntelligenceLogHandle();
  uint64_t v32 = [v10 robustDecodeObjectOfClass:v11 forKey:@"fileDescription" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v12];

  v13 = (void *)MEMORY[0x1E4F93B90];
  v14 = (void *)MEMORY[0x1A6265250]();
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  v18 = sgMailIntelligenceLogHandle();
  v19 = [v13 robustDecodeObjectOfClasses:v17 forKey:@"keywords" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v18];

  v20 = (void *)MEMORY[0x1E4F93B90];
  v21 = (void *)MEMORY[0x1A6265250]();
  id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "initWithObjects:", v23, objc_opt_class(), 0);
  v25 = sgMailIntelligenceLogHandle();
  v26 = [v20 robustDecodeObjectOfClasses:v24 forKey:@"authors" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v25];

  v27 = 0;
  if (!v33)
  {
    v28 = (void *)v34;
    goto LABEL_10;
  }
  v28 = (void *)v34;
  if (!v34)
  {
LABEL_10:
    v29 = (void *)v32;
    goto LABEL_11;
  }
  v29 = (void *)v32;
  if (v32 && v19 && v26)
  {
    v30 = [v3 error];

    if (v30) {
      v27 = 0;
    }
    else {
      v27 = [[SGMailIntelligenceAttachmentProperties alloc] initWithFileName:v33 fileSizeInBytes:v34 fileDescription:v32 keywords:v19 authors:v26];
    }
  }
LABEL_11:

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  fileName = self->_fileName;
  id v5 = a3;
  [v5 encodeObject:fileName forKey:@"fileName"];
  [v5 encodeObject:self->_fileSizeInBytes forKey:@"fileSizeInBytes"];
  [v5 encodeObject:self->_fileDescription forKey:@"fileDescription"];
  [v5 encodeObject:self->_keywords forKey:@"keywords"];
  [v5 encodeObject:self->_authors forKey:@"authors"];
}

- (SGMailIntelligenceAttachmentProperties)initWithFileName:(id)a3 fileSizeInBytes:(id)a4 fileDescription:(id)a5 keywords:(id)a6 authors:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGMailIntelligenceWarning.m", 533, @"Invalid parameter not satisfying: %@", @"fileName != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SGMailIntelligenceWarning.m", 534, @"Invalid parameter not satisfying: %@", @"fileSizeInBytes != nil" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)SGMailIntelligenceAttachmentProperties;
  v17 = [(SGMailIntelligenceAttachmentProperties *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fileName, a3);
    objc_storeStrong((id *)&v18->_fileSizeInBytes, a4);
    objc_storeStrong((id *)&v18->_fileDescription, a5);
    objc_storeStrong((id *)&v18->_keywords, a6);
    objc_storeStrong((id *)&v18->_authors, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end