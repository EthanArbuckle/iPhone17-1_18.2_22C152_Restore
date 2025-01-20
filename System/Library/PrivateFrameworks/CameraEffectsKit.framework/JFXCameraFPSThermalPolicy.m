@interface JFXCameraFPSThermalPolicy
- (NSString)description;
- (unint64_t)priority;
- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6;
@end

@implementation JFXCameraFPSThermalPolicy

- (unint64_t)priority
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__JFXCameraFPSThermalPolicy_priority__block_invoke;
  v4[3] = &unk_264C09FD0;
  v4[4] = self;
  v4[5] = &v5;
  +[JFXThermalMonitor enumerateThermalPressureLevel:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__JFXCameraFPSThermalPolicy_priority__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t result = [*(id *)(a1 + 32) cameraFPSForThermalLevel:a2 deviceType:0 minRate:(char *)&v4 + 4 maxRate:&v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += (int)v4;
  return result;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = [NSString stringWithFormat:@"%@ (Priority %lu):", v4, -[JFXCameraFPSThermalPolicy priority](self, "priority")];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__JFXCameraFPSThermalPolicy_description__block_invoke;
  v7[3] = &unk_264C09FD0;
  v7[4] = self;
  v7[5] = &v8;
  +[JFXThermalMonitor enumerateThermalPressureLevel:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __40__JFXCameraFPSThermalPolicy_description__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v11 = 0;
  unsigned int v10 = 0;
  [*(id *)(a1 + 32) cameraFPSForThermalLevel:a2 deviceType:0 minRate:&v11 maxRate:&v10];
  uint64_t v4 = NSString;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v6 = +[JFXThermalMonitor stringFromThermalPressureLevel:a2];
  uint64_t v7 = [v4 stringWithFormat:@"%@ %@ [ %d - %d ]", v5, v6, v11, v10];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  *a6 = 30;
  *a5 = 30;
}

@end