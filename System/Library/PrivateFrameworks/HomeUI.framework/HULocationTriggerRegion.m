@interface HULocationTriggerRegion
+ (id)customRegionWithCircularRegion:(id)a3;
+ (id)homeRegionWithHome:(id)a3 eventType:(unint64_t)a4;
- (CLCircularRegion)circularRegion;
- (CLCircularRegion)defaultCircularRegionForCoordinate;
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (HMHome)home;
- (HULocationTriggerRegion)initWithRegionType:(unint64_t)a3 home:(id)a4 circularRegion:(id)a5 eventType:(unint64_t)a6;
- (NSString)identifier;
- (unint64_t)eventType;
- (unint64_t)regionType;
@end

@implementation HULocationTriggerRegion

+ (id)homeRegionWithHome:(id)a3 eventType:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithRegionType:0 home:v6 circularRegion:0 eventType:a4];

  return v7;
}

+ (id)customRegionWithCircularRegion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = objc_msgSend(v5, "initWithRegionType:home:circularRegion:eventType:", 1, 0, v4, objc_msgSend(MEMORY[0x1E4F2E8A8], "hf_locationEventTypeForRegion:", v4));

  return v6;
}

- (HULocationTriggerRegion)initWithRegionType:(unint64_t)a3 home:(id)a4 circularRegion:(id)a5 eventType:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HULocationTriggerRegion;
  v13 = [(HULocationTriggerRegion *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_regionType = a3;
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_circularRegion, a5);
    v14->_eventType = a6;
  }

  return v14;
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = [(HULocationTriggerRegion *)self home];

  if (v3)
  {
    id v4 = [(HULocationTriggerRegion *)self home];
    id v5 = [v4 location];
    if (v5)
    {
      id v6 = [(HULocationTriggerRegion *)self home];
      v7 = [v6 location];
      [v7 coordinate];
      double v9 = v8;
      double v11 = v10;
    }
    else
    {
      double v9 = *MEMORY[0x1E4F1E750];
      double v11 = *(double *)(MEMORY[0x1E4F1E750] + 8);
    }
  }
  else
  {
    id v12 = [(HULocationTriggerRegion *)self circularRegion];

    if (!v12)
    {
      NSLog(&cfstr_RegionDoesNotH.isa, self);
      double v9 = *MEMORY[0x1E4F1E750];
      double v11 = *(double *)(MEMORY[0x1E4F1E750] + 8);
      goto LABEL_9;
    }
    id v4 = [(HULocationTriggerRegion *)self circularRegion];
    [v4 center];
    double v9 = v13;
    double v11 = v14;
  }

LABEL_9:
  double v15 = v9;
  double v16 = v11;
  result.longitude = v16;
  result.latitude = v15;
  return result;
}

- (CLLocation)location
{
  v3 = [(HULocationTriggerRegion *)self home];

  if (v3)
  {
    id v4 = [(HULocationTriggerRegion *)self home];
    id v5 = [v4 location];
  }
  else
  {
    id v6 = [(HULocationTriggerRegion *)self circularRegion];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      double v8 = [(HULocationTriggerRegion *)self circularRegion];
      [v8 center];
      double v10 = v9;
      double v12 = v11;
      double v13 = [MEMORY[0x1E4F1C9C8] date];
      double v14 = [(HULocationTriggerRegion *)self circularRegion];
      id v5 = objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v13, objc_msgSend(v14, "referenceFrame"), v10, v12, 0.0, 0.0, -1.0);
    }
    else
    {
      NSLog(&cfstr_RegionDoesNotH.isa, self);
      id v5 = 0;
    }
  }

  return (CLLocation *)v5;
}

- (NSString)identifier
{
  unint64_t v3 = [(HULocationTriggerRegion *)self regionType];
  if (v3 == 1)
  {
    id v5 = [(HULocationTriggerRegion *)self circularRegion];
    id v4 = [v5 identifier];
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerEditorOptionHome", @"HULocationTriggerEditorOptionHome", 1);
  }

  return (NSString *)v4;
}

- (CLCircularRegion)defaultCircularRegionForCoordinate
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  [(HULocationTriggerRegion *)self coordinate];
  double v5 = v4;
  double v7 = v6;
  double v8 = *MEMORY[0x1E4F1E6E8];
  double v9 = [(HULocationTriggerRegion *)self identifier];
  double v10 = objc_msgSend(v3, "initWithCenter:radius:identifier:", v9, v5, v7, v8);

  objc_msgSend(v10, "setNotifyOnEntry:", -[HULocationTriggerRegion eventType](self, "eventType") == 1);
  objc_msgSend(v10, "setNotifyOnExit:", -[HULocationTriggerRegion eventType](self, "eventType") == 2);

  return (CLCircularRegion *)v10;
}

- (unint64_t)regionType
{
  return self->_regionType;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (HMHome)home
{
  return self->_home;
}

- (CLCircularRegion)circularRegion
{
  return self->_circularRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularRegion, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end