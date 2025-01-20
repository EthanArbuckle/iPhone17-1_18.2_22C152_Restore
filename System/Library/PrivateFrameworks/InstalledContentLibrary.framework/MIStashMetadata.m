@interface MIStashMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (MIStashMetadata)initWithCoder:(id)a3;
- (NSDate)dateOriginallyInstalled;
- (NSDate)dateStashed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateOriginallyInstalled:(id)a3;
- (void)setDateStashed:(id)a3;
@end

@implementation MIStashMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStashMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIStashMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStashed"];
    dateStashed = v5->_dateStashed;
    v5->_dateStashed = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateOriginallyInstalled"];
    dateOriginallyInstalled = v5->_dateOriginallyInstalled;
    v5->_dateOriginallyInstalled = (NSDate *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(MIStashMetadata *)self dateStashed];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setDateStashed:v6];

  v7 = [(MIStashMetadata *)self dateOriginallyInstalled];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setDateOriginallyInstalled:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIStashMetadata *)self dateStashed];
  [v4 encodeObject:v5 forKey:@"dateStashed"];

  id v6 = [(MIStashMetadata *)self dateOriginallyInstalled];
  [v4 encodeObject:v6 forKey:@"dateOriginallyInstalled"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIStashMetadata *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MIStashMetadata *)self dateStashed];
      v7 = [(MIStashMetadata *)v5 dateStashed];
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = [(MIStashMetadata *)self dateOriginallyInstalled];
        v10 = [(MIStashMetadata *)v5 dateOriginallyInstalled];
        BOOL v11 = MICompareObjects(v9, v10);
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(MIStashMetadata *)self dateStashed];
  uint64_t v4 = [v3 hash];
  v5 = [(MIStashMetadata *)self dateOriginallyInstalled];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(MIStashMetadata *)self dateStashed];
  v7 = [(MIStashMetadata *)self dateOriginallyInstalled];
  BOOL v8 = [v3 stringWithFormat:@"<%@<%p> dateStashed=%@ dateOriginallyInstalled=%@>", v5, self, v6, v7];

  return v8;
}

+ (id)metadataFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v26 = 0;
  unint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:3 error:&v26];
  id v7 = v26;
  BOOL v8 = v7;
  if (!v6)
  {
    v16 = [v7 domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v17 = [v8 code];

      if (v17 == 260) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v20 = [v5 path];
    uint64_t v22 = _CreateAndLogError((uint64_t)"+[MIStashMetadata metadataFromURL:error:]", 108, @"MIInstallerErrorDomain", 130, v8, 0, @"Failed to read stash metadata from %@", v21, (uint64_t)v20);

    v9 = 0;
    BOOL v11 = 0;
    BOOL v8 = (void *)v22;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  id v25 = v7;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v25];
  id v10 = v25;

  if (!v9)
  {
    v18 = [v5 path];
    BOOL v8 = _CreateAndLogError((uint64_t)"+[MIStashMetadata metadataFromURL:error:]", 115, @"MIInstallerErrorDomain", 130, v10, 0, @"Failed to read stash metadata from %@", v19, (uint64_t)v18);

LABEL_11:
    v9 = 0;
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  BOOL v11 = [v9 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  if (!v11)
  {
    v12 = [v9 error];
    v13 = [v5 path];
    uint64_t v15 = _CreateAndLogError((uint64_t)"+[MIStashMetadata metadataFromURL:error:]", 121, @"MIInstallerErrorDomain", 130, v12, 0, @"Failed to decode stash metadata from %@", v14, (uint64_t)v13);

    id v10 = (id)v15;
  }
  [v9 finishDecoding];
  BOOL v8 = v10;
  if (a4)
  {
LABEL_15:
    if (!v11) {
      *a4 = v8;
    }
  }
LABEL_17:
  id v23 = v11;

  return v23;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v7 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  BOOL v8 = [v7 encodedData];

  if (v8)
  {
    id v15 = 0;
    char v9 = [v8 writeToURL:v6 options:268435457 error:&v15];
    id v10 = v15;
    if ((v9 & 1) == 0)
    {
      BOOL v11 = [v6 path];
      uint64_t v13 = _CreateAndLogError((uint64_t)"-[MIStashMetadata serializeToURL:error:]", 159, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to write serialized MIStashedBundleMetadata to %@", v12, (uint64_t)v11);

      id v10 = (id)v13;
    }
    if (a4 && v10)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10 == 0;
}

- (NSDate)dateStashed
{
  return self->_dateStashed;
}

- (void)setDateStashed:(id)a3
{
}

- (NSDate)dateOriginallyInstalled
{
  return self->_dateOriginallyInstalled;
}

- (void)setDateOriginallyInstalled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOriginallyInstalled, 0);
  objc_storeStrong((id *)&self->_dateStashed, 0);
}

@end