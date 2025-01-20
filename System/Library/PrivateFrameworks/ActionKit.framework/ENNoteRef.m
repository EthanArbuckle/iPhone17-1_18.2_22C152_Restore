@interface ENNoteRef
+ (id)noteRefFromData:(id)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ENLinkedNotebookRef)linkedNotebook;
- (ENNoteRef)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)guid;
- (id)asData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)wfSerializedRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGuid:(id)a3;
- (void)setLinkedNotebook:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ENNoteRef

- (id)wfSerializedRepresentation
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"link.contentkit.ennoteref";
  v2 = [(ENNoteRef *)self asData];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"link.contentkit.ennoteref"];
  if (v4)
  {
    v5 = [v3 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.ennoteref"];
    v6 = +[ENNoteRef noteRefFromData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedNotebook, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setLinkedNotebook:(id)a3
{
}

- (ENLinkedNotebookRef)linkedNotebook
{
  return self->_linkedNotebook;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  unint64_t v4 = [(ENNoteRef *)self type];
  if (v4 > 2) {
    v5 = 0;
  }
  else {
    v5 = off_264E56A40[v4];
  }
  uint64_t v6 = objc_opt_class();
  v7 = [(ENNoteRef *)self guid];
  [v3 appendFormat:@"<%@: %p; guid = %@; type = %@", v6, self, v7, v5];

  v8 = [(ENNoteRef *)self linkedNotebook];

  if (v8)
  {
    v9 = [(ENNoteRef *)self linkedNotebook];
    v10 = [v9 shardId];
    [v3 appendFormat:@"; link shard = %@", v10];
  }
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (unint64_t)hash
{
  uint64_t v3 = (int)[(ENNoteRef *)self type];
  unint64_t v4 = [(ENNoteRef *)self guid];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  uint64_t v6 = [(ENNoteRef *)self linkedNotebook];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5 + 29791;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (ENNoteRef *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v7 = v6;
        uint64_t v8 = [(ENNoteRef *)v7 type];
        if (v8 != [(ENNoteRef *)self type])
        {
          char v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
        v9 = [(ENNoteRef *)self guid];
        v10 = [(ENNoteRef *)v7 guid];
        if (v9 != v10)
        {
          v11 = [(ENNoteRef *)v7 guid];
          uint64_t v3 = [(ENNoteRef *)self guid];
          if (![v11 isEqualToString:v3])
          {
            char v12 = 0;
LABEL_16:

LABEL_17:
            goto LABEL_18;
          }
          v19 = v11;
        }
        v13 = [(ENNoteRef *)self linkedNotebook];
        uint64_t v14 = [(ENNoteRef *)v7 linkedNotebook];
        if (v13 == (void *)v14)
        {

          char v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          v16 = [(ENNoteRef *)v7 linkedNotebook];
          v17 = [(ENNoteRef *)self linkedNotebook];
          char v12 = [v16 isEqual:v17];
        }
        v11 = v19;
        if (v9 == v10) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    char v12 = 0;
  }
LABEL_19:

  return v12;
}

- (id)asData
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(ENNoteRef);
  [(ENNoteRef *)v4 setType:[(ENNoteRef *)self type]];
  uint64_t v5 = [(ENNoteRef *)self guid];
  [(ENNoteRef *)v4 setGuid:v5];

  uint64_t v6 = [(ENNoteRef *)self linkedNotebook];
  [(ENNoteRef *)v4 setLinkedNotebook:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[ENNoteRef type](self, "type"), @"type");
  uint64_t v5 = [(ENNoteRef *)self guid];
  [v4 encodeObject:v5 forKey:@"guid"];

  id v6 = [(ENNoteRef *)self linkedNotebook];
  [v4 encodeObject:v6 forKey:@"linkedNotebook"];
}

- (ENNoteRef)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENNoteRef;
  uint64_t v5 = [(ENNoteRef *)&v9 init];
  if (v5)
  {
    -[ENNoteRef setType:](v5, "setType:", (int)[v4 decodeInt32ForKey:@"type"]);
    id v6 = [v4 decodeObjectForKey:@"guid"];
    [(ENNoteRef *)v5 setGuid:v6];

    unint64_t v7 = [v4 decodeObjectForKey:@"linkedNotebook"];
    [(ENNoteRef *)v5 setLinkedNotebook:v7];
  }
  return v5;
}

+ (id)noteRefFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F08928] unarchiveObjectWithData:v3];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = v4;
      uint64_t v5 = v4;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end