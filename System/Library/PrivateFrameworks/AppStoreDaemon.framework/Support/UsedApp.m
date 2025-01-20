@interface UsedApp
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation UsedApp

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  id v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSDate *)self->_lastExtensionLaunched copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSDate *)self->_lastLaunched copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (id)description
{
  bundleID = self->_bundleID;
  int64_t usageWindowMatchType = self->_usageWindowMatchType;
  v5 = sub_1002826D4(self->_lastLaunched);
  id v6 = sub_1002826D4(self->_lastExtensionLaunched);
  v7 = +[NSString stringWithFormat:@"{ id: %@ matchType: %ld lastLaunched: %@ lasExtensionLaunch: %@ }", bundleID, usageWindowMatchType, v5, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLaunched, 0);
  objc_storeStrong((id *)&self->_lastExtensionLaunched, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end