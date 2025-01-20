@interface CPLExpungeableResourceState
+ (BOOL)supportsSecureCoding;
+ (id)normalizedExpungeableResourceStatesFromExpungeableResourceStates:(id)a3;
- (CPLExpungeableResourceState)initWithCoder:(id)a3;
- (NSDate)expungedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)expungedState;
- (unint64_t)resourceType;
- (void)setExpungedDate:(id)a3;
- (void)setExpungedState:(unint64_t)a3;
- (void)setResourceType:(unint64_t)a3;
@end

@implementation CPLExpungeableResourceState

+ (id)normalizedExpungeableResourceStatesFromExpungeableResourceStates:(id)a3
{
  v31[16] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v28 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "resourceType"));
            [v5 setObject:v10 forKey:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v7);
      }

      unint64_t v12 = +[CPLResource countOfResourceTypes];
      v13 = (char *)&v19[-1] - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v13, 8 * v12);
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      uint64_t v26 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __96__CPLExpungeableResourceState_normalizedExpungeableResourceStatesFromExpungeableResourceStates___block_invoke;
      v19[3] = &unk_1E60A8AA0;
      id v14 = v5;
      v21 = &v23;
      v22 = v13;
      id v20 = v14;
      +[CPLResource enumerateResourceTypesWithBlock:v19];
      if (v24[3])
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1C978]);
        v16 = (void *)[v15 initWithObjects:v13 count:v24[3]];
      }
      else
      {
        v16 = (void *)MEMORY[0x1E4F1CBF0];
      }

      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __96__CPLExpungeableResourceState_normalizedExpungeableResourceStatesFromExpungeableResourceStates___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v5 = [v3 objectForKey:v4];

  if (v5) {
    *(void *)(a1[6] + 8 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = v5;
  }
}

- (void).cxx_destruct
{
}

- (void)setExpungedDate:(id)a3
{
}

- (NSDate)expungedDate
{
  return self->_expungedDate;
}

- (void)setExpungedState:(unint64_t)a3
{
  self->_expungedState = a3;
}

- (unint64_t)expungedState
{
  return self->_expungedState;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = +[CPLResource shortDescriptionForResourceType:[(CPLExpungeableResourceState *)self resourceType]];
  unint64_t v6 = [(CPLExpungeableResourceState *)self expungedState];
  uint64_t v7 = [(CPLExpungeableResourceState *)self expungedDate];
  uint64_t v8 = [v3 stringWithFormat:@"[%@ %@ expungedState: %lu expungedDate: %@]", v4, v5, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLExpungeableResourceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLExpungeableResourceState;
  id v5 = [(CPLExpungeableResourceState *)&v8 init];
  unint64_t v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end