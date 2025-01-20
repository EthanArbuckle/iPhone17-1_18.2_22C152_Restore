@interface CPTripPreviewTextConfiguration
+ (BOOL)supportsSecureCoding;
- (CPTripPreviewTextConfiguration)initWithCoder:(id)a3;
- (CPTripPreviewTextConfiguration)initWithStartButtonTitle:(NSString *)startButtonTitle additionalRoutesButtonTitle:(NSString *)additionalRoutesButtonTitle overviewButtonTitle:(NSString *)overviewButtonTitle;
- (NSString)additionalRoutesButtonTitle;
- (NSString)overviewButtonTitle;
- (NSString)startButtonTitle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPTripPreviewTextConfiguration

- (CPTripPreviewTextConfiguration)initWithStartButtonTitle:(NSString *)startButtonTitle additionalRoutesButtonTitle:(NSString *)additionalRoutesButtonTitle overviewButtonTitle:(NSString *)overviewButtonTitle
{
  v9 = startButtonTitle;
  v10 = additionalRoutesButtonTitle;
  v11 = overviewButtonTitle;
  v15.receiver = self;
  v15.super_class = (Class)CPTripPreviewTextConfiguration;
  v12 = [(CPTripPreviewTextConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startButtonTitle, startButtonTitle);
    objc_storeStrong((id *)&v13->_additionalRoutesButtonTitle, additionalRoutesButtonTitle);
    objc_storeStrong((id *)&v13->_overviewButtonTitle, overviewButtonTitle);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTripPreviewTextConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPTripPreviewTextConfiguration;
  v5 = [(CPTripPreviewTextConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPTripPreviewTextConfigurationStartButtonTitle"];
    startButtonTitle = v5->_startButtonTitle;
    v5->_startButtonTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPTripPreviewTextConfigurationAdditionalRoutesButtonTitle"];
    additionalRoutesButtonTitle = v5->_additionalRoutesButtonTitle;
    v5->_additionalRoutesButtonTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPTripPreviewTextConfigurationOverviewButtonTitle"];
    overviewButtonTitle = v5->_overviewButtonTitle;
    v5->_overviewButtonTitle = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPTripPreviewTextConfiguration *)self startButtonTitle];
  [v4 encodeObject:v5 forKey:@"CPTripPreviewTextConfigurationStartButtonTitle"];

  uint64_t v6 = [(CPTripPreviewTextConfiguration *)self additionalRoutesButtonTitle];
  [v4 encodeObject:v6 forKey:@"CPTripPreviewTextConfigurationAdditionalRoutesButtonTitle"];

  id v7 = [(CPTripPreviewTextConfiguration *)self overviewButtonTitle];
  [v4 encodeObject:v7 forKey:@"CPTripPreviewTextConfigurationOverviewButtonTitle"];
}

- (NSString)startButtonTitle
{
  return self->_startButtonTitle;
}

- (NSString)additionalRoutesButtonTitle
{
  return self->_additionalRoutesButtonTitle;
}

- (NSString)overviewButtonTitle
{
  return self->_overviewButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overviewButtonTitle, 0);
  objc_storeStrong((id *)&self->_additionalRoutesButtonTitle, 0);

  objc_storeStrong((id *)&self->_startButtonTitle, 0);
}

@end