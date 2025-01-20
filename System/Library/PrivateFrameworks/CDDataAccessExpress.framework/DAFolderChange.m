@interface DAFolderChange
+ (BOOL)supportsSecureCoding;
- (BOOL)renameOnCollision;
- (DAFolderChange)initWithCoder:(id)a3;
- (DAFolderChangeConsumer)consumer;
- (NSString)displayName;
- (NSString)folderId;
- (NSString)parentFolderId;
- (id)description;
- (id)initFolderChangeWithChangeType:(unint64_t)a3 folderId:(id)a4 parentFolderId:(id)a5 displayName:(id)a6 dataclass:(int64_t)a7 consumer:(id)a8;
- (int64_t)dataclass;
- (unint64_t)changeType;
- (unsigned)taskId;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setConsumer:(id)a3;
- (void)setDataclass:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setFolderId:(id)a3;
- (void)setParentFolderId:(id)a3;
- (void)setRenameOnCollision:(BOOL)a3;
- (void)setTaskId:(unsigned int)a3;
@end

@implementation DAFolderChange

- (id)initFolderChangeWithChangeType:(unint64_t)a3 folderId:(id)a4 parentFolderId:(id)a5 displayName:(id)a6 dataclass:(int64_t)a7 consumer:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (a7 != 1)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"DAFolderChange.m" lineNumber:23 description:@"Only email folder manipulation is allowed at this time"];
  }
  if (a3 == 2)
  {
    if (v15) {
      goto LABEL_16;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = v19;
    v21 = @"Modify change types require a folder id";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 35;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    if (v15)
    {
      if (v17) {
        goto LABEL_16;
      }
    }
    else
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"DAFolderChange.m" lineNumber:31 description:@"Modify change types require a folder id"];

      if (v17) {
        goto LABEL_16;
      }
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = v19;
    v21 = @"Modify change types require a display name";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 32;
    goto LABEL_15;
  }
  if (a3)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = v19;
    unint64_t v32 = a3;
    v21 = @"Can't handle folder change type %ld";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 38;
    goto LABEL_15;
  }
  if (v16)
  {
    if (v17) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2 object:self file:@"DAFolderChange.m" lineNumber:27 description:@"Add change types require a parent id"];

  if (!v17)
  {
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = v19;
    v21 = @"Add change types require a display name";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 28;
LABEL_15:
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, @"DAFolderChange.m", v24, v21, v32);
  }
LABEL_16:
  if ([v17 isEqualToString:@"70FB9178-576E-4CAA-A08E-F68D57BFD01E"])
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"DAFolderChange.m" lineNumber:45 description:@"Don't push changes to the temp inbox"];
  }
  v33.receiver = self;
  v33.super_class = (Class)DAFolderChange;
  v25 = [(DAFolderChange *)&v33 init];
  v26 = v25;
  if (v25)
  {
    [(DAFolderChange *)v25 setChangeType:a3];
    [(DAFolderChange *)v26 setFolderId:v15];
    [(DAFolderChange *)v26 setParentFolderId:v16];
    [(DAFolderChange *)v26 setDisplayName:v17];
    [(DAFolderChange *)v26 setDataclass:a7];
    [(DAFolderChange *)v26 setConsumer:v18];
  }

  return v26;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(DAFolderChange *)self changeType];
  v7 = [(DAFolderChange *)self folderId];
  v8 = [(DAFolderChange *)self parentFolderId];
  v9 = [(DAFolderChange *)self displayName];
  v10 = [v3 stringWithFormat:@"%@ %p: changeType %ld folderId %@ parentFolderId %@ displayName %@ dataclass %ld", v5, self, v6, v7, v8, v9, -[DAFolderChange dataclass](self, "dataclass")];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAFolderChange)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DAFolderChange.m" lineNumber:68 description:@"Who does non-keyed coding nowadays?"];
  }
  v15.receiver = self;
  v15.super_class = (Class)DAFolderChange;
  unint64_t v6 = [(DAFolderChange *)&v15 init];
  if (v6)
  {
    unsigned int v7 = [v5 decodeIntForKey:@"DAFCChangeType"];
    uint64_t v8 = (int)v7;
    if (v7 >= 0xA)
    {
      v9 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v8;
        _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_FAULT, "Unknown DAItemChangeType %ld", buf, 0xCu);
      }

      uint64_t v8 = 1;
    }
    [(DAFolderChange *)v6 setChangeType:v8];
    v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAFCFolderId"];
    [(DAFolderChange *)v6 setFolderId:v10];

    v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAFCParentFolderId"];
    [(DAFolderChange *)v6 setParentFolderId:v11];

    v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAFCDisplayName"];
    [(DAFolderChange *)v6 setDisplayName:v12];

    -[DAFolderChange setDataclass:](v6, "setDataclass:", (int)[v5 decodeIntForKey:@"DAFCDataclass"]);
    -[DAFolderChange setRenameOnCollision:](v6, "setRenameOnCollision:", [v5 decodeBoolForKey:@"DAFCRenameOnCollision"]);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (([v9 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DAFolderChange.m" lineNumber:103 description:@"Who does non-keyed coding nowadays?"];
  }
  objc_msgSend(v9, "encodeInt:forKey:", -[DAFolderChange changeType](self, "changeType"), @"DAFCChangeType");
  id v5 = [(DAFolderChange *)self folderId];
  [v9 encodeObject:v5 forKey:@"DAFCFolderId"];

  unint64_t v6 = [(DAFolderChange *)self parentFolderId];
  [v9 encodeObject:v6 forKey:@"DAFCParentFolderId"];

  unsigned int v7 = [(DAFolderChange *)self displayName];
  [v9 encodeObject:v7 forKey:@"DAFCDisplayName"];

  objc_msgSend(v9, "encodeInt:forKey:", -[DAFolderChange dataclass](self, "dataclass"), @"DAFCDataclass");
  objc_msgSend(v9, "encodeBool:forKey:", -[DAFolderChange renameOnCollision](self, "renameOnCollision"), @"DAFCRenameOnCollision");
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (NSString)folderId
{
  return self->_folderId;
}

- (void)setFolderId:(id)a3
{
}

- (NSString)parentFolderId
{
  return self->_parentFolderId;
}

- (void)setParentFolderId:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(int64_t)a3
{
  self->_dataclass = a3;
}

- (unsigned)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(unsigned int)a3
{
  self->_taskId = a3;
}

- (BOOL)renameOnCollision
{
  return self->_renameOnCollision;
}

- (void)setRenameOnCollision:(BOOL)a3
{
  self->_renameOnCollision = a3;
}

- (DAFolderChangeConsumer)consumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);

  return (DAFolderChangeConsumer *)WeakRetained;
}

- (void)setConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consumer);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentFolderId, 0);

  objc_storeStrong((id *)&self->_folderId, 0);
}

@end