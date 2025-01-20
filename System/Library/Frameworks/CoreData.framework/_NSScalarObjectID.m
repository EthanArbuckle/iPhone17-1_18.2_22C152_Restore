@interface _NSScalarObjectID
- (BOOL)_preferReferenceData64;
- (_NSScalarObjectID)initWithPK64:(int64_t)a3;
- (id)_referenceData;
- (id)_retainedURIString;
- (int64_t)_referenceData64;
- (int64_t)compare:(id)a3;
@end

@implementation _NSScalarObjectID

- (id)_retainedURIString
{
  v3 = [(_NSCoreManagedObjectID *)self _storeIdentifier];
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_1ED787880;
  }
  return (id)[[NSString alloc] initWithFormat:@"%@://%@/%@/p%qu", @"x-coredata", v4, objc_msgSend(-[_NSCoreManagedObjectID entity](self, "entity"), "name"), -[_NSScalarObjectID _referenceData64](self, "_referenceData64")];
}

- (BOOL)_preferReferenceData64
{
  return 1;
}

- (id)_referenceData
{
  v2 = NSNumber;
  int64_t v3 = [(_NSScalarObjectID *)self _referenceData64];

  return (id)[v2 numberWithLongLong:v3];
}

- (int64_t)_referenceData64
{
  Class Class = object_getClass(self);
  if (*((unsigned char *)object_getIndexedIvars(Class) + 4)) {
    return (unint64_t)self[1].super.super.super.isa >> 16;
  }
  else {
    return (int64_t)self[2].super.super.super.isa;
  }
}

- (_NSScalarObjectID)initWithPK64:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_NSScalarObjectID;
  v4 = [(_NSScalarObjectID *)&v10 init];
  v5 = v4;
  if (v4)
  {
    Class Class = object_getClass(v4);
    atomic_fetch_add_explicit((atomic_uint *volatile)object_getIndexedIvars(Class), 1u, memory_order_relaxed);
    unint64_t v7 = _PFSetPrimaryKey((unint64_t)v5, a3);
    if (v5 != (_NSScalarObjectID *)v7)
    {
      v8 = (_NSScalarObjectID *)v7;
      _PFfastOidRelease(v7, v5);
      return v8;
    }
  }
  return v5;
}

- (int64_t)compare:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  id v5 = [(_NSCoreManagedObjectID *)self _storeIdentifier];
  uint64_t v6 = [a3 _storeIdentifier];
  unint64_t v7 = [(_NSCoreManagedObjectID *)self entity];
  if (v7)
  {
    if ((v7[15] & 4) != 0)
    {
      v8 = (void *)v7[9];
    }
    else
    {
      do
      {
        v8 = v7;
        unint64_t v7 = (void *)[v7 superentity];
      }
      while (v7);
    }
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [a3 entity];
  if (v9)
  {
    if ((*(unsigned char *)(v9 + 120) & 4) != 0)
    {
      objc_super v10 = *(void **)(v9 + 72);
    }
    else
    {
      do
      {
        objc_super v10 = (void *)v9;
        uint64_t v9 = [(id)v9 superentity];
      }
      while (v9);
    }
  }
  else
  {
    objc_super v10 = 0;
  }
  if (v5 == (id)v6 && v8 == v10)
  {
    int64_t v11 = [(_NSScalarObjectID *)self _referenceData64];
    uint64_t v12 = [a3 _referenceData64];
    return (v11 > v12) - (unint64_t)(v11 < v12);
  }
  if (v5 == (id)v6)
  {
    uint64_t v16 = [v8 name];
    uint64_t v15 = [v10 name];
    v14 = (void *)v16;
  }
  else
  {
    v14 = v5;
    uint64_t v15 = v6;
  }
  int64_t result = [v14 compare:v15];
  if (!result)
  {
LABEL_19:
    v17.receiver = self;
    v17.super_class = (Class)_NSScalarObjectID;
    return [(NSManagedObjectID *)&v17 compare:a3];
  }
  return result;
}

@end