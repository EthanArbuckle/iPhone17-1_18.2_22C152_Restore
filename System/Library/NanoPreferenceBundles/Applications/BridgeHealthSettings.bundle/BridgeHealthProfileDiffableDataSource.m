@interface BridgeHealthProfileDiffableDataSource
- (NRDevice)activeTinkerDevice;
- (NSString)firstName;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (void)setActiveTinkerDevice:(id)a3;
- (void)setFirstName:(id)a3;
@end

@implementation BridgeHealthProfileDiffableDataSource

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v6 = [(BridgeHealthProfileDiffableDataSource *)self snapshot];
  v7 = [v6 sectionIdentifiers];
  v8 = [v7 objectAtIndex:a4];

  if ([v8 isEqual:&off_193D8])
  {
    v9 = &stru_18860;
    goto LABEL_12;
  }
  if (![v8 isEqual:&off_193F0])
  {
    if (![v8 isEqual:&off_19408])
    {
      v9 = 0;
      goto LABEL_12;
    }
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = v12;
    CFStringRef v13 = @"CARDIO_FITNESS_RELATED_MEDICATIONS_FOOTER_TEXT";
    goto LABEL_10;
  }
  if (!self->_activeTinkerDevice)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = v12;
    CFStringRef v13 = @"WHEELCHAIR_USE_DESCRIPTION_FOOTER";
LABEL_10:
    v9 = [v12 localizedStringForKey:v13 value:&stru_18860 table:@"Localizable"];
    goto LABEL_11;
  }
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"WHEELCHAIR_USE_DESCRIPTION_FOOTER_TINKER_%@" value:&stru_18860 table:@"Localizable-tinker"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, self->_firstName);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_12:

  return v9;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NRDevice)activeTinkerDevice
{
  return self->_activeTinkerDevice;
}

- (void)setActiveTinkerDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTinkerDevice, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end