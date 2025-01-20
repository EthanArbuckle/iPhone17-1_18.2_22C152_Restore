@interface DMFBook
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DMFBook)initWithCoder:(id)a3;
- (DMFBook)initWithPersistentID:(id)a3 iTunesStoreID:(id)a4 author:(id)a5 title:(id)a6 version:(id)a7 type:(unint64_t)a8 state:(unint64_t)a9;
- (NSNumber)iTunesStoreID;
- (NSString)author;
- (NSString)persistentID;
- (NSString)title;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFBook

- (DMFBook)initWithPersistentID:(id)a3 iTunesStoreID:(id)a4 author:(id)a5 title:(id)a6 version:(id)a7 type:(unint64_t)a8 state:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v32.receiver = self;
  v32.super_class = (Class)DMFBook;
  v20 = [(DMFBook *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    persistentID = v20->_persistentID;
    v20->_persistentID = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    iTunesStoreID = v20->_iTunesStoreID;
    v20->_iTunesStoreID = (NSNumber *)v23;

    uint64_t v25 = [v17 copy];
    author = v20->_author;
    v20->_author = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    title = v20->_title;
    v20->_title = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    version = v20->_version;
    v20->_version = (NSString *)v29;

    v20->_type = a8;
    v20->_state = a9;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(DMFBook *)self persistentID];
  v6 = [(DMFBook *)self iTunesStoreID];
  v7 = [(DMFBook *)self author];
  v8 = [(DMFBook *)self title];
  v9 = [(DMFBook *)self version];
  v10 = objc_msgSend(v4, "initWithPersistentID:iTunesStoreID:author:title:version:type:state:", v5, v6, v7, v8, v9, -[DMFBook type](self, "type"), -[DMFBook state](self, "state"));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFBook)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DMFBook;
  v5 = [(DMFBook *)&v24 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"persistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"iTunesStoreID"];
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"author"];
    author = v5->_author;
    v5->_author = (NSString *)v13;

    id v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v16;

    id v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v21 unsignedIntegerValue];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = [v22 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFBook *)self persistentID];
  [v4 encodeObject:v5 forKey:@"persistentID"];

  v6 = [(DMFBook *)self iTunesStoreID];
  [v4 encodeObject:v6 forKey:@"iTunesStoreID"];

  uint64_t v7 = [(DMFBook *)self author];
  [v4 encodeObject:v7 forKey:@"author"];

  v8 = [(DMFBook *)self title];
  [v4 encodeObject:v8 forKey:@"title"];

  v9 = [(DMFBook *)self version];
  [v4 encodeObject:v9 forKey:@"version"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFBook type](self, "type"));
  [v4 encodeObject:v10 forKey:@"type"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFBook state](self, "state"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"state"];
}

