@interface MPMusicPlayerControllerApplicationQueueModifications
+ (BOOL)supportsSecureCoding;
- (MPMusicPlayerControllerApplicationQueueModifications)initWithCoder:(id)a3;
- (MPMusicPlayerControllerApplicationQueueModifications)initWithInsertedDescriptors:(id)a3 removedItemIdentifiers:(id)a4;
- (NSArray)removedItemIdentifiers;
- (NSDictionary)insertedDescriptors;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMusicPlayerControllerApplicationQueueModifications

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_insertedDescriptors, 0);
}

- (NSArray)removedItemIdentifiers
{
  return self->_removedItemIdentifiers;
}

- (NSDictionary)insertedDescriptors
{
  return self->_insertedDescriptors;
}

- (void)encodeWithCoder:(id)a3
{
  insertedDescriptors = self->_insertedDescriptors;
  id v5 = a3;
  [v5 encodeObject:insertedDescriptors forKey:@"inserted"];
  [v5 encodeObject:self->_removedItemIdentifiers forKey:@"removed"];
}

- (MPMusicPlayerControllerApplicationQueueModifications)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMusicPlayerControllerApplicationQueueModifications;
  id v5 = [(MPMusicPlayerControllerApplicationQueueModifications *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"inserted"];
    insertedDescriptors = v5->_insertedDescriptors;
    v5->_insertedDescriptors = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"removed"];
    removedItemIdentifiers = v5->_removedItemIdentifiers;
    v5->_removedItemIdentifiers = (NSArray *)v16;
  }
  return v5;
}

- (MPMusicPlayerControllerApplicationQueueModifications)initWithInsertedDescriptors:(id)a3 removedItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPMusicPlayerControllerApplicationQueueModifications;
  uint64_t v8 = [(MPMusicPlayerControllerApplicationQueueModifications *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    insertedDescriptors = v8->_insertedDescriptors;
    v8->_insertedDescriptors = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    removedItemIdentifiers = v8->_removedItemIdentifiers;
    v8->_removedItemIdentifiers = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end