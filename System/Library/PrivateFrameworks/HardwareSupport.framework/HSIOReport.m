@interface HSIOReport
+ (id)report:(id *)a3;
+ (id)reportWithOnlySimpleChannels:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReport:(id)a3;
- (HSIOReport)initWithReportDictionary:(id)a3;
- (HSIOReport)reportWithOnlySimpleChannels;
- (NSArray)channelDescriptions;
- (NSDictionary)reportDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reportByFilteringChannels:(id)a3;
- (id)snapshot:(id *)a3;
- (unint64_t)hash;
- (void)setChannelDescriptions:(id)a3;
- (void)setReportDictionary:(id)a3;
@end

@implementation HSIOReport

+ (id)report:(id *)a3
{
  v4 = (void *)IOReportCopyAllChannels();
  if (v4)
  {
    v5 = [HSIOReport alloc];
    id v6 = (id)[v4 copy];
    v7 = [(HSIOReport *)v5 initWithReportDictionary:v6];
  }
  else
  {
    id v6 = 0;
    if (a3)
    {
      id v6 = 0;
      v7 = 0;
      *a3 = v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (HSIOReport)initWithReportDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSIOReport;
  id v6 = [(HSIOReport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reportDictionary, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Aggregate = (void *)IOReportCreateAggregate();
  id v6 = [(HSIOReport *)self reportDictionary];
  int v7 = IOReportMergeChannels();

  if (v7)
  {
    v8 = 0;
    objc_super v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF498];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v9 raise:v10, @"Failed to copy %@ with error: %@", v12, 0 format];

    v13 = 0;
  }
  else
  {
    v14 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    v8 = (void *)[Aggregate copy];
    v13 = (void *)[v14 initWithReportDictionary:v8];
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = [(HSIOReport *)self channelDescriptions];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HSIOReport *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HSIOReport *)self isEqualToReport:v4];
  }

  return v5;
}

- (BOOL)isEqualToReport:(id)a3
{
  v4 = [a3 channelDescriptions];
  BOOL v5 = [(HSIOReport *)self channelDescriptions];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)description
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)HSIOReport;
  v4 = [(HSIOReport *)&v12 description];
  v13[0] = @"channel count";
  BOOL v5 = NSNumber;
  char v6 = [(HSIOReport *)self channelDescriptions];
  int v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v13[1] = @"channel descriptions";
  v14[0] = v7;
  v8 = [(HSIOReport *)self channelDescriptions];
  v14[1] = v8;
  objc_super v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v10 = [v3 stringWithFormat:@"%@ %@", v4, v9];

  return v10;
}

- (NSArray)channelDescriptions
{
  channelDescriptions = self->_channelDescriptions;
  if (!channelDescriptions)
  {
    v4 = [MEMORY[0x263EFF980] array];
    BOOL v5 = [(HSIOReport *)self reportDictionary];
    uint64_t v10 = v4;
    id v6 = v4;
    IOReportIterate();

    int v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_1];
    v8 = self->_channelDescriptions;
    self->_channelDescriptions = v7;

    channelDescriptions = self->_channelDescriptions;
  }

  return channelDescriptions;
}

uint64_t __33__HSIOReport_channelDescriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [[HSIORChannelDescription alloc] initWithIOReportChannelRef:a2];
  [*(id *)(a1 + 32) addObject:v3];

  return 0;
}

uint64_t __33__HSIOReport_channelDescriptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)reportByFilteringChannels:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(HSIOReport *)self copy];
  id v6 = [v5 reportDictionary];
  uint64_t v7 = (void *)[v6 mutableCopy];

  v13 = v4;
  id v8 = v4;
  IOReportPrune();
  id v9 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = (void *)[v7 copy];
  v11 = (void *)[v9 initWithReportDictionary:v10];

  return v11;
}

uint64_t __40__HSIOReport_reportByFilteringChannels___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [[HSIORChannelDescription alloc] initWithIOReportChannelRef:a2];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 16;
  }

  return v4;
}

- (void)setChannelDescriptions:(id)a3
{
}

- (NSDictionary)reportDictionary
{
  return self->_reportDictionary;
}

- (void)setReportDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportDictionary, 0);

  objc_storeStrong((id *)&self->_channelDescriptions, 0);
}

+ (id)reportWithOnlySimpleChannels:(id *)a3
{
  uint64_t v4 = (void *)IOReportCopyChannelsOfFormat();
  if (v4)
  {
    BOOL v5 = [HSIOReport alloc];
    id v6 = (id)[v4 copy];
    uint64_t v7 = [(HSIOReport *)v5 initWithReportDictionary:v6];
  }
  else
  {
    id v6 = 0;
    if (a3)
    {
      id v6 = 0;
      uint64_t v7 = 0;
      *a3 = v6;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (HSIOReport)reportWithOnlySimpleChannels
{
  return (HSIOReport *)[(HSIOReport *)self reportByFilteringChannels:&__block_literal_global_168];
}

uint64_t __56__HSIOReport_SimpleFormat__reportWithOnlySimpleChannels__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 reportingProtocol];
  unint64_t v3 = NSStringFromProtocol(v2);
  uint64_t v4 = NSStringFromProtocol((Protocol *)&unk_26DD13B48);
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)snapshot:(id *)a3
{
  return +[HSIOReportSnapshot snapshotReport:self error:a3];
}

@end