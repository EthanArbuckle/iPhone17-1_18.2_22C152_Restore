@interface ATXSuggestedPagesFilter
+ (BOOL)supportsSecureCoding;
- (ATXSuggestedPagesFilter)initWithCoder:(id)a3;
- (NSString)modeUUID;
- (int64_t)pageType;
- (void)encodeWithCoder:(id)a3;
- (void)setModeUUID:(id)a3;
- (void)setPageType:(int64_t)a3;
@end

@implementation ATXSuggestedPagesFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSuggestedPagesFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestedPagesFilter;
  v5 = [(ATXSuggestedPagesFilter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeUUID"];
    modeUUID = v5->_modeUUID;
    v5->_modeUUID = (NSString *)v6;

    v5->_pageType = [v4 decodeIntegerForKey:@"pageType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modeUUID = self->_modeUUID;
  id v5 = a3;
  [v5 encodeObject:modeUUID forKey:@"modeUUID"];
  [v5 encodeInteger:self->_pageType forKey:@"pageType"];
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end