@interface BLSHFlipbookRenderSessionTelemetryData
- (BLSHFlipbookFramesHistogram)sessionFramesHistogram;
- (BLSHFlipbookRenderSessionTelemetryData)initWithTimestamp:(double)a3 environmentIdentifiers:(id)a4 reasonEnded:(id)a5 sessionFramesHistogram:(id)a6 totalPreparationDuration:(double)a7 accumulatedLayoutDuration:(double)a8 accumulatedRenderDuration:(double)a9 preventedSleepDuration:(double)a10 didFailToRender:(BOOL)a11 timedOutEnvironmentCount:(unsigned int)a12;
- (BOOL)didFailToRender;
- (BOOL)preventedSleep;
- (NSArray)environmentIdentifiers;
- (NSString)firstEnvironmentIdentifier;
- (NSString)reasonEnded;
- (double)accumulatedLayoutDuration;
- (double)accumulatedRenderDuration;
- (double)preventedSleepDuration;
- (double)timestamp;
- (double)totalPreparationDuration;
- (id)description;
- (unsigned)environmentCount;
- (unsigned)timedOutEnvironmentCount;
@end

@implementation BLSHFlipbookRenderSessionTelemetryData

- (BLSHFlipbookRenderSessionTelemetryData)initWithTimestamp:(double)a3 environmentIdentifiers:(id)a4 reasonEnded:(id)a5 sessionFramesHistogram:(id)a6 totalPreparationDuration:(double)a7 accumulatedLayoutDuration:(double)a8 accumulatedRenderDuration:(double)a9 preventedSleepDuration:(double)a10 didFailToRender:(BOOL)a11 timedOutEnvironmentCount:(unsigned int)a12
{
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  v29.receiver = self;
  v29.super_class = (Class)BLSHFlipbookRenderSessionTelemetryData;
  v26 = [(BLSHFlipbookRenderSessionTelemetryData *)&v29 init];
  v27 = v26;
  if (v26)
  {
    v26->_timestamp = a3;
    objc_storeStrong((id *)&v26->_environmentIdentifiers, a4);
    objc_storeStrong((id *)&v27->_reasonEnded, a5);
    objc_storeStrong((id *)&v27->_sessionFramesHistogram, a6);
    v27->_totalPreparationDuration = a7;
    v27->_accumulatedLayoutDuration = a8;
    v27->_accumulatedRenderDuration = a9;
    v27->_preventedSleepDuration = a10;
    v27->_didFailToRender = a11;
    v27->_timedOutEnvironmentCount = a12;
  }

  return v27;
}

- (id)description
{
  v3 = objc_opt_new();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke;
  v15[3] = &unk_2645322D0;
  id v4 = v3;
  id v16 = v4;
  v17 = self;
  [v4 appendProem:self block:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_2;
  v12[3] = &unk_2645322D0;
  id v5 = v4;
  id v13 = v5;
  v14 = self;
  [v5 appendBodySectionWithName:0 openDelimiter:@" {" closeDelimiter:@"} " block:v12];
  environmentIdentifiers = self->_environmentIdentifiers;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_3;
  v10[3] = &unk_264532B08;
  id v11 = v5;
  id v7 = v5;
  [v7 appendCollection:environmentIdentifiers withName:@"environments" itemBlock:v10];
  v8 = [v7 description];

  return v8;
}

id __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = BLSShortLoggingStringForContinuousMachTime();
  id v4 = (id)[v2 appendObject:v3 withName:@"done@"];

  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"reason"];
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"total", 0, *(double *)(*(void *)(a1 + 40) + 48));
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"layout", 0, *(double *)(*(void *)(a1 + 40) + 56));
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"render", 0, *(double *)(*(void *)(a1 + 40) + 64));
  if ([*(id *)(a1 + 40) preventedSleep]) {
    id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"preventedSleep", 0, *(double *)(*(void *)(a1 + 40) + 72));
  }
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "count"), @"env∑");
  id result = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"failedToRender" ifEqualTo:1];
  uint64_t v12 = *(unsigned int *)(*(void *)(a1 + 40) + 12);
  if (v12) {
    return (id)[*(id *)(a1 + 32) appendUnsignedInt:v12 withName:@"timeouts"];
  }
  return result;
}

id __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:0];
}

id __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0];
}

- (BOOL)preventedSleep
{
  return self->_preventedSleepDuration > 0.0;
}

- (NSString)firstEnvironmentIdentifier
{
  return (NSString *)[(NSArray *)self->_environmentIdentifiers firstObject];
}

- (unsigned)environmentCount
{
  return [(NSArray *)self->_environmentIdentifiers count];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)environmentIdentifiers
{
  return self->_environmentIdentifiers;
}

- (NSString)reasonEnded
{
  return self->_reasonEnded;
}

- (BLSHFlipbookFramesHistogram)sessionFramesHistogram
{
  return self->_sessionFramesHistogram;
}

- (double)totalPreparationDuration
{
  return self->_totalPreparationDuration;
}

- (double)accumulatedLayoutDuration
{
  return self->_accumulatedLayoutDuration;
}

- (double)accumulatedRenderDuration
{
  return self->_accumulatedRenderDuration;
}

- (double)preventedSleepDuration
{
  return self->_preventedSleepDuration;
}

- (BOOL)didFailToRender
{
  return self->_didFailToRender;
}

- (unsigned)timedOutEnvironmentCount
{
  return self->_timedOutEnvironmentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionFramesHistogram, 0);
  objc_storeStrong((id *)&self->_reasonEnded, 0);

  objc_storeStrong((id *)&self->_environmentIdentifiers, 0);
}

@end