- (unint64_t)hash
{
  v2 = [(DMFBook *)self iTunesStoreID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DMFBook *)a3;
  if (self == v4)
  {
    BOOL v33 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(DMFBook *)self iTunesStoreID];
      uint64_t v7 = [(DMFBook *)v5 iTunesStoreID];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        BOOL v33 = 0;
      }
      else
      {
        id v11 = [(DMFBook *)self persistentID];
        v12 = [(DMFBook *)v5 persistentID];
        unint64_t v13 = v11;
        unint64_t v14 = v12;
        if (v13 | v14
          && (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, !v15))
        {
          BOOL v33 = 0;
        }
        else
        {
          uint64_t v16 = [(DMFBook *)self author];
          id v17 = [(DMFBook *)v5 author];
          unint64_t v18 = v16;
          unint64_t v19 = v17;
          if (v18 | v19
            && (int v20 = [(id)v18 isEqual:v19], (id)v19, (id)v18, !v20))
          {
            BOOL v33 = 0;
          }
          else
          {
            unint64_t v37 = v14;
            unint64_t v38 = v19;
            uint64_t v21 = [(DMFBook *)self title];
            v22 = [(DMFBook *)v5 title];
            unint64_t v23 = v21;
            unint64_t v24 = v22;
            v39 = (void *)v23;
            if (v23 | v24
              && (int v25 = [(id)v23 isEqual:v24], (id)v24, (id)v23, !v25))
            {
              BOOL v33 = 0;
              unint64_t v14 = v37;
              unint64_t v19 = v38;
            }
            else
            {
              unint64_t v35 = v13;
              unint64_t v36 = v18;
              v26 = [(DMFBook *)self version];
              uint64_t v27 = [(DMFBook *)v5 version];
              unint64_t v28 = v26;
              unint64_t v29 = v27;
              if (v28 | v29
                && (int v30 = [(id)v28 isEqual:v29], (id)v29, (id)v28, !v30))
              {
                BOOL v33 = 0;
                unint64_t v13 = v35;
                unint64_t v14 = v37;
              }
              else
              {
                unint64_t v31 = [(DMFBook *)self type];
                unint64_t v14 = v37;
                if (v31 == [(DMFBook *)v5 type])
                {
                  unint64_t v32 = [(DMFBook *)self state];
                  BOOL v33 = v32 == [(DMFBook *)v5 state];
                }
                else
                {
                  BOOL v33 = 0;
                }
                unint64_t v13 = v35;
              }

              unint64_t v18 = v36;
              unint64_t v19 = v38;
            }
          }
        }
      }
    }
    else
    {
      BOOL v33 = 0;
    }
  }

  return v33;
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_0);
  }
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  id v4 = [(DMFBook *)self persistentID];
  [v3 appendFormat:@"\tPersistent ID   : %@\n", v4];

  v5 = [(DMFBook *)self iTunesStoreID];
  [v3 appendFormat:@"\tiTunes Store ID : %@\n", v5];

  v6 = [(DMFBook *)self author];
  [v3 appendFormat:@"\tAuthor          : %@\n", v6];

  uint64_t v7 = [(DMFBook *)self title];
  [v3 appendFormat:@"\tTitle           : %@\n", v7];

  unint64_t v8 = (void *)description_typeMap;
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFBook type](self, "type"));
  int v10 = [v8 objectForKeyedSubscript:v9];
  [v3 appendFormat:@"\tType            : %@\n", v10];

  id v11 = (void *)description_stateMap;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFBook state](self, "state"));
  unint64_t v13 = [v11 objectForKeyedSubscript:v12];
  [v3 appendFormat:@"\tState           : %@\n", v13];

  unint64_t v14 = [(DMFBook *)self version];
  [v3 appendFormat:@"\tVersion         : %@\n", v14];

  [v3 appendString:@"}>"];
  int v15 = (void *)[v3 copy];

  return v15;
}

void __22__DMFBook_description__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1F18AA1A0;
  v6[1] = &unk_1F18AA1B8;
  v7[0] = @"PDF";
  v7[1] = @"EPUB";
  v6[2] = &unk_1F18AA1D0;
  v7[2] = @"iBooks";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  v1 = (void *)description_typeMap;
  description_typeMap = v0;

  v4[0] = &unk_1F18AA1D0;
  v4[1] = &unk_1F18AA1A0;
  v5[0] = @"Unknown";
  v5[1] = @"Queued";
  v4[2] = &unk_1F18AA1B8;
  v4[3] = &unk_1F18AA1E8;
  v5[2] = @"Prompting for login";
  v5[3] = @"Updating";
  v4[4] = &unk_1F18AA200;
  v4[5] = &unk_1F18AA218;
  v5[4] = @"Installing";
  v5[5] = @"Installed";
  v4[6] = &unk_1F18AA230;
  v4[7] = &unk_1F18AA248;
  v5[6] = @"Uninstalled";
  v5[7] = @"Managed";
  v4[8] = &unk_1F18AA260;
  v4[9] = &unk_1F18AA278;
  v5[8] = @"Managed but uninstalled";
  v5[9] = @"Failed";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:10];
  unint64_t v3 = (void *)description_stateMap;
  description_stateMap = v2;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end