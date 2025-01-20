@interface SGURL
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToURL:(id)a3;
- (NSDate)documentDate;
- (NSDate)receivedAt;
- (NSString)bundleIdentifier;
- (NSString)documentIdentifier;
- (NSString)documentTitle;
- (NSString)groupIdentifier;
- (NSString)receivedFromHandle;
- (NSString)title;
- (NSURL)url;
- (SGURL)initWithCoder:(id)a3;
- (SGURL)initWithURL:(id)a3 title:(id)a4 receivedFromHandle:(id)a5 bundleIdentifier:(id)a6 groupIdentifier:(id)a7 documentIdentifier:(id)a8 documentTitle:(id)a9 documentDate:(id)a10 documentTimeInterval:(double)a11 receivedAt:(id)a12 flags:(unsigned __int8)a13;
- (double)documentTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)feedbackDescription;
- (id)nonFeedbackFlagDescription;
- (unint64_t)hash;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGURL

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedAt, 0);
  objc_storeStrong((id *)&self->_documentDate, 0);
  objc_storeStrong((id *)&self->_documentTitle, 0);
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_receivedFromHandle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSDate)receivedAt
{
  return self->_receivedAt;
}

- (double)documentTimeInterval
{
  return self->_documentTimeInterval;
}

- (NSDate)documentDate
{
  return self->_documentDate;
}

- (NSString)documentTitle
{
  return self->_documentTitle;
}

- (NSString)documentIdentifier
{
  return self->_documentIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)receivedFromHandle
{
  return self->_receivedFromHandle;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isEqualToURL:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_32;
  }
  url = self->_url;
  v7 = (NSURL *)v4[2];
  if (url == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = url;
    char v10 = [(NSURL *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_32;
    }
  }
  title = self->_title;
  v12 = (NSString *)v5[3];
  if (title == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = title;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_32;
    }
  }
  receivedFromHandle = self->_receivedFromHandle;
  v17 = (NSString *)v5[4];
  if (receivedFromHandle == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = receivedFromHandle;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_32;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  v22 = (NSString *)v5[5];
  if (bundleIdentifier == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = bundleIdentifier;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_32;
    }
  }
  groupIdentifier = self->_groupIdentifier;
  v27 = (NSString *)v5[6];
  if (groupIdentifier == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = groupIdentifier;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_32;
    }
  }
  documentIdentifier = self->_documentIdentifier;
  v32 = (NSString *)v5[7];
  if (documentIdentifier == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = documentIdentifier;
    char v35 = [(NSString *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_32;
    }
  }
  documentTitle = self->_documentTitle;
  v37 = (NSString *)v5[8];
  if (documentTitle == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = documentTitle;
    char v40 = [(NSString *)v39 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_32;
    }
  }
  documentDate = self->_documentDate;
  v42 = (NSDate *)v5[9];
  if (documentDate == v42)
  {

LABEL_35:
    v48 = [NSNumber numberWithDouble:self->_documentTimeInterval];
    v49 = [NSNumber numberWithDouble:*((double *)v5 + 10)];
    if ([v48 isEqualToNumber:v49])
    {
      receivedAt = self->_receivedAt;
      v51 = (NSDate *)v5[11];
      if (receivedAt == v51)
      {
      }
      else
      {
        v52 = v51;
        v53 = receivedAt;
        char v54 = [(NSDate *)v53 isEqual:v52];

        if ((v54 & 1) == 0) {
          goto LABEL_38;
        }
      }
      BOOL v46 = self->_flags == *((unsigned __int8 *)v5 + 8);
      goto LABEL_41;
    }
LABEL_38:
    BOOL v46 = 0;
LABEL_41:

    goto LABEL_33;
  }
  v43 = v42;
  v44 = documentDate;
  char v45 = [(NSDate *)v44 isEqual:v43];

  if (v45) {
    goto LABEL_35;
  }
LABEL_32:
  BOOL v46 = 0;
LABEL_33:

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGURL *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGURL *)self isEqualToURL:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v18 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[(NSURL *)self->_url copyWithZone:a3];
  BOOL v6 = (void *)[(NSString *)self->_title copyWithZone:a3];
  v7 = (void *)[(NSString *)self->_receivedFromHandle copyWithZone:a3];
  v8 = (void *)[(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = (void *)[(NSString *)self->_groupIdentifier copyWithZone:a3];
  char v10 = (void *)[(NSString *)self->_documentIdentifier copyWithZone:a3];
  v11 = (void *)[(NSString *)self->_documentTitle copyWithZone:a3];
  v12 = (void *)[(NSDate *)self->_documentDate copyWithZone:a3];
  double documentTimeInterval = self->_documentTimeInterval;
  v14 = (void *)[(NSDate *)self->_receivedAt copyWithZone:a3];
  LOBYTE(v17) = self->_flags;
  char v15 = (void *)[v18 initWithURL:v5 title:v6 receivedFromHandle:v7 bundleIdentifier:v8 groupIdentifier:v9 documentIdentifier:v10 documentTitle:documentTimeInterval documentDate:v11 documentTimeInterval:v12 receivedAt:v14 flags:v17];

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_url hash];
  return [(NSString *)self->_title hash] - v3 + 32 * v3;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_title forKey:@"ttl"];
  [v5 encodeObject:self->_receivedFromHandle forKey:@"rch"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bid"];
  [v5 encodeObject:self->_groupIdentifier forKey:@"gid"];
  [v5 encodeObject:self->_documentIdentifier forKey:@"did"];
  [v5 encodeObject:self->_documentTitle forKey:@"dtl"];
  [v5 encodeObject:self->_documentDate forKey:@"ddt"];
  [v5 encodeDouble:@"dti" forKey:self->_documentTimeInterval];
  [v5 encodeObject:self->_receivedAt forKey:@"rca"];
  [v5 encodeInt32:self->_flags forKey:@"flg"];
}

