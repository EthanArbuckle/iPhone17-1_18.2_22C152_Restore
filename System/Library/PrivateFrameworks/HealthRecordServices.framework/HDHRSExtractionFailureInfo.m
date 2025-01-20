@interface HDHRSExtractionFailureInfo
+ (BOOL)supportsSecureCoding;
- (HDHRSExtractionFailureInfo)init;
- (HDHRSExtractionFailureInfo)initWithCoder:(id)a3;
- (NSArray)failureRecords;
- (id)description;
- (void)addFailureRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHRSExtractionFailureInfo

- (HDHRSExtractionFailureInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDHRSExtractionFailureInfo;
  return [(HDHRSExtractionFailureInfo *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDHRSExtractionFailureInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHRSExtractionFailureInfo;
  v5 = [(HDHRSExtractionFailureInfo *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"FailureRecords"];
    failureRecords = v5->_failureRecords;
    v5->_failureRecords = (NSMutableArray *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)addFailureRecord:(id)a3
{
  id v4 = a3;
  failureRecords = self->_failureRecords;
  id v8 = v4;
  if (!failureRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_failureRecords;
    self->_failureRecords = v6;

    id v4 = v8;
    failureRecords = self->_failureRecords;
  }
  [(NSMutableArray *)failureRecords addObject:v4];
}

- (NSArray)failureRecords
{
  failureRecords = self->_failureRecords;
  if (failureRecords) {
    objc_super v3 = (void *)[(NSMutableArray *)failureRecords copy];
  }
  else {
    objc_super v3 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v3;
}

- (id)description
{
  uint64_t v3 = [(NSMutableArray *)self->_failureRecords count];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = [(NSMutableArray *)self->_failureRecords hk_map:&__block_literal_global_6];
    id v8 = [v7 componentsJoinedByString:@"\n\t"];
    v9 = [v4 stringWithFormat:@"<%@ %p>\n\t%@", v6, self, v8];
  }
  else
  {
    v9 = [v4 stringWithFormat:@"<%@ %p> (no failure records)", v5, self];
  }

  return v9;
}

uint64_t __41__HDHRSExtractionFailureInfo_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (void).cxx_destruct
{
}

@end