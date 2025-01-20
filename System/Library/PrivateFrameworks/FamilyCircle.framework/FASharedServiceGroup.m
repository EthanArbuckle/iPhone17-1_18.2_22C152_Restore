@interface FASharedServiceGroup
- (FASharedServiceGroup)initWithServerResponse:(id)a3;
- (NSArray)services;
- (NSNumber)groupID;
- (NSString)footerText;
- (NSString)headerText;
- (id)description;
- (void)setFooterText:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation FASharedServiceGroup

- (FASharedServiceGroup)initWithServerResponse:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FASharedServiceGroup;
  v5 = [(FASharedServiceGroup *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"groupHeaderText"];
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"groupFooterText"];
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSNumber *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FASharedServiceGroup *)self headerText];
  v5 = [(FASharedServiceGroup *)self groupID];
  uint64_t v6 = [(FASharedServiceGroup *)self services];
  v7 = [v3 stringWithFormat:@"Header:%@ ID:%@ Services Count:%lu", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end