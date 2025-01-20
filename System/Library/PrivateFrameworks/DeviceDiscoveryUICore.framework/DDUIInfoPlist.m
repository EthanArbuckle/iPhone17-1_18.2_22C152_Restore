@interface DDUIInfoPlist
- (NSDictionary)advertisesByIdentifier;
- (NSDictionary)browsesByIdentifier;
- (id)description;
- (void)setAdvertisesByIdentifier:(id)a3;
- (void)setBrowsesByIdentifier:(id)a3;
@end

@implementation DDUIInfoPlist

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSDictionary *)self->_browsesByIdentifier allValues];
  v6 = [(NSDictionary *)self->_advertisesByIdentifier allValues];
  v7 = [v3 stringWithFormat:@"<%@:%p; browses: %@; advertises: %@>", v4, self, v5, v6];

  return v7;
}

- (NSDictionary)browsesByIdentifier
{
  return self->_browsesByIdentifier;
}

- (void)setBrowsesByIdentifier:(id)a3
{
}

- (NSDictionary)advertisesByIdentifier
{
  return self->_advertisesByIdentifier;
}

- (void)setAdvertisesByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisesByIdentifier, 0);
  objc_storeStrong((id *)&self->_browsesByIdentifier, 0);
}

@end