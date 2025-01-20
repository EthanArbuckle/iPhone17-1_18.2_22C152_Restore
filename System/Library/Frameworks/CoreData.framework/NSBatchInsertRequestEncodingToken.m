@interface NSBatchInsertRequestEncodingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)secure;
- (NSArray)objectsToInsert;
- (NSBatchInsertRequestEncodingToken)initWithCoder:(id)a3;
- (NSInputStream)inputStream;
- (NSString)entityName;
- (id)initForRequest:(id)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSBatchInsertRequestEncodingToken

- (id)initForRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSBatchInsertRequestEncodingToken;
  v4 = [(NSBatchInsertRequestEncodingToken *)&v6 init];
  if (v4)
  {
    v4->_entityName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "entityName"), "copy");
    v4->_objectsToInsert = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "objectsToInsert"), "copy");
    v4->_resultType = [a3 resultType];
    v4->_secure = [a3 _secureOperation];
  }
  return v4;
}

- (void)dealloc
{
  self->_entityName = 0;
  self->_objectsToInsert = 0;

  self->_inputStream = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchInsertRequestEncodingToken;
  [(NSBatchInsertRequestEncodingToken *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSBatchInsertRequestEncodingToken)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSBatchInsertRequestEncodingToken;
  v4 = [(NSBatchInsertRequestEncodingToken *)&v7 init];
  if (v4)
  {
    v4->_entityName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"entityName"];
    v5 = (void *)+[_NSXPCStoreUtilities classesForSaveArchive]();
    if (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "count")) {
      v5 = objc_msgSend(v5, "setByAddingObjectsFromSet:", objc_msgSend(a3, "allowedClasses"));
    }
    v4->_objectsToInsert = (NSArray *)(id)[a3 decodeObjectOfClasses:v5 forKey:@"objectsToInsert"];
    v4->_inputStream = (NSInputStream *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inputStream"];
    v4->_resultType = [a3 decodeIntegerForKey:@"resultType"];
    v4->_secure = [a3 decodeBoolForKey:@"secure"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_entityName forKey:@"entityName"];
  [a3 encodeObject:self->_objectsToInsert forKey:@"objectsToInsert"];
  [a3 encodeObject:self->_inputStream forKey:@"inputStream"];
  [a3 encodeInteger:self->_resultType forKey:@"resultType"];
  BOOL secure = self->_secure;

  [a3 encodeBool:secure forKey:@"secure"];
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSArray)objectsToInsert
{
  return self->_objectsToInsert;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (BOOL)secure
{
  return self->_secure;
}

@end