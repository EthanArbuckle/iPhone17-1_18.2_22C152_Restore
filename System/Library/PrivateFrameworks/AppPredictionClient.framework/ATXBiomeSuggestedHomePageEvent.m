@interface ATXBiomeSuggestedHomePageEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXBiomeSuggestedHomePageEvent)initWithCoder:(id)a3;
- (ATXBiomeSuggestedHomePageEvent)initWithPageType:(int64_t)a3 identifier:(id)a4 action:(int64_t)a5;
- (NSString)identifier;
- (id)serialize;
- (int64_t)action;
- (int64_t)pageType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPageType:(int64_t)a3;
@end

@implementation ATXBiomeSuggestedHomePageEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t pageType = self->_pageType;
  id v5 = a3;
  [v5 encodeInteger:pageType forKey:@"ATXBiomeSuggestedHomePageEventPageType"];
  [v5 encodeObject:self->_identifier forKey:@"ATXBiomeSuggestedHomePageEventIdentifier"];
  [v5 encodeInteger:self->_action forKey:@"ATXBiomeSuggestedHomePageEventAction"];
}

- (ATXBiomeSuggestedHomePageEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"ATXBiomeSuggestedHomePageEventPageType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ATXBiomeSuggestedHomePageEventIdentifier"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"ATXBiomeSuggestedHomePageEventAction"];

  v8 = [[ATXBiomeSuggestedHomePageEvent alloc] initWithPageType:v5 identifier:v6 action:v7];
  return v8;
}

- (ATXBiomeSuggestedHomePageEvent)initWithPageType:(int64_t)a3 identifier:(id)a4 action:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXBiomeSuggestedHomePageEvent;
  v10 = [(ATXBiomeSuggestedHomePageEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_int64_t pageType = a3;
    objc_storeStrong((id *)&v10->_identifier, a4);
    v11->_action = a5;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = a3;
    uint64_t v9 = 0;
    v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v9];

    id v7 = 0;
    if (!v9) {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)serialize
{
  v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  id v8 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  id v6 = 0;
  if (!v5) {
    id v6 = v4;
  }

  return v6;
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_int64_t pageType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
}

@end