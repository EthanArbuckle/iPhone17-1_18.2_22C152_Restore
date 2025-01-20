@interface _CDEventIndexerBookmark
+ (BOOL)supportsSecureCoding;
+ (id)baseBookmarkWithVersion:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (_CDEventIndexerBookmark)initWithCoder:(id)a3;
- (id)description;
- (id)initWithEarliestCreationDate:(void *)a3 latestCreationDate:(void *)a4 latestTombstoneDate:(void *)a5 version:;
- (id)updatedBookmarkWithEarliestCreationDate:(id *)a1;
- (id)updatedBookmarkWithLatestCreationDate:(id *)a1;
- (id)updatedBookmarkWithLatestTombstoneDate:(id *)a1;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CDEventIndexerBookmark

- (id)initWithEarliestCreationDate:(void *)a3 latestCreationDate:(void *)a4 latestTombstoneDate:(void *)a5 version:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)_CDEventIndexerBookmark;
    v13 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      a1[4] = a5;
    }
  }

  return a1;
}

+ (id)baseBookmarkWithVersion:(uint64_t)a1
{
  v3 = (objc_class *)self;
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:]((id *)[v3 alloc], v4, v4, v4, a2);

  return v5;
}

- (id)updatedBookmarkWithEarliestCreationDate:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = (id *)objc_alloc((Class)objc_opt_class());
    id v5 = v2[2];
    id v6 = v2[3];
    id v7 = v2[4];
    id v8 = v5;
    v2 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:](v4, v3, v8, v6, v7);
  }
  return v2;
}

- (id)updatedBookmarkWithLatestCreationDate:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = (id *)objc_alloc((Class)objc_opt_class());
    id v5 = v2[1];
    id v7 = v2[3];
    id v6 = v2[4];
    id v8 = v5;
    v2 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:](v4, v8, v3, v7, v6);
  }
  return v2;
}

- (id)updatedBookmarkWithLatestTombstoneDate:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = (id *)objc_alloc((Class)objc_opt_class());
    id v5 = v2[1];
    id v6 = v2[2];
    id v7 = v2[4];
    id v8 = v5;
    v2 = -[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:](v4, v8, v6, v3, v7);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDEventIndexerBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earliestCreationDate"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestCreationDate"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestTombstoneDate"];
  id v8 = (void *)[v4 decodeIntegerForKey:@"version"];

  v9 = (_CDEventIndexerBookmark *)-[_CDEventIndexerBookmark initWithEarliestCreationDate:latestCreationDate:latestTombstoneDate:version:]((id *)&self->super.isa, v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (self)
  {
    [v6 encodeObject:self->_earliestCreationDate forKey:@"earliestCreationDate"];
    latestCreationDate = self->_latestCreationDate;
  }
  else
  {
    [v6 encodeObject:0 forKey:@"earliestCreationDate"];
    latestCreationDate = 0;
  }
  [v6 encodeObject:latestCreationDate forKey:@"latestCreationDate"];
  if (self)
  {
    [v6 encodeObject:self->_latestTombstoneDate forKey:@"latestTombstoneDate"];
    int64_t version = self->_version;
  }
  else
  {
    [v6 encodeObject:0 forKey:@"latestTombstoneDate"];
    int64_t version = 0;
  }
  [v6 encodeInteger:version forKey:@"version"];
}

- (unint64_t)hash
{
  if (self) {
    earliestCreationDate = self->_earliestCreationDate;
  }
  else {
    earliestCreationDate = 0;
  }
  id v4 = earliestCreationDate;
  uint64_t v5 = [(NSDate *)v4 hash];
  if (self) {
    latestCreationDate = self->_latestCreationDate;
  }
  else {
    latestCreationDate = 0;
  }
  id v7 = latestCreationDate;
  uint64_t v8 = [(NSDate *)v7 hash];
  if (self) {
    latestTombstoneDate = self->_latestTombstoneDate;
  }
  else {
    latestTombstoneDate = 0;
  }
  uint64_t v10 = [(NSDate *)latestTombstoneDate hash];
  if (self) {
    int64_t version = self->_version;
  }
  else {
    int64_t version = 0;
  }
  unint64_t v12 = v8 ^ v5 ^ v10 ^ version;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDEventIndexerBookmark *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v19.receiver = self,
             v19.super_class = (Class)_CDEventIndexerBookmark,
             [(_CDEventIndexerBookmark *)&v19 isEqual:v5]))
  {
    id v6 = v5;
    if (self) {
      earliestCreationDate = self->_earliestCreationDate;
    }
    else {
      earliestCreationDate = 0;
    }
    uint64_t v8 = earliestCreationDate;
    id v9 = v6[1];
    if ([(NSDate *)v8 isEqualToDate:v9])
    {
      if (self) {
        latestCreationDate = self->_latestCreationDate;
      }
      else {
        latestCreationDate = 0;
      }
      id v11 = latestCreationDate;
      id v12 = v6[2];
      if ([(NSDate *)v11 isEqualToDate:v12])
      {
        if (self) {
          latestTombstoneDate = self->_latestTombstoneDate;
        }
        else {
          latestTombstoneDate = 0;
        }
        id v14 = v6[3];
        objc_super v15 = latestTombstoneDate;
        if ([(NSDate *)v15 isEqualToDate:v14])
        {
          if (self) {
            int64_t version = self->_version;
          }
          else {
            int64_t version = 0;
          }
          BOOL v17 = version == (void)v6[4];
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self)
  {
    uint64_t v5 = self->_earliestCreationDate;
    id v6 = self->_latestCreationDate;
    id v7 = self->_latestTombstoneDate;
    int64_t version = self->_version;
  }
  else
  {
    id v7 = 0;
    uint64_t v5 = 0;
    id v6 = 0;
    int64_t version = 0;
  }
  id v9 = [v3 stringWithFormat:@"<%@ %p> earliest creation date: %@, latest creation date: %@, latest tombstone date: %@, version: %ld", v4, self, v5, v6, v7, version];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTombstoneDate, 0);
  objc_storeStrong((id *)&self->_latestCreationDate, 0);
  objc_storeStrong((id *)&self->_earliestCreationDate, 0);
}

@end