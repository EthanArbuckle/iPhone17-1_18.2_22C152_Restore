@interface LNAllEntitiesQueryRequestType
+ (BOOL)supportsSecureCoding;
+ (id)queryRequest;
- (BOOL)isEqual:(id)a3;
- (LNAllEntitiesQueryRequestType)init;
- (LNAllEntitiesQueryRequestType)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation LNAllEntitiesQueryRequestType

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  v2 = [(LNAllEntitiesQueryRequestType *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (LNAllEntitiesQueryRequestType)initWithCoder:(id)a3
{
  v4 = [(id)objc_opt_class() queryRequest];

  return v4;
}

- (id)description
{
  return @"AllEntitiesQuery";
}

- (LNAllEntitiesQueryRequestType)init
{
  v3.receiver = self;
  v3.super_class = (Class)LNAllEntitiesQueryRequestType;
  return (LNAllEntitiesQueryRequestType *)[(LNQueryRequestTypeBase *)&v3 _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)queryRequest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__LNAllEntitiesQueryRequestType_queryRequest__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (queryRequest_onceToken_180 != -1) {
    dispatch_once(&queryRequest_onceToken_180, block);
  }
  v2 = (void *)queryRequest_instance_179;
  return v2;
}

uint64_t __45__LNAllEntitiesQueryRequestType_queryRequest__block_invoke(uint64_t a1)
{
  queryRequest_instance_179 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

@end