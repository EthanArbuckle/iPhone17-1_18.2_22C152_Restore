@interface IRSessionAnalyticsMetric
- (IRSessionAnalyticsMetric)initWithClientIdentifier:(id)a3 internalAppName:(id)a4 eventType:(id)a5 miloAvailable:(id)a6 bannerCandidateType:(id)a7 bannerCandidateModelType:(id)a8 chosenCandidateType:(id)a9 chosenCandidateModelType:(id)a10 postBannerInteraction:(id)a11 isOutsideApp:(id)a12;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)eventType;
- (NSNumber)internalAppName;
- (NSNumber)isOutsideApp;
- (NSNumber)miloAvailable;
- (NSNumber)postBannerInteraction;
- (NSString)bannerCandidateModelType;
- (NSString)bannerCandidateType;
- (NSString)chosenCandidateModelType;
- (NSString)chosenCandidateType;
- (NSString)clientIdentifier;
- (NSString)name;
- (void)setBannerCandidateModelType:(id)a3;
- (void)setBannerCandidateType:(id)a3;
- (void)setChosenCandidateModelType:(id)a3;
- (void)setChosenCandidateType:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setEventType:(id)a3;
- (void)setInternalAppName:(id)a3;
- (void)setIsOutsideApp:(id)a3;
- (void)setMiloAvailable:(id)a3;
- (void)setPostBannerInteraction:(id)a3;
@end

@implementation IRSessionAnalyticsMetric

- (IRSessionAnalyticsMetric)initWithClientIdentifier:(id)a3 internalAppName:(id)a4 eventType:(id)a5 miloAvailable:(id)a6 bannerCandidateType:(id)a7 bannerCandidateModelType:(id)a8 chosenCandidateType:(id)a9 chosenCandidateModelType:(id)a10 postBannerInteraction:(id)a11 isOutsideApp:(id)a12
{
  id v17 = a3;
  id v30 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v31.receiver = self;
  v31.super_class = (Class)IRSessionAnalyticsMetric;
  v26 = [(IRSessionAnalyticsMetric *)&v31 init];
  v27 = v26;
  if (v26)
  {
    [(IRSessionAnalyticsMetric *)v26 setClientIdentifier:v17];
    [(IRSessionAnalyticsMetric *)v27 setInternalAppName:v30];
    [(IRSessionAnalyticsMetric *)v27 setEventType:v18];
    [(IRSessionAnalyticsMetric *)v27 setMiloAvailable:v19];
    [(IRSessionAnalyticsMetric *)v27 setBannerCandidateType:v20];
    [(IRSessionAnalyticsMetric *)v27 setBannerCandidateModelType:v21];
    [(IRSessionAnalyticsMetric *)v27 setChosenCandidateType:v22];
    [(IRSessionAnalyticsMetric *)v27 setChosenCandidateModelType:v23];
    [(IRSessionAnalyticsMetric *)v27 setPostBannerInteraction:v24];
    [(IRSessionAnalyticsMetric *)v27 setIsOutsideApp:v25];
  }

  return v27;
}

- (NSString)name
{
  return (NSString *)@"com.apple.intelligentroutingd.UiEventSessionTelemetry";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(IRSessionAnalyticsMetric *)self clientIdentifier];

  if (v4)
  {
    v5 = [(IRSessionAnalyticsMetric *)self clientIdentifier];
    [v3 setObject:v5 forKey:@"ClientIdentifier"];
  }
  v6 = [(IRSessionAnalyticsMetric *)self internalAppName];

  if (v6)
  {
    v7 = [(IRSessionAnalyticsMetric *)self internalAppName];
    [v3 setObject:v7 forKey:@"InternalAppName"];
  }
  v8 = [(IRSessionAnalyticsMetric *)self eventType];

  if (v8)
  {
    v9 = [(IRSessionAnalyticsMetric *)self eventType];
    [v3 setObject:v9 forKey:@"EventType"];
  }
  v10 = [(IRSessionAnalyticsMetric *)self miloAvailable];

  if (v10)
  {
    v11 = [(IRSessionAnalyticsMetric *)self miloAvailable];
    [v3 setObject:v11 forKey:@"MiLoAvailable"];
  }
  v12 = [(IRSessionAnalyticsMetric *)self bannerCandidateType];

  if (v12)
  {
    v13 = [(IRSessionAnalyticsMetric *)self bannerCandidateType];
    [v3 setObject:v13 forKey:@"BannerCandidateType"];
  }
  v14 = [(IRSessionAnalyticsMetric *)self bannerCandidateModelType];

  if (v14)
  {
    v15 = [(IRSessionAnalyticsMetric *)self bannerCandidateModelType];
    [v3 setObject:v15 forKey:@"BannerCandidateModelType"];
  }
  v16 = [(IRSessionAnalyticsMetric *)self chosenCandidateType];

  if (v16)
  {
    id v17 = [(IRSessionAnalyticsMetric *)self chosenCandidateType];
    [v3 setObject:v17 forKey:@"ChosenCandidateType"];
  }
  id v18 = [(IRSessionAnalyticsMetric *)self chosenCandidateModelType];

  if (v18)
  {
    id v19 = [(IRSessionAnalyticsMetric *)self chosenCandidateModelType];
    [v3 setObject:v19 forKey:@"ChosenCandidateModelType"];
  }
  id v20 = [(IRSessionAnalyticsMetric *)self postBannerInteraction];

  if (v20)
  {
    id v21 = [(IRSessionAnalyticsMetric *)self postBannerInteraction];
    [v3 setObject:v21 forKey:@"PostBannerInteraction"];
  }
  id v22 = [(IRSessionAnalyticsMetric *)self isOutsideApp];

  if (v22)
  {
    id v23 = [(IRSessionAnalyticsMetric *)self isOutsideApp];
    [v3 setObject:v23 forKey:@"StartingEventIsWidget"];
  }

  return (NSDictionary *)v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSNumber)internalAppName
{
  return self->_internalAppName;
}

- (void)setInternalAppName:(id)a3
{
}

- (NSNumber)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSNumber)miloAvailable
{
  return self->_miloAvailable;
}

- (void)setMiloAvailable:(id)a3
{
}

- (NSString)bannerCandidateType
{
  return self->_bannerCandidateType;
}

- (void)setBannerCandidateType:(id)a3
{
}

- (NSString)bannerCandidateModelType
{
  return self->_bannerCandidateModelType;
}

- (void)setBannerCandidateModelType:(id)a3
{
}

- (NSString)chosenCandidateType
{
  return self->_chosenCandidateType;
}

- (void)setChosenCandidateType:(id)a3
{
}

- (NSString)chosenCandidateModelType
{
  return self->_chosenCandidateModelType;
}

- (void)setChosenCandidateModelType:(id)a3
{
}

- (NSNumber)postBannerInteraction
{
  return self->_postBannerInteraction;
}

- (void)setPostBannerInteraction:(id)a3
{
}

- (NSNumber)isOutsideApp
{
  return self->_isOutsideApp;
}

- (void)setIsOutsideApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isOutsideApp, 0);
  objc_storeStrong((id *)&self->_postBannerInteraction, 0);
  objc_storeStrong((id *)&self->_chosenCandidateModelType, 0);
  objc_storeStrong((id *)&self->_chosenCandidateType, 0);
  objc_storeStrong((id *)&self->_bannerCandidateModelType, 0);
  objc_storeStrong((id *)&self->_bannerCandidateType, 0);
  objc_storeStrong((id *)&self->_miloAvailable, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_internalAppName, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end