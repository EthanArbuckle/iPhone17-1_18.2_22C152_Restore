@interface RestoreBootstrapInfo
- (id)description;
@end

@implementation RestoreBootstrapInfo

- (id)description
{
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 16, 1);
    BOOL preflightOnly = self->_preflightOnly;
  }
  else
  {
    id v3 = 0;
    BOOL preflightOnly = 0;
  }
  v5 = +[NSString stringWithFormat:@"{ reason: %@ preflightOnly: %d }", v3, preflightOnly];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAccountID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end