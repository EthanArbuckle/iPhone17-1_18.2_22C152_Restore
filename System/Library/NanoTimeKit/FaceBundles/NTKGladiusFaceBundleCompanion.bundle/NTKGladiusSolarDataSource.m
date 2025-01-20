@interface NTKGladiusSolarDataSource
- (NTKGladiusSolarDataSource)initWithDevice:(id)a3;
- (double)nightFraction;
- (void)_updateSolarCurveData;
- (void)updateLocation;
- (void)updateNightFractionForDate:(id)a3;
@end

@implementation NTKGladiusSolarDataSource

- (NTKGladiusSolarDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NTKGladiusSolarDataSource;
  v6 = [(NTKGladiusSolarDataSource *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = +[NTKDate faceDate];
    v9 = +[NTKLocationManager sharedLocationManager];
    v10 = [v9 anyLocation];

    v11 = +[NTKGladiusFaceBundle logObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[NTKGladiusSolarDataSource initWithDevice:]";
      __int16 v26 = 2112;
      v27 = v8;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s date:%@, location:%@", buf, 0x20u);
    }

    v12 = (NTKSolarTimeModel *)[objc_alloc((Class)NTKSolarTimeModel) initWithReferenceDate:v8 referenceLocation:v10 twilightType:2];
    solarTimeModel = v7->_solarTimeModel;
    v7->_solarTimeModel = v12;

    v22[0] = &off_21598;
    id v14 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:1 solarTimeModel:v7->_solarTimeModel];
    v23[0] = v14;
    v22[1] = &off_215B0;
    id v15 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:2 solarTimeModel:v7->_solarTimeModel];
    v23[1] = v15;
    v22[2] = &off_215C8;
    id v16 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:4 solarTimeModel:v7->_solarTimeModel];
    v23[2] = v16;
    v22[3] = &off_215E0;
    id v17 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:5 solarTimeModel:v7->_solarTimeModel];
    v23[3] = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    solarWaypoints = v7->_solarWaypoints;
    v7->_solarWaypoints = (NSDictionary *)v18;

    [(NTKGladiusSolarDataSource *)v7 _updateSolarCurveData];
  }

  return v7;
}

- (void)updateNightFractionForDate:(id)a3
{
  id v4 = a3;
  if (([(NTKSolarTimeModel *)self->_solarTimeModel includesDate:v4] & 1) == 0)
  {
    [(NTKSolarTimeModel *)self->_solarTimeModel updateModelWithDate:v4];
    [(NTKGladiusSolarDataSource *)self _updateSolarCurveData];
  }
  [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodInCurrentSolarDayForDate:v4];
  double v6 = v5;
  -[NTKSolarPath altitudeAtPercentage:](self->_solarPath, "altitudeAtPercentage:");
  double v8 = v7;
  uint64_t v9 = 48;
  if (v6 < 0.5) {
    uint64_t v9 = 40;
  }
  [*(id *)((char *)&self->super.isa + v9) floatValueForFraction:v7];
  self->_double nightFraction = v10;
  v11 = +[NTKGladiusFaceBundle logObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double nightFraction = self->_nightFraction;
    int v13 = 136316162;
    id v14 = "-[NTKGladiusSolarDataSource updateNightFractionForDate:]";
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2048;
    double v18 = v6;
    __int16 v19 = 2048;
    double v20 = v8;
    __int16 v21 = 2048;
    double v22 = nightFraction;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s %@, percentage:%f, altitude:%f, nightFraction:%f", (uint8_t *)&v13, 0x34u);
  }
}

- (void)updateLocation
{
  v3 = +[NTKLocationManager sharedLocationManager];
  id v4 = [v3 anyLocation];

  double v5 = +[NTKGladiusFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    double v7 = "-[NTKGladiusSolarDataSource updateLocation]";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }

  [(NTKSolarTimeModel *)self->_solarTimeModel setReferenceLocation:v4];
  [(NTKGladiusSolarDataSource *)self _updateSolarCurveData];
}

