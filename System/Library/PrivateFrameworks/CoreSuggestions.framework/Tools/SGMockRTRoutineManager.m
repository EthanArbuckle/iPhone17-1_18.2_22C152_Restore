@interface SGMockRTRoutineManager
- (NSArray)mockLocationsOfInterest;
- (SGMockRTRoutineManager)initWithMockLocationsOfInterest;
- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4;
- (void)setMockLocationsOfInterest:(id)a3;
@end

@implementation SGMockRTRoutineManager

- (void).cxx_destruct
{
}

- (void)setMockLocationsOfInterest:(id)a3
{
}

- (NSArray)mockLocationsOfInterest
{
  return self->_mockLocationsOfInterest;
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  v7 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_mockLocationsOfInterest;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (void)v14) == (id)a3) {
          [v7 addObject:v13];
        }
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v6[2](v6, v7, 0);
}

- (SGMockRTRoutineManager)initWithMockLocationsOfInterest
{
  v3 = +[SGMockRTLocationOfInterest mockLocationOfInterestWithPreferredName:@"Home Sweet Home" longitude:0 latitude:32.0 type:23.0];
  v4 = +[SGMockRTLocationOfInterest mockLocationOfInterestWithPreferredName:@"Apple Park" longitude:1 latitude:32.0 type:23.0];
  v5 = +[SGMockRTLocationOfInterest mockLocationOfInterestWithPreferredName:@"Stanford" longitude:2 latitude:32.0 type:23.0];
  v6 = +[SGMockRTLocationOfInterest mockLocationOfInterestWithPreferredName:@"Whole Foods" longitude:-1 latitude:30.0 type:30.0];
  v7 = +[SGMockRTLocationOfInterest mockLocationOfInterestWithPreferredName:0 longitude:-1 latitude:35.0 type:35.0];
  v12.receiver = self;
  v12.super_class = (Class)SGMockRTRoutineManager;
  v8 = [(SGMockRTRoutineManager *)&v12 init];
  if (v8)
  {
    v13[0] = v7;
    v13[1] = v3;
    v13[2] = v4;
    v13[3] = v5;
    v13[4] = v6;
    uint64_t v9 = +[NSArray arrayWithObjects:v13 count:5];
    mockLocationsOfInterest = v8->_mockLocationsOfInterest;
    v8->_mockLocationsOfInterest = (NSArray *)v9;
  }
  return v8;
}

@end