- (SGURL)initWithCoder:(id)a3
{
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x1A6265250]();
  v7 = (void *)MEMORY[0x1A6265250]();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  v9 = (void *)MEMORY[0x1A6265250]();
  char v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  unsigned int v11 = [v5 decodeInt32ForKey:@"flg"];
  if (v11 <= 0xFF)
  {
    char v38 = v11;
    v41 = v10;
    char v40 = v6;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"url"];

    v39 = (void *)v14;
    if (!v14)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, self, @"SGURL.m", 133, @"nonnull %s %@ was null when decoded", "NSURL", @"url" object file lineNumber description];
    }
    v37 = [v5 decodeObjectOfClasses:v8 forKey:@"ttl"];
    v36 = [v5 decodeObjectOfClasses:v8 forKey:@"rch"];
    char v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v5 decodeObjectOfClasses:v15 forKey:@"bid"];

    uint64_t v17 = (void *)v16;
    if (!v16)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, self, @"SGURL.m", 136, @"nonnull %s %@ was null when decoded", "NSString", @"bid" object file lineNumber description];
    }
    char v35 = [v5 decodeObjectOfClasses:v8 forKey:@"gid"];
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v5 decodeObjectOfClasses:v18 forKey:@"did"];

    v34 = (void *)v19;
    if (!v19)
    {
      char v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, self, @"SGURL.m", 138, @"nonnull %s %@ was null when decoded", "NSString", @"did" object file lineNumber description];
    }
    SEL v33 = a2;
    char v20 = self;
    v21 = [v5 decodeObjectOfClasses:v8 forKey:@"dtl"];
    v22 = [v5 decodeObjectOfClasses:v41 forKey:@"ddt"];
    [v5 decodeDoubleForKey:@"dti"];
    double v24 = v23;
    char v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v26 = [v5 decodeObjectOfClasses:v25 forKey:@"rca"];

    if (!v26)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:v33, v20, @"SGURL.m", 142, @"nonnull %s %@ was null when decoded", "NSDate", @"rca" object file lineNumber description];
    }
    LOBYTE(v32) = v38;
    self = [(SGURL *)v20 initWithURL:v39 title:v37 receivedFromHandle:v36 bundleIdentifier:v17 groupIdentifier:v35 documentIdentifier:v34 documentTitle:v24 documentDate:v21 documentTimeInterval:v22 receivedAt:v26 flags:v32];

    v12 = self;
    BOOL v6 = v40;
    char v10 = v41;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)nonFeedbackFlagDescription
{
  uint64_t v3 = objc_opt_new();
  v4 = v3;
  unsigned __int8 flags = self->_flags;
  if (flags)
  {
    [v3 addObject:@"outgoing"];
    unsigned __int8 flags = self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"communication"];
  unsigned __int8 flags = self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0) {
      goto LABEL_5;
    }
