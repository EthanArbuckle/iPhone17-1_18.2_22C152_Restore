@interface CDMWarmupRequestCommand
+ (BOOL)supportsSecureCoding;
- (CDMDynamicConfig)dynamicConfig;
- (CDMWarmupRequestCommand)initWithCoder:(id)a3;
- (CDMWarmupRequestCommand)initWithDynamicConfig:(id)a3;
- (CDMWarmupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4;
- (NLXSchemaNLXClientEventMetadata)selfMetadata;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMWarmupRequestCommand

- (CDMWarmupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMWarmupRequestCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dynamicConfig, a3);
    objc_storeStrong((id *)&v10->_selfMetadata, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_dynamicConfig, 0);
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (CDMDynamicConfig)dynamicConfig
{
  return self->_dynamicConfig;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDMWarmupRequestCommand;
  id v4 = a3;
  [(CDMServiceGraphCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_selfMetadata, @"CDMWarmupRequestCommandSelfMetadata", v5.receiver, v5.super_class);
}

- (CDMWarmupRequestCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMWarmupRequestCommand;
  objc_super v5 = [(CDMServiceGraphCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CDMWarmupRequestCommandSelfMetadata"];
    selfMetadata = v5->_selfMetadata;
    v5->_selfMetadata = (NLXSchemaNLXClientEventMetadata *)v6;
  }
  return v5;
}

- (CDMWarmupRequestCommand)initWithDynamicConfig:(id)a3
{
  return [(CDMWarmupRequestCommand *)self initWithDynamicConfig:a3 selfMetadata:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end