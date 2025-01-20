@interface CMPedometer(HealthDaemon)
- (void)hd_beginStreamingFromDatum:()HealthDaemon handler:;
@end

@implementation CMPedometer(HealthDaemon)

- (void)hd_beginStreamingFromDatum:()HealthDaemon handler:
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke;
    v14[3] = &unk_1E62FBAF0;
    id v15 = v7;
    [a1 _startPedometerUpdatesSinceDataRecord:v6 withHandler:v14];
    v8 = v15;
  }
  else
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__196;
    v12[4] = __Block_byref_object_dispose__196;
    uint64_t v13 = objc_msgSend(v6, "hd_datestamp");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_367;
    v9[3] = &unk_1E630D678;
    id v10 = v7;
    v11 = v12;
    v9[4] = a1;
    [a1 queryPedometerDataSinceDataRecord:v6 withHandler:v9];

    _Block_object_dispose(v12, 8);
    v8 = (void *)v13;
  }
}

@end