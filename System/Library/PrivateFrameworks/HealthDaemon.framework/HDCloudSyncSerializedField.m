@interface HDCloudSyncSerializedField
+ (id)fieldForKey:(id)a3 classes:(id)a4 encrypted:(BOOL)a5;
- (BOOL)encrypted;
- (NSSet)classes;
- (NSString)key;
@end

@implementation HDCloudSyncSerializedField

+ (id)fieldForKey:(id)a3 classes:(id)a4 encrypted:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(HDCloudSyncSerializedField);
  uint64_t v10 = [v8 copy];

  key = v9->_key;
  v9->_key = (NSString *)v10;

  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];

  classes = v9->_classes;
  v9->_classes = (NSSet *)v12;

  v9->_encrypted = a5;

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (NSSet)classes
{
  return self->_classes;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end