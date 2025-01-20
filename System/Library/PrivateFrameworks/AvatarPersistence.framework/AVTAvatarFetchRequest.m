@interface AVTAvatarFetchRequest
+ (id)requestForAllAvatars;
+ (id)requestForAllAvatarsExcluding:(id)a3;
+ (id)requestForAvatarWithIdentifier:(id)a3;
+ (id)requestForAvatarsWithIdentifiers:(id)a3;
+ (id)requestForCustomAvatars;
+ (id)requestForCustomAvatarsWithLimit:(int64_t)a3;
+ (id)requestForPredefinedAvatars;
+ (id)requestForPredefinedAvatarsExcluding:(id)a3;
+ (id)requestForStorePrimaryAvatar;
- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3;
- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3 identifier:(id)a4;
- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3 identifiers:(id)a4 excludedIdentifiers:(id)a5 fetchLimit:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)excludingIdentifiers;
- (NSArray)identifiers;
- (int64_t)criteria;
- (int64_t)fetchLimit;
- (unint64_t)hash;
@end

@implementation AVTAvatarFetchRequest

+ (id)requestForAllAvatars
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCriteria:0];

  return v2;
}

+ (id)requestForAllAvatarsExcluding:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCriteria:6 identifiers:0 excludedIdentifiers:v4 fetchLimit:0];

  return v5;
}

+ (id)requestForAvatarWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCriteria:1 identifier:v4];

  return v5;
}

+ (id)requestForAvatarsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)[v5 initWithCriteria:2 identifiers:v4 excludedIdentifiers:MEMORY[0x263EFFA68] fetchLimit:0];

  return v6;
}

+ (id)requestForPredefinedAvatars
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCriteria:3];

  return v2;
}

+ (id)requestForPredefinedAvatarsExcluding:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCriteria:7 identifiers:0 excludedIdentifiers:v4 fetchLimit:0];

  return v5;
}

+ (id)requestForCustomAvatars
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCriteria:4];

  return v2;
}

+ (id)requestForCustomAvatarsWithLimit:(int64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  id v5 = (void *)[v4 initWithCriteria:4 identifiers:0 excludedIdentifiers:MEMORY[0x263EFFA68] fetchLimit:a3];

  return v5;
}

+ (id)requestForStorePrimaryAvatar
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCriteria:5];

  return v2;
}

- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3
{
  return [(AVTAvatarFetchRequest *)self initWithCriteria:a3 identifiers:0 excludedIdentifiers:MEMORY[0x263EFFA68] fetchLimit:0];
}

- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3 identifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  v8 = [v6 arrayWithObjects:&v11 count:1];

  v9 = -[AVTAvatarFetchRequest initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:](self, "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", a3, v8, MEMORY[0x263EFFA68], 0, v11, v12);
  return v9;
}

- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3 identifiers:(id)a4 excludedIdentifiers:(id)a5 fetchLimit:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarFetchRequest;
  uint64_t v12 = [(AVTAvatarFetchRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_criteria = a3;
    uint64_t v14 = [v10 copy];
    identifiers = v13->_identifiers;
    v13->_identifiers = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_excludingIdentifiers, a5);
    v13->_fetchLimit = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (AVTAvatarFetchRequest *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    int64_t v6 = [(AVTAvatarFetchRequest *)self criteria];
    if (v6 != [(AVTAvatarFetchRequest *)v5 criteria]) {
      goto LABEL_17;
    }
    id v7 = [(AVTAvatarFetchRequest *)self identifiers];
    if (v7
      || ([(AVTAvatarFetchRequest *)v5 identifiers],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(AVTAvatarFetchRequest *)self identifiers];
      v9 = [(AVTAvatarFetchRequest *)v5 identifiers];
      int v10 = [v8 isEqual:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_17;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_17;
        }
      }
    }
    uint64_t v12 = [(AVTAvatarFetchRequest *)self excludingIdentifiers];
    if (!v12)
    {
      v3 = [(AVTAvatarFetchRequest *)v5 excludingIdentifiers];
      if (!v3) {
        goto LABEL_15;
      }
    }
    v13 = [(AVTAvatarFetchRequest *)self excludingIdentifiers];
    uint64_t v14 = [(AVTAvatarFetchRequest *)v5 excludingIdentifiers];
    int v15 = [v13 isEqual:v14];

    if (v12)
    {

      if (v15)
      {
LABEL_15:
        int64_t v16 = [(AVTAvatarFetchRequest *)self fetchLimit];
        BOOL v11 = v16 == [(AVTAvatarFetchRequest *)v5 fetchLimit];
        goto LABEL_18;
      }
    }
    else
    {

      if (v15) {
        goto LABEL_15;
      }
    }
LABEL_17:
    BOOL v11 = 0;
    goto LABEL_18;
  }
  BOOL v11 = 1;
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(AVTAvatarFetchRequest *)self identifiers];
  uint64_t v4 = [(AVTAvatarFetchRequest *)self identifiers];
  uint64_t v5 = [(AVTAvatarFetchRequest *)self excludingIdentifiers];
  uint64_t v6 = [(AVTAvatarFetchRequest *)self excludingIdentifiers];
  *((void *)&v8 + 1) = v5 ^ v3;
  *(void *)&long long v8 = v6 ^ v4;
  uint64_t v7 = v8 >> 43;
  *((void *)&v8 + 1) = [(AVTAvatarFetchRequest *)self fetchLimit];
  *(void *)&long long v8 = [(AVTAvatarFetchRequest *)self fetchLimit];
  unint64_t v9 = v7 ^ (v8 >> 32) ^ [(AVTAvatarFetchRequest *)self criteria];

  return v9;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)excludingIdentifiers
{
  return self->_excludingIdentifiers;
}

- (int64_t)criteria
{
  return self->_criteria;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludingIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end