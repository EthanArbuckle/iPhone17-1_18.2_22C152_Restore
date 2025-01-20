@interface CCReplicatedEntityEnumeratorBookmark
+ (BOOL)supportsSecureCoding;
+ (int64_t)currentVersion;
- (BOOL)isEqual:(id)a3;
- (CCReplicatedEntityEnumeratorBookmark)init;
- (CCReplicatedEntityEnumeratorBookmark)initWithCoder:(id)a3;
- (CCReplicatedEntityEnumeratorBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4;
- (CCReplicatedEntityEnumeratorBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4 version:(unint64_t)a5;
- (CKDistributedTimestampStateVector)contentVector;
- (CKDistributedTimestampStateVector)metaContentVector;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCReplicatedEntityEnumeratorBookmark

- (CCReplicatedEntityEnumeratorBookmark)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCReplicatedEntityEnumeratorBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[CCReplicatedEntityEnumeratorBookmark initWithContentVector:metaContentVector:version:](self, "initWithContentVector:metaContentVector:version:", v7, v6, [(id)objc_opt_class() currentVersion]);

  return v8;
}

- (CCReplicatedEntityEnumeratorBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4 version:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCReplicatedEntityEnumeratorBookmark;
  v11 = [(CCReplicatedEntityEnumeratorBookmark *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentVector, a3);
    objc_storeStrong((id *)&v12->_metaContentVector, a4);
    v12->_version = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 contentVector];
    if ([v6 isEqual:self->_contentVector])
    {
      id v7 = [v5 metaContentVector];
      if ([v7 isEqual:self->_metaContentVector]) {
        BOOL v8 = [v5 version] == self->_version;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (int64_t)currentVersion
{
  return 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contentVector = self->_contentVector;
  id v5 = a3;
  [v5 encodeObject:contentVector forKey:@"contentVector"];
  [v5 encodeObject:self->_metaContentVector forKey:@"metaContentVector"];
  objc_msgSend(v5, "encodeInteger:forKey:", objc_msgSend((id)objc_opt_class(), "currentVersion"), @"bookmarkVersion");
}

- (CCReplicatedEntityEnumeratorBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:getCKDistributedTimestampStateVectorClass_0() forKey:@"contentVector"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:getCKDistributedTimestampStateVectorClass_0() forKey:@"metaContentVector"];
    if (v6)
    {
      self = -[CCReplicatedEntityEnumeratorBookmark initWithContentVector:metaContentVector:version:](self, "initWithContentVector:metaContentVector:version:", v5, v6, [v4 decodeIntegerForKey:@"bookmarkVersion"]);
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (CKDistributedTimestampStateVector)contentVector
{
  return self->_contentVector;
}

- (CKDistributedTimestampStateVector)metaContentVector
{
  return self->_metaContentVector;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentVector, 0);

  objc_storeStrong((id *)&self->_contentVector, 0);
}

@end