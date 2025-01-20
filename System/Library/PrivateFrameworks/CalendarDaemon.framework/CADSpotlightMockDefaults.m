@interface CADSpotlightMockDefaults
- (BOOL)successfullyReindexed;
- (CADSpotlightMockDefaults)init;
- (NSString)description;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSuccessfullyReindexed:(BOOL)a3;
@end

@implementation CADSpotlightMockDefaults

- (CADSpotlightMockDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)CADSpotlightMockDefaults;
  v2 = [(CADSpotlightMockDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dict objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"LastUnfinishedSpotlightReindex"])
  {
    if (v9)
    {
      self->_BOOL reindexStarted = 1;
      [(CADSpotlightMockDefaults *)self setSuccessfullyReindexed:0];
      id v7 = v9;
LABEL_5:
      [(NSMutableDictionary *)self->_dict setObject:v7 forKey:v6];
      goto LABEL_10;
    }
    BOOL reindexStarted = self->_reindexStarted;
    if (self->_reindexStarted) {
      self->_BOOL reindexStarted = 0;
    }
    [(CADSpotlightMockDefaults *)self setSuccessfullyReindexed:reindexStarted];
  }
  else
  {
    id v7 = v9;
    if (v9) {
      goto LABEL_5;
    }
  }
  [(NSMutableDictionary *)self->_dict removeObjectForKey:v6];
LABEL_10:
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSMutableDictionary *)self->_dict description];
  id v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)successfullyReindexed
{
  return self->_successfullyReindexed;
}

- (void)setSuccessfullyReindexed:(BOOL)a3
{
  self->_successfullyReindexed = a3;
}

- (void).cxx_destruct
{
}

@end