@interface ATXEventTravelTimeDataSource
- (ATXEventTravelTimeDataSource)initWithDevice:(id)a3;
- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8;
@end

@implementation ATXEventTravelTimeDataSource

- (ATXEventTravelTimeDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXEventTravelTimeDataSource;
  v6 = [(ATXEventTravelTimeDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = +[ATXEventTravelTimeDataSourceInternal sharedInstance];
  [v19 travelTimeInfoForEventID:v18 location:v17 expectedArrivalDate:v16 transportType:v15 localOnlyAfterFirstUpdate:v8 heuristicDevice:self->_device callback:v14];
}

- (void).cxx_destruct
{
}

@end