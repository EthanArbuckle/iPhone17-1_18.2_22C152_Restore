@interface _DKEventData
+ (id)fromPBCodable:(id)a3;
- (id)asData;
- (id)initWithCompressedData:(void *)a3 uncompressedLength:(void *)a4 version:;
- (id)initWithData:(void *)a3 version:;
- (id)toPBCodable;
- (uint64_t)version;
@end

@implementation _DKEventData

- (id)toPBCodable
{
  if (-[_DKEventData version]((uint64_t)self))
  {
    -[_DKSyncWindow startDate]((uint64_t)self);
    v3 = (_DKPREventData *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v3 = objc_alloc_init(_DKPREventData);
      int v4 = -[_DKEventData version]((uint64_t)self);
      -[_DKPREventData setVersion:]((uint64_t)v3, v4);
      v5 = -[_DKSyncWindow startDate]((uint64_t)self);
      -[_DKPREventData setEvent:]((uint64_t)v3, v5);

      if (-[_DKEventData version]((uint64_t)self) == 2)
      {
        -[_DKPREventData setHasUncompressedLength:]((uint64_t)v3, 1);
        uint64_t v6 = -[_DKSyncType urgency]((uint64_t)self);
        -[_DKPREventData setUncompressedLength:]((uint64_t)v3, v6);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = -[_DKPREventData event]((uint64_t)v4);

    if (v5)
    {
      int v6 = -[_DKPREventData version]((uint64_t)v4);
      v7 = [_DKEventData alloc];
      v8 = -[_DKPREventData event]((uint64_t)v4);
      if (v6 == 2)
      {
        unint64_t v9 = -[_DKPREventData uncompressedLength]((uint64_t)v4);
        unsigned int v10 = -[_DKPREventData version]((uint64_t)v4);
        v11 = -[_DKEventData initWithCompressedData:uncompressedLength:version:]((id *)&v7->super.isa, v8, (void *)v9, (void *)v10);
      }
      else
      {
        unsigned int v13 = -[_DKPREventData version]((uint64_t)v4);
        v11 = -[_DKEventData initWithData:version:]((id *)&v7->super.isa, v8, (void *)v13);
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)initWithData:(void *)a3 version:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_DKEventData;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a3;
      objc_storeStrong(v7 + 2, a2);
    }
  }

  return a1;
}

- (id)initWithCompressedData:(void *)a3 uncompressedLength:(void *)a4 version:
{
  id v8 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_DKEventData;
    objc_super v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a4;
      v9[3] = a3;
      objc_storeStrong(v9 + 2, a2);
    }
  }

  return a1;
}

- (id)asData
{
  if (a1)
  {
    v1 = [a1 toPBCodable];
    v2 = [v1 data];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)version
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end