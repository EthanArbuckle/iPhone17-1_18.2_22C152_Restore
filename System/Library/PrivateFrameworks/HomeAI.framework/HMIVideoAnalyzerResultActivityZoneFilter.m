@interface HMIVideoAnalyzerResultActivityZoneFilter
- (HMIVideoAnalyzerResultActivityZoneFilter)initWithActivityZones:(id)a3 motionDetections:(id)a4;
- (NSArray)activityZones;
- (NSArray)motionDetections;
- (id)applyWithFrameResult:(id)a3;
@end

@implementation HMIVideoAnalyzerResultActivityZoneFilter

- (HMIVideoAnalyzerResultActivityZoneFilter)initWithActivityZones:(id)a3 motionDetections:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoAnalyzerResultActivityZoneFilter;
  v9 = [(HMIVideoAnalyzerResultActivityZoneFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityZones, a3);
    objc_storeStrong((id *)&v10->_motionDetections, a4);
  }

  return v10;
}

- (id)applyWithFrameResult:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_activityZones count])
  {
    v5 = [(HMIVideoAnalyzerResultActivityZoneFilter *)self motionDetections];
    v6 = +[HMIMotionDetection firstMotionDetectionInArray:v5 withMode:2];

    id v7 = [v4 events];
    id v8 = [(HMIVideoAnalyzerResultActivityZoneFilter *)self activityZones];
    LODWORD(v9) = 1042536202;
    LODWORD(v10) = 1042536202;
    v11 = +[HMICameraActivityZone filterEvents:v7 withActivityZones:v8 motionDetection:v6 insetPercentageInclusion:v9 insetPercentageExclusion:v10];

    objc_super v12 = [HMIVideoAnalyzerFrameResult alloc];
    v13 = [v4 frame];
    [v4 regionOfInterest];
    v14 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v12, "initWithFrame:events:regionOfInterest:", v13, v11);
  }
  else
  {
    v14 = (HMIVideoAnalyzerFrameResult *)v4;
  }

  return v14;
}

- (NSArray)activityZones
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_activityZones, 0);
}

@end