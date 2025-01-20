@interface UARPStandaloneCommandReplyRecord
+ (BOOL)supportsSecureCoding;
- (NSString)modelNumber;
- (UARPStandaloneCommandReplyRecord)initWithCoder:(id)a3;
- (UARPStandaloneCommandReplyRecord)initWithModelNumber:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getResponseURLs;
- (void)addResponseURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPStandaloneCommandReplyRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPStandaloneCommandReplyRecord)initWithModelNumber:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPStandaloneCommandReplyRecord;
  v5 = [(UARPStandaloneCommandReplyRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

    uint64_t v8 = objc_opt_new();
    solicitedURLResponses = v5->_solicitedURLResponses;
    v5->_solicitedURLResponses = (NSMutableArray *)v8;
  }
  return v5;
}

- (void)addResponseURL:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_solicitedURLResponses addObject:v5];
  objc_sync_exit(v4);
}

- (id)getResponseURLs
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v2->_solicitedURLResponses];
  objc_sync_exit(v2);

  return v3;
}

- (UARPStandaloneCommandReplyRecord)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UARPStandaloneCommandReplyRecord;
  id v5 = [(UARPStandaloneCommandReplyRecord *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelNumber"];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"responseURLs"];
    solicitedURLResponses = v5->_solicitedURLResponses;
    v5->_solicitedURLResponses = (NSMutableArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modelNumber = self->_modelNumber;
  id v5 = a3;
  [v5 encodeObject:modelNumber forKey:@"modelNumber"];
  [v5 encodeObject:self->_solicitedURLResponses forKey:@"responseURLs"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UARPStandaloneCommandReplyRecord);
  uint64_t v5 = [(NSString *)self->_modelNumber copy];
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v5;

  uint64_t v7 = [(NSMutableArray *)self->_solicitedURLResponses copy];
  solicitedURLResponses = v4->_solicitedURLResponses;
  v4->_solicitedURLResponses = (NSMutableArray *)v7;

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: modelNumber=%@ solicitedResponses=%@>", v5, self->_modelNumber, self->_solicitedURLResponses];

  return v6;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_solicitedURLResponses, 0);
}

@end