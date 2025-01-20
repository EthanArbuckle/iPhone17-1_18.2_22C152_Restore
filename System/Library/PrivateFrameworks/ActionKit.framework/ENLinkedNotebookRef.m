@interface ENLinkedNotebookRef
+ (id)linkedNotebookRefFromLinkedNotebook:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ENLinkedNotebookRef)initWithCoder:(id)a3;
- (NSString)guid;
- (NSString)noteStoreUrl;
- (NSString)shardId;
- (NSString)sharedNotebookGlobalId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGuid:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
- (void)setShardId:(id)a3;
- (void)setSharedNotebookGlobalId:(id)a3;
@end

@implementation ENLinkedNotebookRef

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedNotebookGlobalId, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setSharedNotebookGlobalId:(id)a3
{
}

- (NSString)sharedNotebookGlobalId
{
  return self->_sharedNotebookGlobalId;
}

- (void)setShardId:(id)a3
{
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setNoteStoreUrl:(id)a3
{
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (unint64_t)hash
{
  v3 = [(ENLinkedNotebookRef *)self guid];
  uint64_t v4 = [v3 hash];

  v5 = [(ENLinkedNotebookRef *)self noteStoreUrl];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(ENLinkedNotebookRef *)self shardId];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  v9 = [(ENLinkedNotebookRef *)self sharedNotebookGlobalId];
  unint64_t v10 = [v9 hash] - v8 + 32 * v8 + 923521;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (ENLinkedNotebookRef *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        uint64_t v8 = [(ENLinkedNotebookRef *)v7 guid];
        v9 = [(ENLinkedNotebookRef *)self guid];
        if (v8 != v9)
        {
          unint64_t v10 = [(ENLinkedNotebookRef *)v7 guid];
          v3 = [(ENLinkedNotebookRef *)self guid];
          v33 = v10;
          if (![v10 isEqualToString:v3])
          {
            char v11 = 0;
            goto LABEL_26;
          }
        }
        v12 = [(ENLinkedNotebookRef *)v7 noteStoreUrl];
        v13 = [(ENLinkedNotebookRef *)self noteStoreUrl];
        if (v12 != v13)
        {
          v14 = [(ENLinkedNotebookRef *)v7 noteStoreUrl];
          v32 = [(ENLinkedNotebookRef *)self noteStoreUrl];
          if (!objc_msgSend(v14, "isEqualToString:"))
          {
            char v11 = 0;
LABEL_24:

LABEL_25:
            if (v8 == v9)
            {
LABEL_27:

              goto LABEL_28;
            }
LABEL_26:

            goto LABEL_27;
          }
          v30 = v14;
        }
        uint64_t v15 = [(ENLinkedNotebookRef *)v7 shardId];
        v16 = [(ENLinkedNotebookRef *)self shardId];
        v31 = (void *)v15;
        if ((void *)v15 == v16)
        {
          v26 = v13;
          v27 = v12;
        }
        else
        {
          v17 = [(ENLinkedNotebookRef *)v7 shardId];
          v28 = [(ENLinkedNotebookRef *)self shardId];
          v29 = v17;
          if (!objc_msgSend(v17, "isEqualToString:"))
          {
            char v11 = 0;
            v23 = v31;
            goto LABEL_22;
          }
          v26 = v13;
          v27 = v12;
        }
        v18 = [(ENLinkedNotebookRef *)v7 sharedNotebookGlobalId];
        uint64_t v19 = [(ENLinkedNotebookRef *)self sharedNotebookGlobalId];
        if (v18 == (void *)v19)
        {

          char v11 = 1;
        }
        else
        {
          v20 = (void *)v19;
          [(ENLinkedNotebookRef *)v7 sharedNotebookGlobalId];
          v21 = v25 = v3;
          v22 = [(ENLinkedNotebookRef *)self sharedNotebookGlobalId];
          char v11 = [v21 isEqualToString:v22];

          v3 = v25;
        }
        v23 = v31;
        v13 = v26;
        v12 = v27;
        if (v31 == v16)
        {
LABEL_23:

          v14 = v30;
          if (v12 == v13) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    char v11 = 0;
  }
LABEL_28:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ENLinkedNotebookRef *)self guid];
  [v4 encodeObject:v5 forKey:@"guid"];

  uint64_t v6 = [(ENLinkedNotebookRef *)self noteStoreUrl];
  [v4 encodeObject:v6 forKey:@"noteStoreUrl"];

  v7 = [(ENLinkedNotebookRef *)self shardId];
  [v4 encodeObject:v7 forKey:@"shardId"];

  id v8 = [(ENLinkedNotebookRef *)self sharedNotebookGlobalId];
  [v4 encodeObject:v8 forKey:@"sharedNotebookGlobalId"];
}

- (ENLinkedNotebookRef)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ENLinkedNotebookRef;
  v5 = [(ENLinkedNotebookRef *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"guid"];
    [(ENLinkedNotebookRef *)v5 setGuid:v6];

    v7 = [v4 decodeObjectForKey:@"noteStoreUrl"];
    [(ENLinkedNotebookRef *)v5 setNoteStoreUrl:v7];

    id v8 = [v4 decodeObjectForKey:@"shardId"];
    [(ENLinkedNotebookRef *)v5 setShardId:v8];

    v9 = [v4 decodeObjectForKey:@"sharedNotebookGlobalId"];
    [(ENLinkedNotebookRef *)v5 setSharedNotebookGlobalId:v9];
  }
  return v5;
}

+ (id)linkedNotebookRefFromLinkedNotebook:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ENLinkedNotebookRef);
  v5 = [v3 guid];
  [(ENLinkedNotebookRef *)v4 setGuid:v5];

  uint64_t v6 = [v3 noteStoreUrl];
  [(ENLinkedNotebookRef *)v4 setNoteStoreUrl:v6];

  v7 = [v3 shardId];
  [(ENLinkedNotebookRef *)v4 setShardId:v7];

  id v8 = [v3 sharedNotebookGlobalId];

  [(ENLinkedNotebookRef *)v4 setSharedNotebookGlobalId:v8];
  return v4;
}

@end