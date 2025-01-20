@interface _MKLocationShifter
+ (BOOL)isLocationShiftRequiredForLocation:(id)a3;
- (BOOL)isLocationShiftEnabled;
- (_MKLocationShifter)init;
- (void)_prepareShiftForLocation:(id)a3 withCompletionHandler:(id)a4 withShiftRequestBlock:(id)a5;
- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4;
- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5;
@end

@implementation _MKLocationShifter

- (_MKLocationShifter)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MKLocationShifter;
  v2 = [(_MKLocationShifter *)&v6 init];
  if (v2)
  {
    v3 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E4F64670]);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v3;
  }
  return v2;
}

+ (BOOL)isLocationShiftRequiredForLocation:(id)a3
{
  id v3 = a3;
  if ([v3 referenceFrame] == 2)
  {
    char v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F64670];
    [v3 coordinate];
    char v4 = objc_msgSend(v5, "isLocationShiftRequiredForCoordinate:");
  }

  return v4;
}

- (BOOL)isLocationShiftEnabled
{
  return [(GEOLocationShifter *)self->_locationShifter locationShiftEnabled];
}

- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58___MKLocationShifter_shiftLocation_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E54BB760;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(_MKLocationShifter *)self _prepareShiftForLocation:v7 withCompletionHandler:a4 withShiftRequestBlock:v8];
}

- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke;
  v14[3] = &unk_1E54BB788;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_MKLocationShifter *)self _prepareShiftForLocation:v13 withCompletionHandler:v12 withShiftRequestBlock:v14];
}

- (void)_prepareShiftForLocation:(id)a3 withCompletionHandler:(id)a4 withShiftRequestBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void, void))v9;
  if (v8 && v9)
  {
    if ([(id)objc_opt_class() isLocationShiftRequiredForLocation:v7])
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __91___MKLocationShifter__prepareShiftForLocation_withCompletionHandler_withShiftRequestBlock___block_invoke;
      v19 = &unk_1E54BB7B0;
      id v11 = v7;
      id v20 = v11;
      id v21 = v8;
      id v12 = (void *)MEMORY[0x18C139AE0](&v16);
      id v13 = objc_alloc(MEMORY[0x1E4F64660]);
      v14 = objc_msgSend(v13, "initWithCLLocation:", v11, v16, v17, v18, v19);
      id v15 = [v14 latLng];
      ((void (**)(void, void *, void *))v10)[2](v10, v15, v12);
    }
    else
    {
      (*((void (**)(id, id))v8 + 2))(v8, v7);
    }
  }
}

- (void).cxx_destruct
{
}

@end