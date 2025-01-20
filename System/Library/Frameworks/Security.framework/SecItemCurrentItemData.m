@interface SecItemCurrentItemData
- (NSData)persistentRef;
- (NSDate)currentItemPointerModificationTime;
- (SecItemCurrentItemData)initWithPersistentRef:(id)a3;
- (void)setCurrentItemPointerModificationTime:(id)a3;
- (void)setPersistentRef:(id)a3;
@end

@implementation SecItemCurrentItemData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemPointerModificationTime, 0);

  objc_storeStrong((id *)&self->_persistentRef, 0);
}

- (void)setCurrentItemPointerModificationTime:(id)a3
{
}

- (NSDate)currentItemPointerModificationTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistentRef:(id)a3
{
}

- (NSData)persistentRef
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (SecItemCurrentItemData)initWithPersistentRef:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecItemCurrentItemData;
  v5 = [(SecItemCurrentItemData *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SecItemCurrentItemData *)v5 setPersistentRef:v4];
    v7 = v6;
  }

  return v6;
}

@end