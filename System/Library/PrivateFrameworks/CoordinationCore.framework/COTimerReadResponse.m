@interface COTimerReadResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isFiltered;
- (BOOL)notModified;
- (BOOL)skipInMerge;
- (COTimerReadResponse)init;
- (COTimerReadResponse)initWithCoder:(id)a3;
- (COTimerReadResponse)initWithFilteredTimers:(id)a3;
- (COTimerReadResponse)initWithSkipInMerge;
- (COTimerReadResponse)initWithTimers:(id)a3;
- (COTimerReadResponse)initWithTimers:(id)a3 deletes:(id)a4;
- (NSArray)deletes;
- (NSArray)timers;
- (id)initNotModifiedWithDeletes:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COTimerReadResponse

- (COTimerReadResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)COTimerReadResponse;
  v2 = [(COMeshCommand *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    timers = v2->_timers;
    v2->_timers = v3;
  }
  return v2;
}

- (COTimerReadResponse)initWithTimers:(id)a3
{
  id v4 = a3;
  v5 = [(COTimerReadResponse *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timers = v5->_timers;
    v5->_timers = (NSArray *)v6;
  }
  return v5;
}

- (COTimerReadResponse)initWithFilteredTimers:(id)a3
{
  result = [(COTimerReadResponse *)self initWithTimers:a3];
  if (result) {
    result->_filtered = 1;
  }
  return result;
}

- (COTimerReadResponse)initWithTimers:(id)a3 deletes:(id)a4
{
  id v6 = a4;
  v7 = [(COTimerReadResponse *)self initWithTimers:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    deletes = v7->_deletes;
    v7->_deletes = (NSArray *)v8;
  }
  return v7;
}

- (id)initNotModifiedWithDeletes:(id)a3
{
  id result = [(COTimerReadResponse *)self initWithTimers:MEMORY[0x263EFFA68] deletes:a3];
  if (result) {
    *((unsigned char *)result + 18) = 1;
  }
  return result;
}

- (COTimerReadResponse)initWithSkipInMerge
{
  v2 = [(COTimerReadResponse *)self init];
  v3 = v2;
  if (v2)
  {
    timers = v2->_timers;
    v2->_timers = (NSArray *)MEMORY[0x263EFFA68];

    v3->_skipInMerge = 1;
  }
  return v3;
}

- (COTimerReadResponse)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)COTimerReadResponse;
  v5 = [(COMeshResponse *)&v25 initWithCoder:v4];
  if (v5)
  {
    id v6 = v5;
    v5->_filtered = [v4 containsValueForKey:@"filtered"];
    v6->_notModified = [v4 containsValueForKey:@"unmodified"];
    v6->_skipInMerge = [v4 containsValueForKey:@"skip"];
    if ([v4 containsValueForKey:@"deletes"])
    {
      uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"deletes"];
      deletes = v6->_deletes;
      v6->_deletes = (NSArray *)v7;
    }
    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"timers"];
    timers = v6->_timers;
    v6->_timers = (NSArray *)v12;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v14 = v6->_timers;
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v19 = 0;
              goto LABEL_17;
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      v19 = v6;
    }
    else
    {
      v19 = 0;
      v14 = (NSArray *)v6;
    }
LABEL_17:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)COTimerReadResponse;
  [(COMeshResponse *)&v7 encodeWithCoder:v4];
  v5 = [(COTimerReadResponse *)self timers];
  [v4 encodeObject:v5 forKey:@"timers"];

  if ([(COTimerReadResponse *)self isFiltered]) {
    [v4 encodeObject:MEMORY[0x263EFFA88] forKey:@"filtered"];
  }
  id v6 = [(COTimerReadResponse *)self deletes];
  if (v6) {
    [v4 encodeObject:v6 forKey:@"deletes"];
  }
  if ([(COTimerReadResponse *)self skipInMerge]) {
    [v4 encodeObject:MEMORY[0x263EFFA88] forKey:@"skip"];
  }
  if ([(COTimerReadResponse *)self notModified]) {
    [v4 encodeObject:MEMORY[0x263EFFA88] forKey:@"unmodified"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)timers
{
  return self->_timers;
}

- (BOOL)isFiltered
{
  return self->_filtered;
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (BOOL)skipInMerge
{
  return self->_skipInMerge;
}

- (BOOL)notModified
{
  return self->_notModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

@end