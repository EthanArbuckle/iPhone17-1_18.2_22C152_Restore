@interface NTKTritiumSettingsListControllerAppInfo
- (NTKPromise)icon;
- (NTKTritiumAppInfo)info;
- (void)setIcon:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation NTKTritiumSettingsListControllerAppInfo

- (NTKTritiumAppInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NTKPromise)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end