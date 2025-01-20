@interface ACUISActivityAlertProvider
- (ACUISActivityAlertOptions)options;
- (ACUISActivityAlertProvider)initWithActivityAlertProviding:(id)a3;
- (NSString)activityIdentifier;
- (NSString)body;
- (NSString)bundleIdentifier;
- (NSString)deviceIdentifier;
- (NSString)payloadIdentifier;
- (NSString)title;
- (int64_t)_activityAlertAction:(int64_t)a3;
- (int64_t)action;
@end

@implementation ACUISActivityAlertProvider

- (ACUISActivityAlertProvider)initWithActivityAlertProviding:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ACUISActivityAlertProvider;
  v5 = [(ACUISActivityAlertProvider *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 bundleIdentifier];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 payloadIdentifier];
    payloadIdentifier = v5->_payloadIdentifier;
    v5->_payloadIdentifier = (NSString *)v10;

    v5->_action = -[ACUISActivityAlertProvider _activityAlertAction:](v5, "_activityAlertAction:", [v4 action]);
    v12 = [ACUISActivityAlertOptions alloc];
    v13 = [v4 configuration];
    v14 = [v4 presentationOptions];
    uint64_t v15 = [(ACUISActivityAlertOptions *)v12 initWithAlertConfiguration:v13 presentationOptions:v14];
    options = v5->_options;
    v5->_options = (ACUISActivityAlertOptions *)v15;

    uint64_t v17 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v17;

    uint64_t v19 = [v4 body];
    body = v5->_body;
    v5->_body = (NSString *)v19;

    uint64_t v21 = [v4 deviceIdentifier];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v21;
  }
  return v5;
}

- (int64_t)_activityAlertAction:(int64_t)a3
{
  return a3 != 0;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (int64_t)action
{
  return self->_action;
}

- (ACUISActivityAlertOptions)options
{
  return self->_options;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end