@interface COBallot
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBallot:(id)a3;
- (COBallot)init;
- (COBallot)initWithBallot:(id)a3;
- (COBallot)initWithCandidate:(id)a3;
- (COBallot)initWithCoder:(id)a3;
- (NSDictionary)discovery;
- (NSOrderedSet)candidates;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setDiscovery:(id)a3;
@end

@implementation COBallot

- (COBallot)init
{
  v8.receiver = self;
  v8.super_class = (Class)COBallot;
  v2 = [(COBallot *)&v8 init];
  if (v2)
  {
    v3 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9D8]);
    candidates = v2->_candidates;
    v2->_candidates = v3;

    v5 = (NSDictionary *)objc_alloc_init(NSDictionary);
    discovery = v2->_discovery;
    v2->_discovery = v5;
  }
  return v2;
}

- (COBallot)initWithBallot:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COBallot;
  v5 = [(COBallot *)&v13 init];
  if (v5)
  {
    v6 = [v4 candidates];
    uint64_t v7 = [v6 copy];
    candidates = v5->_candidates;
    v5->_candidates = (NSOrderedSet *)v7;

    v9 = [v4 discovery];
    uint64_t v10 = [v9 copy];
    discovery = v5->_discovery;
    v5->_discovery = (NSDictionary *)v10;
  }
  return v5;
}

- (COBallot)initWithCandidate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(COMutableBallot);
  [(COMutableBallot *)v5 addCandidate:v4];

  v6 = [(COBallot *)self initWithBallot:v5];
  return v6;
}

- (COBallot)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] != 1)
  {

    v5 = 0;
    goto LABEL_31;
  }
  v5 = [(COBallot *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"candidates"];
    candidates = v5->_candidates;
    v5->_candidates = (NSOrderedSet *)v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v11 = v5->_candidates;
      uint64_t v12 = [(NSOrderedSet *)v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (!v12) {
        goto LABEL_12;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [(NSOrderedSet *)v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (!v13)
          {
LABEL_12:

            v16 = (void *)MEMORY[0x263EFFA08];
            uint64_t v17 = objc_opt_class();
            uint64_t v18 = objc_opt_class();
            v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);

            uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"discovery"];
            discovery = v5->_discovery;
            v5->_discovery = (NSDictionary *)v20;

            if (!v5->_discovery && ([v4 containsValueForKey:@"discovery"] & 1) == 0)
            {
              v22 = (NSDictionary *)objc_alloc_init(NSDictionary);
              v23 = v5->_discovery;
              v5->_discovery = v22;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v5 = 0;
              goto LABEL_30;
            }
            objc_opt_class();
            objc_opt_class();
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            v24 = v5->_discovery;
            uint64_t v25 = [(NSDictionary *)v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (!v25) {
              goto LABEL_36;
            }
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v33;
LABEL_18:
            uint64_t v28 = 0;
            while (1)
            {
              if (*(void *)v33 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8 * v28);
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              v30 = [(NSDictionary *)v5->_discovery objectForKey:v29];
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_35;
              }

              if (v26 == ++v28)
              {
                uint64_t v26 = [(NSDictionary *)v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
                if (v26) {
                  goto LABEL_18;
                }
LABEL_36:

LABEL_30:
                goto LABEL_31;
              }
            }
            v30 = v5;
LABEL_35:

            v5 = 0;
            goto LABEL_36;
          }
          goto LABEL_6;
        }
      }
    }
    else
    {
    }
    v5 = 0;
    v19 = v8;
    goto LABEL_30;
  }
LABEL_31:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  v5 = [(COBallot *)self candidates];
  [v4 encodeObject:v5 forKey:@"candidates"];

  id v6 = [(COBallot *)self discovery];
  [v4 encodeObject:v6 forKey:@"discovery"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(COBallot *)self candidates];
  uint64_t v7 = [v6 description];
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p, candidates = %@>", v5, self, v7];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [COMutableBallot alloc];
  return [(COBallot *)v4 initWithBallot:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(COBallot *)self candidates];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COBallot *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(COBallot *)self isEqualToBallot:v4];
  }

  return v5;
}

- (BOOL)isEqualToBallot:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(COBallot *)self candidates];
  id v6 = [v4 candidates];

  LOBYTE(v4) = [v5 isEqualToOrderedSet:v6];
  return (char)v4;
}

- (NSOrderedSet)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
}

- (NSDictionary)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end