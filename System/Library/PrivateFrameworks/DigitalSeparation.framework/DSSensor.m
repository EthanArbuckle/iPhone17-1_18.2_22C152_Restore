@interface DSSensor
- (NSString)localizedName;
- (NSString)tccPermission;
- (void)setLocalizedName:(id)a3;
- (void)setTccPermission:(id)a3;
@end

@implementation DSSensor

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)tccPermission
{
  return self->_tccPermission;
}

- (void)setTccPermission:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccPermission, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end