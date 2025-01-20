@interface FBKDeferredAttachmentCollection
- (BOOL)isEqual:(id)a3;
- (FBKGroupedDevice)device;
- (NSMutableArray)sortedAttachments;
- (NSSet)allMatchers;
- (id)deferredAttachmentsFromMatchers:(id)a3;
- (id)initDevice:(id)a3 matcherPredicates:(id)a4;
- (unint64_t)hash;
- (void)setDevice:(id)a3;
- (void)setSortedAttachments:(id)a3;
@end

@implementation FBKDeferredAttachmentCollection

- (id)initDevice:(id)a3 matcherPredicates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FBKDeferredAttachmentCollection;
  v9 = [(FBKDeferredAttachmentCollection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    sortedAttachments = v10->_sortedAttachments;
    v10->_sortedAttachments = (NSMutableArray *)v11;

    v13 = v10->_sortedAttachments;
    v14 = [(FBKDeferredAttachmentCollection *)v10 deferredAttachmentsFromMatchers:v8];
    [(NSMutableArray *)v13 addObjectsFromArray:v14];
  }
  return v10;
}

- (NSSet)allMatchers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(FBKDeferredAttachmentCollection *)self sortedAttachments];
  v4 = objc_msgSend(v3, "ded_mapWithBlock:", &__block_literal_global_49);
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

uint64_t __46__FBKDeferredAttachmentCollection_allMatchers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requirement];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 device];
    v6 = [(FBKDeferredAttachmentCollection *)self device];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(FBKDeferredAttachmentCollection *)self device];
  v3 = [v2 identifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)deferredAttachmentsFromMatchers:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__FBKDeferredAttachmentCollection_deferredAttachmentsFromMatchers___block_invoke;
  v9[3] = &unk_2648776F0;
  v9[4] = self;
  v3 = objc_msgSend(a3, "ded_flatMapWithBlock:", v9);
  unint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"displayName" ascending:1];
  v10[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  v6 = [v3 allObjects];
  char v7 = [v6 sortedArrayUsingDescriptors:v5];

  return v7;
}

FBKAttachment *__67__FBKDeferredAttachmentCollection_deferredAttachmentsFromMatchers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [FBKAttachment alloc];
  v5 = NSString;
  v6 = [*(id *)(a1 + 32) device];
  char v7 = [v6 identifier];
  id v8 = [v5 stringWithFormat:@"deferred-%@", v7];
  v9 = [*(id *)(a1 + 32) device];
  v10 = [v9 identifier];
  uint64_t v11 = [(FBKAttachment *)v4 initWithRequirement:v3 urlExtension:0 collectorIdentifier:v8 deviceUUID:v10];

  [(FBKAttachment *)v11 setAttachmentType:1];
  [(FBKAttachment *)v11 setState:8];

  return v11;
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSMutableArray)sortedAttachments
{
  return self->_sortedAttachments;
}

- (void)setSortedAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAttachments, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end