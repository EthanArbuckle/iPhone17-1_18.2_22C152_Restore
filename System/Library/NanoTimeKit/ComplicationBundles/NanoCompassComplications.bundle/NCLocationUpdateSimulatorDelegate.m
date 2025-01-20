@interface NCLocationUpdateSimulatorDelegate
- (NCLocationUpdateSimulatorDelegate)init;
- (void)endSession:(id)a3;
- (void)fetchLocationsWithinRadius:(double)a3 count:(int64_t)a4 taskIdentifier:(id)a5 completionHandler:(id)a6;
- (void)startSession:(id)a3;
- (void)updateLocation:(id)a3 error:(id)a4;
@end

@implementation NCLocationUpdateSimulatorDelegate

- (NCLocationUpdateSimulatorDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCLocationUpdateSimulatorDelegate;
  v2 = [(NCLocationUpdateBaseDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    locations = v2->_locations;
    v2->_locations = v3;
  }
  return v2;
}

- (void)updateLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCLocationUpdateSimulatorDelegate;
  [(NCLocationUpdateBaseDelegate *)&v9 updateLocation:v6 error:a4];
  if (v6 && self->_inSession) {
    objc_msgSend_addObject_(self->_locations, v7, (uint64_t)v6, v8);
  }
}

- (void)startSession:(id)a3
{
  self->_inSession = 1;
  (*((void (**)(id, void))a3 + 2))(a3, 0);
}

- (void)endSession:(id)a3
{
  self->_inSession = 0;
  locations = self->_locations;
  v7 = (void (**)(void))a3;
  objc_msgSend_removeAllObjects(locations, v4, v5, v6);
  v7[2]();
}

- (void)fetchLocationsWithinRadius:(double)a3 count:(int64_t)a4 taskIdentifier:(id)a5 completionHandler:(id)a6
{
}

- (void).cxx_destruct
{
}

@end