@interface CAMCaptureCommand
- (BOOL)requiresSessionModification;
- (CAMCaptureCommand)init;
- (CAMCaptureCommand)initWithCoder:(id)a3;
- (CAMCaptureCommand)initWithSubcommands:(id)a3;
- (NSArray)subcommands;
- (NSDictionary)userInfo;
- (NSString)reason;
- (NSString)sessionModificationLogReason;
- (double)sessionModificationMinimumExecutionTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addSubcommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeSubcommand:(id)a3;
- (void)setReason:(id)a3;
- (void)setSubcommands:(id)a3;
@end

@implementation CAMCaptureCommand

- (CAMCaptureCommand)init
{
  return [(CAMCaptureCommand *)self initWithSubcommands:0];
}

- (CAMCaptureCommand)initWithSubcommands:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCaptureCommand;
  v5 = [(CAMCaptureCommand *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    subcommands = v5->_subcommands;
    v5->_subcommands = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(CAMCaptureCommand *)self reason];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(CAMCaptureCommand *)self subcommands];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * v13) copy];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [v8 copy];
  v16 = (void *)v4[2];
  v4[2] = v15;

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)subcommands
{
  return self->_subcommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcommands, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (BOOL)requiresSessionModification
{
  return 0;
}

- (void)addSubcommand:(id)a3
{
  id v6 = a3;
  id v4 = [(CAMCaptureCommand *)self subcommands];
  id v5 = (id)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  [v5 addObject:v6];
  [(CAMCaptureCommand *)self setSubcommands:v5];
}

- (void)setSubcommands:(id)a3
{
}

- (NSDictionary)userInfo
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(CAMCaptureCommand *)self reason];

  if (v4)
  {
    id v5 = [(CAMCaptureCommand *)self reason];
    [v11 encodeObject:v5 forKey:@"CAMCaptureCommandReason"];
  }
  uint64_t v6 = [(CAMCaptureCommand *)self subcommands];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(CAMCaptureCommand *)self subcommands];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = [(CAMCaptureCommand *)self subcommands];
      [v11 encodeObject:v10 forKey:@"CAMCaptureCommandSubcommands"];
    }
  }
}

- (CAMCaptureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureCommand *)self initWithSubcommands:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMCaptureCommandReason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"CAMCaptureCommandSubcommands"];
    subcommands = v5->_subcommands;
    v5->_subcommands = (NSArray *)v8;

    uint64_t v10 = v5;
  }

  return v5;
}

- (NSString)sessionModificationLogReason
{
  return 0;
}

- (double)sessionModificationMinimumExecutionTime
{
  return 0.0;
}

- (void)removeSubcommand:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureCommand *)self subcommands];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObject:v4];
  [(CAMCaptureCommand *)self setSubcommands:v6];
}

- (void)setReason:(id)a3
{
}

@end