@interface NavdClientInfoState
- (BOOL)localUpdatesOnly;
- (NSUUID)uuid;
- (id)description;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setLocalUpdatesOnly:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation NavdClientInfoState

- (id)description
{
  id v3 = objc_retainBlock(self->_handler);
  v4 = v3;
  CFStringRef v5 = @"LocalOnly";
  if (!self->_localUpdatesOnly) {
    CFStringRef v5 = @"Server Allowed";
  }
  v6 = +[NSString stringWithFormat:@"[%@,%@,%@]", v3, v5, self->_uuid];

  return v6;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)localUpdatesOnly
{
  return self->_localUpdatesOnly;
}

- (void)setLocalUpdatesOnly:(BOOL)a3
{
  self->_localUpdatesOnly = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end