- (void)_updateSolarCurveData
{
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v3 = [(NSDictionary *)self->_solarWaypoints allValues];
  id v4 = [v3 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v47;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * (void)v7) updateDependentValues];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v46 objects:v62 count:16];
    }
    while (v5);
  }

  id v8 = objc_alloc((Class)NTKSolarPath);
  [(CLKDevice *)self->_device screenBounds];
  uint64_t v9 = (NTKSolarPath *)objc_msgSend(v8, "initWithBounds:solarTimeModel:verticallyFitsPathToBounds:usePlaceholderData:", self->_solarTimeModel, 0, 0);
  solarPath = self->_solarPath;
  self->_solarPath = v9;

  v11 = self->_solarPath;
  v12 = [(NSDictionary *)self->_solarWaypoints objectForKeyedSubscript:&off_21598];
  [v12 percentageThroughPeriodForWaypointDate];
  -[NTKSolarPath altitudeAtPercentage:](v11, "altitudeAtPercentage:");
  double v14 = v13;

  __int16 v15 = self->_solarPath;
  id v16 = [(NSDictionary *)self->_solarWaypoints objectForKeyedSubscript:&off_215E0];
  [v16 percentageThroughPeriodForWaypointDate];
  -[NTKSolarPath altitudeAtPercentage:](v15, "altitudeAtPercentage:");
  double v18 = v17;

  __int16 v19 = self->_solarPath;
  double v20 = [(NSDictionary *)self->_solarWaypoints objectForKeyedSubscript:&off_215B0];
  [v20 percentageThroughPeriodForWaypointDate];
  -[NTKSolarPath altitudeAtPercentage:](v19, "altitudeAtPercentage:");
  double v22 = v21;

  v23 = self->_solarPath;
  v24 = [(NSDictionary *)self->_solarWaypoints objectForKeyedSubscript:&off_215C8];
  [v24 percentageThroughPeriodForWaypointDate];
  -[NTKSolarPath altitudeAtPercentage:](v23, "altitudeAtPercentage:");
  double v26 = v25;

  id v27 = objc_alloc((Class)NTKFloatCurve);
  id v28 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:1.0 fraction:-30.0];
  v61[0] = v28;
  id v29 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:1.0 fraction:v14];
  v61[1] = v29;
  id v30 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:0.5 fraction:v22];
  v61[2] = v30;
  id v31 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:0.0 fraction:-v14];
  v61[3] = v31;
  id v32 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:0.0 fraction:30.0];
  v61[4] = v32;
  v33 = +[NSArray arrayWithObjects:v61 count:5];
  v34 = (NTKFloatCurve *)[v27 initWithFloatCurveElements:v33];
  preNoonBrightnessCurve = self->_preNoonBrightnessCurve;
  self->_preNoonBrightnessCurve = v34;

  id v36 = objc_alloc((Class)NTKFloatCurve);
  id v37 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:1.0 fraction:-30.0];
  v60[0] = v37;
  id v38 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:1.0 fraction:v18];
  v60[1] = v38;
  id v39 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:0.5 fraction:v26];
  v60[2] = v39;
  id v40 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:0.0 fraction:-v18];
  v60[3] = v40;
  id v41 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:0.0 fraction:30.0];
  v60[4] = v41;
  v42 = +[NSArray arrayWithObjects:v60 count:5];
  v43 = (NTKFloatCurve *)[v36 initWithFloatCurveElements:v42];
  postNoonBrightnessCurve = self->_postNoonBrightnessCurve;
  self->_postNoonBrightnessCurve = v43;

  v45 = +[NTKGladiusFaceBundle logObject];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v51 = "-[NTKGladiusSolarDataSource _updateSolarCurveData]";
    __int16 v52 = 2048;
    double v53 = v14;
    __int16 v54 = 2048;
    double v55 = v22;
    __int16 v56 = 2048;
    double v57 = v26;
    __int16 v58 = 2048;
    double v59 = v18;
    _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "%s altitudes - dawn:%f, sunrise:%f, sunset:%f, dusk:%f", buf, 0x34u);
  }
}

- (double)nightFraction
{
  return self->_nightFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postNoonBrightnessCurve, 0);
  objc_storeStrong((id *)&self->_preNoonBrightnessCurve, 0);
  objc_storeStrong((id *)&self->_solarWaypoints, 0);
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_solarPath, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end