LABEL_12:
    [v4 addObject:@"ending date"];
    if ((self->_flags & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  [v4 addObject:@"time range"];
  unsigned __int8 flags = self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_12;
  }
LABEL_5:
  if ((flags & 0x80) == 0) {
    goto LABEL_6;
  }
LABEL_13:
  [v4 addObject:@"starting date"];
LABEL_6:
  BOOL v6 = objc_msgSend(v4, "_pas_componentsJoinedByString:", @", ");

  return v6;
}

- (id)feedbackDescription
{
  uint64_t v3 = objc_opt_new();
  v4 = v3;
  unsigned __int8 flags = self->_flags;
  if ((flags & 2) != 0)
  {
    [v3 addObject:@"engaged"];
    unsigned __int8 flags = self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"offered"];
  if ((self->_flags & 4) != 0) {
LABEL_4:
  }
    [v4 addObject:@"rejected"];
LABEL_5:
  BOOL v6 = objc_msgSend(v4, "_pas_componentsJoinedByString:", @", ");

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v11 = *(_OWORD *)&self->_url;
  long long v10 = *(_OWORD *)&self->_receivedFromHandle;
  groupIdentifier = self->_groupIdentifier;
  documentIdentifier = self->_documentIdentifier;
  receivedAt = self->_receivedAt;
  [(NSDate *)receivedAt timeIntervalSince1970];
  v8 = (void *)[v3 initWithFormat:@"<SGURL u:%@ t:'%@' r:%@ b:%@ g:%@ d:%@ t:%@ (%f) f:%d>", v11, v10, groupIdentifier, documentIdentifier, receivedAt, v7, self->_flags];

  return v8;
}

- (SGURL)initWithURL:(id)a3 title:(id)a4 receivedFromHandle:(id)a5 bundleIdentifier:(id)a6 groupIdentifier:(id)a7 documentIdentifier:(id)a8 documentTitle:(id)a9 documentDate:(id)a10 documentTimeInterval:(double)a11 receivedAt:(id)a12 flags:(unsigned __int8)a13
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v21 = a12;
  v33.receiver = self;
  v33.super_class = (Class)SGURL;
  v22 = [(SGURL *)&v33 init];
  double v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_url, a3);
    objc_storeStrong((id *)&v23->_title, a4);
    objc_storeStrong((id *)&v23->_receivedFromHandle, a5);
    objc_storeStrong((id *)&v23->_bundleIdentifier, a6);
    objc_storeStrong((id *)&v23->_groupIdentifier, a7);
    objc_storeStrong((id *)&v23->_documentIdentifier, a8);
    objc_storeStrong((id *)&v23->_documentTitle, a9);
    objc_storeStrong((id *)&v23->_documentDate, a10);
    v23->_double documentTimeInterval = a11;
    objc_storeStrong((id *)&v23->_receivedAt, a12);
    v23->_unsigned __int8 flags = a13;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end