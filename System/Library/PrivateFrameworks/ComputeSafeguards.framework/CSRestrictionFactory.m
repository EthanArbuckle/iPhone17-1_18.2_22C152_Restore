@interface CSRestrictionFactory
+ (id)_cpuTimeRestrictionWithBand:(id)a3 errors:(id)a4;
+ (id)_cpuTimeRestrictionWithProperties:(id)a3 errors:(id)a4;
+ (id)restrictionForClass:(id)a3 withProperties:(id)a4 errors:(id)a5;
@end

@implementation CSRestrictionFactory

+ (id)restrictionForClass:(id)a3 withProperties:(id)a4 errors:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if ([v7 isEqualToString:@"CPUTimeRestriction"])
    {
      uint64_t v10 = +[CSRestrictionFactory _cpuTimeRestrictionWithProperties:v8 errors:v9];
LABEL_9:
      v19 = (void *)v10;
      goto LABEL_11;
    }
    if ([v7 isEqualToString:@"CPUTimeRestrictionBand"])
    {
      uint64_t v10 = +[CSRestrictionFactory _cpuTimeRestrictionWithBand:v8 errors:v9];
      goto LABEL_9;
    }
  }
  else
  {
    v11 = +[CSLogger logForCategory:@"CSRestrictionFactory"];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CSRestrictionFactory restrictionForClass:withProperties:errors:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v19 = 0;
LABEL_11:

  return v19;
}

+ (id)_cpuTimeRestrictionWithProperties:(id)a3 errors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = CSNumberForKeyWithErrors(v6, @"Threshold", v5);
  id v8 = CSNumberForKeyWithErrors(v6, @"TimeWindow", v5);

  if (v7 && v8)
  {
    id v9 = [[CSCPUTimeRestriction alloc] initWithThreshold:v7 andTimeWindow:v8];
    goto LABEL_12;
  }
  if (!v7)
  {
    uint64_t v10 = +[CSLogger logForCategory:@"CSRestrictionFactory"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CSRestrictionFactory _cpuTimeRestrictionWithProperties:errors:](v10, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_10;
  }
  if (!v8)
  {
    uint64_t v10 = +[CSLogger logForCategory:@"CSRestrictionFactory"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CSRestrictionFactory _cpuTimeRestrictionWithProperties:errors:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_10:
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

+ (id)_cpuTimeRestrictionWithBand:(id)a3 errors:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!_cpuTimeRestrictionWithBand_errors__restrictionsByBand)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    id v8 = (void *)_cpuTimeRestrictionWithBand_errors__restrictionsByBand;
    _cpuTimeRestrictionWithBand_errors__restrictionsByBand = v7;
  }
  id v9 = CSNumberForKeyWithErrors(v5, @"Band", v6);
  uint64_t v10 = [(id)_cpuTimeRestrictionWithBand_errors__restrictionsByBand objectForKey:v9];
  if (!v10)
  {
    if ([v9 isEqualToNumber:&unk_26FE31040])
    {
      uint64_t v11 = +[CSLogger logForCategory:@"CSRestrictionFactory"];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:](v11, v12, v13, v14, v15, v16, v17, v18);
      }

      uint64_t v19 = [CSCPUTimeRestriction alloc];
      uint64_t v20 = &unk_26FE31058;
LABEL_16:
      uint64_t v10 = [(CSCPUTimeRestriction *)v19 initWithThreshold:v20 andTimeWindow:&unk_26FE31070];
      [(id)_cpuTimeRestrictionWithBand_errors__restrictionsByBand setObject:v10 forKeyedSubscript:v9];
      goto LABEL_17;
    }
    if ([v9 isEqualToNumber:&unk_26FE31088])
    {
      uint64_t v21 = +[CSLogger logForCategory:@"CSRestrictionFactory"];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:](v21, v22, v23, v24, v25, v26, v27, v28);
      }

      uint64_t v19 = [CSCPUTimeRestriction alloc];
      uint64_t v20 = &unk_26FE310A0;
      goto LABEL_16;
    }
    int v29 = [v9 isEqualToNumber:&unk_26FE310B8];
    v30 = +[CSLogger logForCategory:@"CSRestrictionFactory"];
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:](v31, v32, v33, v34, v35, v36, v37, v38);
      }

      uint64_t v19 = [CSCPUTimeRestriction alloc];
      uint64_t v20 = &unk_26FE310D0;
      goto LABEL_16;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:].cold.4((uint64_t)v9, v31, v41, v42, v43, v44, v45, v46);
    }

    uint64_t v10 = 0;
  }
LABEL_17:
  v39 = v10;

  return v39;
}

+ (void)restrictionForClass:(uint64_t)a3 withProperties:(uint64_t)a4 errors:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cpuTimeRestrictionWithProperties:(uint64_t)a3 errors:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cpuTimeRestrictionWithProperties:(uint64_t)a3 errors:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end