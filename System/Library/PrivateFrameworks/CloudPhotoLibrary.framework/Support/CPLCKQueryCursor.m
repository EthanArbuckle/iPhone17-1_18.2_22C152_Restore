@interface CPLCKQueryCursor
+ (BOOL)supportsSecureCoding;
- (CKQueryCursor)queryCursor;
- (CPLCKQueryCursor)initWithCoder:(id)a3;
- (CPLCKQueryCursor)initWithCursorData:(id)a3;
- (CPLCKQueryCursor)initWithQueryCursor:(id)a3 additionalInfo:(id)a4;
- (NSData)cursorData;
- (NSData)data;
- (NSString)additionalInfo;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLCKQueryCursor

- (CPLCKQueryCursor)initWithQueryCursor:(id)a3 additionalInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLCKQueryCursor;
  v9 = [(CPLCKQueryCursor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queryCursor, a3);
    v11 = (NSString *)[v8 copy];
    additionalInfo = v10->_additionalInfo;
    v10->_additionalInfo = v11;
  }
  return v10;
}

- (CPLCKQueryCursor)initWithCursorData:(id)a3
{
  id v5 = a3;
  if (qword_1002CE5C0 != -1) {
    dispatch_once(&qword_1002CE5C0, &stru_100277F20);
  }
  v6 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v5 classes:qword_1002CE5B8];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(CPLCKQueryCursor *)self initWithQueryCursor:v6 additionalInfo:0];
      self = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        sub_1001C81B0((uint64_t)v6, (uint64_t)a2, (uint64_t)self);
      }
      id v7 = v6;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSData)cursorData
{
  queryCursor = self;
  if (!self->_additionalInfo) {
    queryCursor = self->_queryCursor;
  }
  v3 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:queryCursor];
  return (NSData *)v3;
}

- (NSData)data
{
  return (NSData *)[(CKQueryCursor *)self->_queryCursor data];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  queryCursor = self->_queryCursor;
  id v5 = a3;
  [v5 encodeObject:queryCursor forKey:@"queryCursor"];
  [v5 encodeObject:self->_additionalInfo forKey:@"additionalInfo"];
}

- (CPLCKQueryCursor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryCursor"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalInfo"];

  if (v5)
  {
    self = [(CPLCKQueryCursor *)self initWithQueryCursor:v5 additionalInfo:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (CKQueryCursor)queryCursor
{
  return self->_queryCursor;
}

- (NSString)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_queryCursor, 0);
}

@end