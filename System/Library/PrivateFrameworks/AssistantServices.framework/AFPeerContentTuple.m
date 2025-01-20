@interface AFPeerContentTuple
+ (BOOL)supportsSecureCoding;
- (AFPeerContentTuple)initWithCoder:(id)a3;
- (AFPeerContentTuple)initWithInfo:(id)a3 content:(id)a4;
- (AFPeerInfo)info;
- (BOOL)isEqual:(id)a3;
- (id)content;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFPeerContentTuple

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (id)content
{
  return self->_content;
}

- (AFPeerInfo)info
{
  return self->_info;
}

- (AFPeerContentTuple)initWithCoder:(id)a3
{
  v12[12] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerContentTuple.info"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v12[7] = objc_opt_class();
  v12[8] = objc_opt_class();
  v12[9] = objc_opt_class();
  v12[10] = objc_opt_class();
  v12[11] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:12];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AFPeerContentTuple.content"];

  v10 = [(AFPeerContentTuple *)self initWithInfo:v5 content:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  info = self->_info;
  id v5 = a3;
  [v5 encodeObject:info forKey:@"AFPeerContentTuple.info"];
  [v5 encodeObject:self->_content forKey:@"AFPeerContentTuple.content"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFPeerContentTuple *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v10 = 1;
    }
    else
    {
      id v5 = v4;
      v6 = [(AFPeerContentTuple *)self info];
      v7 = [(AFPeerContentTuple *)v5 info];
      if ([v6 isEqual:v7])
      {
        v8 = [(AFPeerContentTuple *)self content];
        v9 = [(AFPeerContentTuple *)v5 content];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFPeerContentTuple;
  id v4 = [(AFPeerContentTuple *)&v8 description];
  id v5 = AFPeerInfoGetCompactDescription(self->_info);
  v6 = (void *)[v3 initWithFormat:@"%@ (%@: %@)", v4, v5, self->_content];

  return v6;
}

- (AFPeerContentTuple)initWithInfo:(id)a3 content:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AFPeerContentTuple.m", 19, @"Invalid parameter not satisfying: %@", @"info != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"AFPeerContentTuple.m", 20, @"Invalid parameter not satisfying: %@", @"content != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)AFPeerContentTuple;
  char v10 = [(AFPeerContentTuple *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    info = v10->_info;
    v10->_info = (AFPeerInfo *)v11;

    uint64_t v13 = [v9 copy];
    id content = v10->_content;
    v10->_id content = (id)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end