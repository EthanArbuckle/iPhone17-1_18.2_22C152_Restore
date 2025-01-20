@interface FBKTeamPermissions
+ (BOOL)supportsSecureCoding;
+ (FBKTeamPermissions)personalTeamPermissions;
- (BOOL)canAssign;
- (BOOL)canClose;
- (BOOL)canDelete;
- (BOOL)canDemote;
- (BOOL)canDownload;
- (BOOL)canRespond;
- (BOOL)canView;
- (FBKTeamPermissions)init;
- (FBKTeamPermissions)initWithCoder:(id)a3;
- (FBKTeamPermissions)initWithJSONObject:(id)a3;
- (FBKTeamPermissions)initWithView:(BOOL)a3 respond:(BOOL)a4 close:(BOOL)a5 download:(BOOL)a6 delete:(BOOL)a7 assign:(BOOL)a8 demote:(BOOL)a9;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FBKTeamPermissions

- (FBKTeamPermissions)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBKTeamPermissions;
  result = [(FBKTeamPermissions *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_canDownload = 0;
    *(_DWORD *)&result->_canView = 0;
  }
  return result;
}

- (FBKTeamPermissions)initWithView:(BOOL)a3 respond:(BOOL)a4 close:(BOOL)a5 download:(BOOL)a6 delete:(BOOL)a7 assign:(BOOL)a8 demote:(BOOL)a9
{
  v16.receiver = self;
  v16.super_class = (Class)FBKTeamPermissions;
  result = [(FBKTeamPermissions *)&v16 init];
  if (result)
  {
    result->_canView = a3;
    result->_canRespond = a4;
    result->_canClose = a5;
    result->_canDownload = a6;
    result->_canDelete = a7;
    result->_canDemote = a9;
    result->_canAssign = a8;
  }
  return result;
}

- (FBKTeamPermissions)initWithJSONObject:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FBKTeamPermissions;
  v5 = [(FBKTeamPermissions *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"view"];
    v5->_canView = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"respond"];
    v5->_canRespond = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"close"];
    v5->_canClose = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"download"];
    v5->_canDownload = [v9 BOOLValue];

    v10 = [v4 objectForKeyedSubscript:@"delete"];
    v5->_canDelete = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:@"demote"];
    v5->_canDemote = [v11 BOOLValue];

    v12 = [v4 objectForKeyedSubscript:@"assign"];
    v5->_canAssign = [v12 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canView](self, "canView"), @"view");
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canRespond](self, "canRespond"), @"respond");
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canDownload](self, "canDownload"), @"download");
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canDemote](self, "canDemote"), @"demote");
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canDelete](self, "canDelete"), @"delete");
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canAssign](self, "canAssign"), @"assign");
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canClose](self, "canClose"), @"close");
}

- (FBKTeamPermissions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FBKTeamPermissions;
  v5 = [(FBKTeamPermissions *)&v7 init];
  if (v5)
  {
    v5->_canView = [v4 decodeBoolForKey:@"view"];
    v5->_canRespond = [v4 decodeBoolForKey:@"respond"];
    v5->_canDownload = [v4 decodeBoolForKey:@"download"];
    v5->_canDelete = [v4 decodeBoolForKey:@"delete"];
    v5->_canDemote = [v4 decodeBoolForKey:@"demote"];
    v5->_canAssign = [v4 decodeBoolForKey:@"assign"];
    v5->_canClose = [v4 decodeBoolForKey:@"close"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)canView
{
  return self->_canView;
}

- (BOOL)canRespond
{
  return self->_canRespond;
}

- (BOOL)canClose
{
  return self->_canClose;
}

- (BOOL)canDownload
{
  return self->_canDownload;
}

- (BOOL)canDelete
{
  return self->_canDelete;
}

- (BOOL)canAssign
{
  return self->_canAssign;
}

- (BOOL)canDemote
{
  return self->_canDemote;
}

+ (FBKTeamPermissions)personalTeamPermissions
{
  if (qword_268375C38 != -1) {
    swift_once();
  }
  v2 = (void *)qword_268379E98;

  return (FBKTeamPermissions *)v2;
}

@end