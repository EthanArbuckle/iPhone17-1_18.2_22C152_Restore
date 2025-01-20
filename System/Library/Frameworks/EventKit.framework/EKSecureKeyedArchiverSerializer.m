@interface EKSecureKeyedArchiverSerializer
- (EKEventStore)eventStore;
- (EKSecureKeyedArchiverSerializer)initWithEventStore:(id)a3 withVersion:(id)a4;
- (NSString)version;
- (id)deserializeData:(id)a3 isNew:(id *)a4 error:(id *)a5;
- (id)serializeEvent:(id)a3 error:(id *)a4;
- (id)versionFromData:(id)a3 error:(id *)a4;
@end

@implementation EKSecureKeyedArchiverSerializer

- (EKSecureKeyedArchiverSerializer)initWithEventStore:(id)a3 withVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKSecureKeyedArchiverSerializer;
  v9 = [(EKSecureKeyedArchiverSerializer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    uint64_t v11 = [v8 copy];
    version = v10->_version;
    v10->_version = (NSString *)v11;
  }
  return v10;
}

- (id)deserializeData:(id)a3 isNew:(id *)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v25[0] = 0;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:v25];
  id v10 = v25[0];
  uint64_t v11 = v10;
  if (!v9)
  {
    if (a5)
    {
      v18 = 0;
      *a5 = v10;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v12 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
  v13 = [(EKSecureKeyedArchiverSerializer *)self version];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    if (a5)
    {
      v19 = NSString;
      v20 = [(EKSecureKeyedArchiverSerializer *)self version];
      v21 = [v19 stringWithFormat:@"Version mismatch. Archiver version: [%@]. Encoded Data Version: [%@].", v20, v12];

      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = v21;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      *a5 = [v22 errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:v23];
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }

  v15 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
  v16 = v15;
  if (a4)
  {
    *a4 = [v15 isNew];
  }
  v17 = [(EKSecureKeyedArchiverSerializer *)self eventStore];
  v18 = [v16 createEventInEventStore:v17];

LABEL_12:

  return v18;
}

- (id)serializeEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[EKSerializableEvent alloc] initWithEvent:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  id v8 = [(EKSecureKeyedArchiverSerializer *)self version];
  [v7 encodeObject:v8 forKey:@"Version"];

  [v7 encodeObject:v6 forKey:@"Data"];
  v9 = [v7 encodedData];

  return v9;
}

- (id)versionFromData:(id)a3 error:(id *)a4
{
  v11[5] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  v11[0] = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:v11];
  id v7 = v11[0];
  id v8 = v7;
  if (v6)
  {
    v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
  }
  else
  {
    v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v9;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end