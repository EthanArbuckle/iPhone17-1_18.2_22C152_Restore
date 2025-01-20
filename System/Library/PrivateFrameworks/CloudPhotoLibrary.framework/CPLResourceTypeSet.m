@interface CPLResourceTypeSet
- (BOOL)containsResourceType:(unint64_t)a3;
- (BOOL)intersectsWithSet:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)intersectionWithSet:(id)a3;
- (id)unionSet:(id)a3;
- (unint64_t)count;
- (void)addResourceType:(unint64_t)a3;
- (void)enumerateResourceTypesWithBlock:(id)a3;
- (void)removeResourceType:(unint64_t)a3;
@end

@implementation CPLResourceTypeSet

- (id)description
{
  if (self->_baseTypesBits || self->_extraTypeBits)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __33__CPLResourceTypeSet_description__block_invoke;
    v12 = &unk_1E60A8B20;
    id v13 = v3;
    id v4 = v3;
    [(CPLResourceTypeSet *)self enumerateResourceTypesWithBlock:&v9];
    id v5 = [NSString alloc];
    v6 = [v4 componentsJoinedByString:@", "];
    v7 = (__CFString *)[v5 initWithFormat:@"[%@]", v6, v9, v10, v11, v12];
  }
  else
  {
    v7 = @"[<empty>]";
  }
  return v7;
}

void __33__CPLResourceTypeSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CPLResource shortDescriptionForResourceType:a2];
  [v2 addObject:v3];
}

- (BOOL)isEqual:(id)a3
{
  return self->_baseTypesBits == *((void *)a3 + 1) && self->_extraTypeBits == *((void *)a3 + 2);
}

- (id)unionSet:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CPLResourceTypeSet);
  v5->_baseTypesBits = v4[1] | self->_baseTypesBits;
  unint64_t extraTypeBits = self->_extraTypeBits;
  uint64_t v7 = v4[2];

  v5->_unint64_t extraTypeBits = v7 | extraTypeBits;
  return v5;
}

- (BOOL)intersectsWithSet:(id)a3
{
  return (*((void *)a3 + 1) & self->_baseTypesBits) != 0 || (*((void *)a3 + 2) & self->_extraTypeBits) != 0;
}

- (id)intersectionWithSet:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CPLResourceTypeSet);
  v5->_baseTypesBits = v4[1] & self->_baseTypesBits;
  unint64_t extraTypeBits = self->_extraTypeBits;
  uint64_t v7 = v4[2];

  v5->_unint64_t extraTypeBits = v7 & extraTypeBits;
  return v5;
}

- (void)enumerateResourceTypesWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CPLResourceTypeSet_enumerateResourceTypesWithBlock___block_invoke;
  v7[3] = &unk_1E60A8AF8;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  v6 = (void (**)(void, void, void))MEMORY[0x1BA994060](v7);
  v6[2](v6, 0, self->_baseTypesBits);
  if (!*((unsigned char *)v11 + 24)) {
    v6[2](v6, 1000, self->_extraTypeBits);
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __54__CPLResourceTypeSet_enumerateResourceTypesWithBlock___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      if (v3)
      {
        result = (*(uint64_t (**)(void))(*(void *)(v5 + 32) + 16))();
        if (*(unsigned char *)(*(void *)(*(void *)(v5 + 40) + 8) + 24)) {
          break;
        }
      }
      ++a2;
      BOOL v6 = v3 > 1;
      v3 >>= 1;
    }
    while (v6);
  }
  return result;
}

- (BOOL)containsResourceType:(unint64_t)a3
{
  if (a3 > 0x1C)
  {
    if (a3 != 1000)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResource.m"];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 751, @"Invalid resource type %ld", a3);

      abort();
    }
    unint64_t v3 = self->_extraTypeBits & 1;
  }
  else
  {
    unint64_t v3 = self->_baseTypesBits & (1 << a3);
  }
  return v3 != 0;
}

- (void)removeResourceType:(unint64_t)a3
{
  if (a3 > 0x1C)
  {
    if (a3 != 1000)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResource.m"];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 741, @"Invalid resource type %ld", a3);

      abort();
    }
    uint64_t v3 = -2;
    uint64_t v4 = 16;
  }
  else
  {
    uint64_t v3 = ~(1 << a3);
    uint64_t v4 = 8;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)(*(uint64_t *)((char *)&self->super.isa + v4) & v3);
}

- (void)addResourceType:(unint64_t)a3
{
  if (a3 > 0x1C)
  {
    if (a3 != 1000)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResource.m"];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 731, @"Invalid resource type %ld", a3);

      abort();
    }
    uint64_t v3 = 1;
    uint64_t v4 = 16;
  }
  else
  {
    uint64_t v3 = (1 << a3);
    uint64_t v4 = 8;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)(*(uint64_t *)((char *)&self->super.isa + v4) | v3);
}

- (unint64_t)count
{
  unint64_t baseTypesBits = self->_baseTypesBits;
  if (baseTypesBits)
  {
    unint64_t result = 0;
    do
    {
      result += baseTypesBits & 1;
      BOOL v5 = baseTypesBits >= 2;
      baseTypesBits >>= 1;
    }
    while (v5);
  }
  else
  {
    unint64_t result = 0;
  }
  unint64_t extraTypeBits = self->_extraTypeBits;
  if (extraTypeBits)
  {
    do
    {
      result += extraTypeBits & 1;
      BOOL v5 = extraTypeBits >= 2;
      extraTypeBits >>= 1;
    }
    while (v5);
  }
  return result;
}

- (BOOL)isEmpty
{
  return !self->_baseTypesBits && self->_extraTypeBits == 0;
}

@end