@interface PurgeableApp
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation PurgeableApp

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  id v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSNumber *)self->_diskUsage copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[4] = self->_order;
  id v10 = [(NSArray *)self->_plugins copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSString *)self->_reason copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(NSNumber *)self->_storeItemID copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"{ id: %@ usage: %@ reason: %@ }", self->_bundleID, self->_diskUsage, self->_reason];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_diskUsage, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end