@interface APSMessage
- (APSMessage)initWithCoder:(id)a3;
- (APSMessage)initWithDictionary:(id)a3;
- (APSMessage)initWithDictionary:(id)a3 xpcMessage:(id)a4;
- (APSMessage)initWithTopic:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSString)correlationIdentifier;
- (NSString)topic;
- (id)dictionaryRepresentation;
- (id)guid;
- (id)instanceObjectForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)identifier;
- (unint64_t)sendRTT;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setInstanceObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSendRTT:(unint64_t)a3;
- (void)setTopic:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation APSMessage

- (APSMessage)initWithDictionary:(id)a3 xpcMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)APSMessage;
  v8 = [(APSMessage *)&v14 init];
  if (v8)
  {
    if (v6) {
      v9 = (NSMutableDictionary *)[v6 mutableCopy];
    }
    else {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    plist = v8->_plist;
    v8->_plist = v9;

    if (v7) {
      v8->_xpcMessage = v7;
    }
    dispatch_queue_t v11 = dispatch_queue_create("APSMessage-ivarQueue", 0);
    ivarQueue = v8->_ivarQueue;
    v8->_ivarQueue = (OS_dispatch_queue *)v11;
  }
  return v8;
}

- (APSMessage)initWithDictionary:(id)a3
{
  return [(APSMessage *)self initWithDictionary:a3 xpcMessage:0];
}

- (APSMessage)initWithTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"null topic"];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"null userInfo"];
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)APSMessage;
  v9 = [(APSMessage *)&v15 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    plist = v9->_plist;
    v9->_plist = v10;

    dispatch_queue_t v12 = dispatch_queue_create("APSMessage-ivarQueue", 0);
    ivarQueue = v9->_ivarQueue;
    v9->_ivarQueue = (OS_dispatch_queue *)v12;

    [(APSMessage *)v9 setTopic:v6];
    [(APSMessage *)v9 setUserInfo:v8];
  }

  return v9;
}

- (APSMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSMessage;
  v5 = [(APSMessage *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"plist"];
    plist = v5->_plist;
    v5->_plist = (NSMutableDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("APSMessage-ivarQueue", 0);
    ivarQueue = v5->_ivarQueue;
    v5->_ivarQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  objc_super v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  ivarQueue = self->_ivarQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__APSMessage_encodeWithCoder___block_invoke;
  v6[3] = &unk_1E59823B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ivarQueue, v6);
  [v4 encodeObject:v8[5] forKey:@"plist"];
  _Block_object_dispose(&v7, 8);
}

uint64_t __30__APSMessage_encodeWithCoder___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSString)topic
{
  return (NSString *)[(APSMessage *)self objectForKey:@"APSMessageTopic"];
}

- (void)setTopic:(id)a3
{
}

- (NSString)correlationIdentifier
{
  return (NSString *)[(APSMessage *)self objectForKey:@"APSMessageCorrelationIdentifier"];
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)[(APSMessage *)self objectForKey:@"APSMessageUserInfo"];
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)identifier
{
  v2 = [(APSMessage *)self objectForKey:@"APSMessageIdentifier"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setIdentifier:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSMessageIdentifier"];
}

- (void)setGuid:(id)a3
{
}

- (id)guid
{
  return [(APSMessage *)self objectForKey:@"APSMessageGUID"];
}

- (unint64_t)sendRTT
{
  v2 = [(APSMessage *)self objectForKey:@"APSMessageRTT"];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setSendRTT:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(APSMessage *)self setObject:v4 forKey:@"APSMessageRTT"];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__APSMessage_objectForKey___block_invoke;
  block[3] = &unk_1E5982C40;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(ivarQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __27__APSMessage_objectForKey___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x19F3B00F0]();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__APSMessage_setObject_forKey___block_invoke;
  block[3] = &unk_1E59825E0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(ivarQueue, block);
}

void __31__APSMessage_setObject_forKey___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x19F3B00F0]();
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 8) setObject:v3 forKey:a1[6]];
  }
  else if (a1[6])
  {
    objc_msgSend(*(id *)(a1[5] + 8), "removeObjectForKey:");
  }
}

- (id)instanceObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__APSMessage_instanceObjectForKey___block_invoke;
  block[3] = &unk_1E5982C40;
  id v10 = v4;
  objc_super v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(ivarQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __35__APSMessage_instanceObjectForKey___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x19F3B00F0]();
  uint64_t v3 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setInstanceObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__APSMessage_setInstanceObject_forKey___block_invoke;
  block[3] = &unk_1E59825E0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(ivarQueue, block);
}

void __39__APSMessage_setInstanceObject_forKey___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x19F3B00F0]();
  uint64_t v3 = a1[4];
  if (v3)
  {
    uint64_t v4 = *(void **)(a1[5] + 16);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v6 = a1[5];
      id v7 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = v5;

      uint64_t v3 = a1[4];
      uint64_t v4 = *(void **)(a1[5] + 16);
    }
    [v4 setObject:v3 forKey:a1[6]];
  }
  else if (a1[6])
  {
    objc_msgSend(*(id *)(a1[5] + 16), "removeObjectForKey:");
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__APSMessage_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E59823B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__APSMessage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

@end