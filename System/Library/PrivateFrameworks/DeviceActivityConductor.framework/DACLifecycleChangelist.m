@interface DACLifecycleChangelist
+ (BOOL)supportsSecureCoding;
- (DACLifecycleChangelist)initWithCoder:(id)a3;
- (id)_initWithLifecycleInfoArray:(id)a3;
- (id)description;
- (id)lifecycleInfoForActivity:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)enumerate:(id)a3;
@end

@implementation DACLifecycleChangelist

- (id)_initWithLifecycleInfoArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DACLifecycleChangelist;
  v6 = [(DACLifecycleChangelist *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_infos, a3);
  }

  return v7;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  objc_super v9 = __37__DACLifecycleChangelist_description__block_invoke;
  v10 = &unk_264BDCC58;
  id v4 = v3;
  id v11 = v4;
  [(DACLifecycleChangelist *)self enumerate:&v7];
  if (![v4 length]) {
    [v4 appendString:@" empty"];
  }
  id v5 = [NSString stringWithFormat:@"Changelist:%@", v4, v7, v8, v9, v10];

  return v5;
}

uint64_t __37__DACLifecycleChangelist_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)enumerate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (unsigned int (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (self) {
    infos = self->_infos;
  }
  else {
    infos = 0;
  }
  v6 = infos;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10))) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (id)lifecycleInfoForActivity:(id)a3
{
  id v4 = a3;
  infos = self->_infos;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__DACLifecycleChangelist_lifecycleInfoForActivity___block_invoke;
  v10[3] = &unk_264BDCC80;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSArray *)infos indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_infos objectAtIndex:v7];
  }

  return v8;
}

uint64_t __51__DACLifecycleChangelist_lifecycleInfoForActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 activity];
  uint64_t v7 = [v5 isEqual:v6];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (unint64_t)count
{
  return [(NSArray *)self->_infos count];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:1 forKey:@"version"];
  if (self) {
    infos = self->_infos;
  }
  else {
    infos = 0;
  }
  [v5 encodeObject:infos forKey:@"infos"];
}

- (DACLifecycleChangelist)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1) {
    goto LABEL_5;
  }
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"infos"];

  if (!v8)
  {

    self = 0;
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [(DACLifecycleChangelist *)self _initWithLifecycleInfoArray:v8];
  self = v8;
LABEL_6:

  return v9;
}

- (void).cxx_destruct
{
}

@end