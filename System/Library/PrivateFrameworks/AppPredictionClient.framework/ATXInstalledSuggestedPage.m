@interface ATXInstalledSuggestedPage
+ (BOOL)supportsSecureCoding;
- (ATXInstalledSuggestedPage)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXInstalledSuggestedPage:(id)a3;
- (NSString)identifier;
- (NSString)modeUUID;
- (id)description;
- (int64_t)pageType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setModeUUID:(id)a3;
- (void)setPageType:(int64_t)a3;
@end

@implementation ATXInstalledSuggestedPage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXInstalledSuggestedPage *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXInstalledSuggestedPage *)self isEqualToATXInstalledSuggestedPage:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_pageType forKey:@"type"];
  [v5 encodeObject:self->_modeUUID forKey:@"modeUUID"];
}

- (ATXInstalledSuggestedPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXInstalledSuggestedPage;
  id v5 = [(ATXInstalledSuggestedPage *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_pageType = [v4 decodeIntegerForKey:@"type"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeUUID"];
    modeUUID = v5->_modeUUID;
    v5->_modeUUID = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_pageType;
}

- (BOOL)isEqualToATXInstalledSuggestedPage:(id)a3
{
  int64_t pageType = self->_pageType;
  return pageType == [a3 pageType];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(ATXInstalledSuggestedPage *)self identifier];
  id v5 = [(ATXInstalledSuggestedPage *)self modeUUID];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<ATXInstalledSuggestedPage identifier=%@ modeUUID=%@ type=%ld>", v4, v5, -[ATXInstalledSuggestedPage pageType](self, "pageType")];

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

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end