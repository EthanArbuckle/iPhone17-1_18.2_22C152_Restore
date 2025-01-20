@interface IKPlayerContextMenuItemDidSelectEventUserInfo
- (IKPlayerContextMenuItemDidSelectEventUserInfo)initWithIdentifier:(id)a3;
- (NSDictionary)properties;
- (NSString)identifier;
@end

@implementation IKPlayerContextMenuItemDidSelectEventUserInfo

- (IKPlayerContextMenuItemDidSelectEventUserInfo)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKPlayerContextMenuItemDidSelectEventUserInfo;
  v5 = [(IKPlayerContextMenuItemDidSelectEventUserInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = (void *)[v3 copy];

  return (NSDictionary *)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end