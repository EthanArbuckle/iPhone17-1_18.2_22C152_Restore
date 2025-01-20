@interface BLTBBBulletinKey
+ (id)bulletinKeyWithSectionID:(id)a3 publisherMatchID:(id)a4;
- (BLTBBBulletinKey)initWithSectionID:(id)a3 publisherMatchID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)publisherMatchID;
- (NSString)sectionID;
- (id)description;
- (id)keyString;
- (unint64_t)hash;
@end

@implementation BLTBBBulletinKey

+ (id)bulletinKeyWithSectionID:(id)a3 publisherMatchID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithSectionID:v7 publisherMatchID:v6];

  return v8;
}

- (BLTBBBulletinKey)initWithSectionID:(id)a3 publisherMatchID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (initWithSectionID_publisherMatchID__onceToken != -1) {
    dispatch_once(&initWithSectionID_publisherMatchID__onceToken, &__block_literal_global_7);
  }
  v29.receiver = self;
  v29.super_class = (Class)BLTBBBulletinKey;
  v8 = [(BLTBBBulletinKey *)&v29 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sectionID = v8->_sectionID;
    v8->_sectionID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    publisherMatchID = v8->_publisherMatchID;
    v8->_publisherMatchID = (NSString *)v11;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  v13 = initWithSectionID_publisherMatchID__cacheQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __55__BLTBBBulletinKey_initWithSectionID_publisherMatchID___block_invoke_2;
  v20[3] = &unk_264683E00;
  v22 = &v23;
  v14 = v8;
  v21 = v14;
  dispatch_sync(v13, v20);
  v15 = (void *)v24[5];
  if (v15)
  {
    v16 = v15;

    v14 = v16;
  }
  v17 = v21;
  v18 = v14;

  _Block_object_dispose(&v23, 8);
  return v18;
}

uint64_t __55__BLTBBBulletinKey_initWithSectionID_publisherMatchID___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  v1 = (void *)initWithSectionID_publisherMatchID__cache;
  initWithSectionID_publisherMatchID__cache = v0;

  initWithSectionID_publisherMatchID__cacheQueue = (uint64_t)dispatch_queue_create("com.apple.Carousel.bulletinKeyCache", 0);
  return MEMORY[0x270F9A758]();
}

void __55__BLTBBBulletinKey_initWithSectionID_publisherMatchID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)initWithSectionID_publisherMatchID__cache member:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = (void *)initWithSectionID_publisherMatchID__cache;
    uint64_t v6 = *(void *)(a1 + 32);
    [v5 addObject:v6];
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sectionID hash];
  return [(NSString *)self->_publisherMatchID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [(BLTBBBulletinKey *)self sectionID];
    v8 = [v6 sectionID];
    if (v7 != v8)
    {
      uint64_t v9 = [(BLTBBBulletinKey *)self sectionID];
      NSUInteger v3 = [v6 sectionID];
      if (![v9 isEqualToString:v3])
      {
        char v10 = 0;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      v16 = v9;
    }
    uint64_t v11 = [(BLTBBBulletinKey *)self publisherMatchID];
    v12 = [v6 publisherMatchID];
    if (v11 == v12)
    {
      char v10 = 1;
    }
    else
    {
      v13 = [(BLTBBBulletinKey *)self publisherMatchID];
      v14 = [v6 publisherMatchID];
      char v10 = [v13 isEqualToString:v14];
    }
    uint64_t v9 = v16;
    if (v7 == v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  char v10 = 0;
LABEL_13:

  return v10;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(BLTBBBulletinKey *)self sectionID];
  id v7 = [(BLTBBBulletinKey *)self publisherMatchID];
  v8 = [v3 stringWithFormat:@"<%@ %p sectionID=%@ publisherMatchID=%@>", v5, self, v6, v7];;

  return v8;
}

- (id)keyString
{
  NSUInteger v3 = NSString;
  v4 = [(BLTBBBulletinKey *)self sectionID];
  id v5 = [(BLTBBBulletinKey *)self publisherMatchID];
  id v6 = [v3 stringWithFormat:@"%@--%@", v4, v5];
  id v7 = objc_msgSend(v6, "blt_sanitizeForURL");

  return v7;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end