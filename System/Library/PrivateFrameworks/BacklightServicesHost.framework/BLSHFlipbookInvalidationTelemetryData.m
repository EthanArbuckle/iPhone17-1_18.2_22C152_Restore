@interface BLSHFlipbookInvalidationTelemetryData
- (BLSHFlipbookFramesHistogram)invalidatedFramesHistogram;
- (BLSHFlipbookInvalidationTelemetryData)initWithTimestamp:(double)a3 reason:(id)a4 source:(id)a5 didClearDateSpecifiers:(BOOL)a6 wasReset:(BOOL)a7 invalidatedFramesHistogram:(id)a8 environmentIdentifiers:(id)a9;
- (BOOL)didClearDateSpecifiers;
- (BOOL)wasReset;
- (NSArray)environmentIdentifiers;
- (NSString)reason;
- (NSString)source;
- (double)timestamp;
- (id)description;
@end

@implementation BLSHFlipbookInvalidationTelemetryData

- (BLSHFlipbookInvalidationTelemetryData)initWithTimestamp:(double)a3 reason:(id)a4 source:(id)a5 didClearDateSpecifiers:(BOOL)a6 wasReset:(BOOL)a7 invalidatedFramesHistogram:(id)a8 environmentIdentifiers:(id)a9
{
  id v23 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)BLSHFlipbookInvalidationTelemetryData;
  v20 = [(BLSHFlipbookInvalidationTelemetryData *)&v24 init];
  v21 = v20;
  if (v20)
  {
    v20->_timestamp = a3;
    objc_storeStrong((id *)&v20->_reason, a4);
    objc_storeStrong((id *)&v21->_source, a5);
    v21->_didClearDateSpecifiers = a6;
    v21->_wasReset = a7;
    objc_storeStrong((id *)&v21->_invalidatedFramesHistogram, a8);
    objc_storeStrong((id *)&v21->_environmentIdentifiers, a9);
  }

  return v21;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = BLSShortLoggingStringForContinuousMachTime();
  id v5 = (id)[v3 appendObject:v4 withName:@"timestamp"];

  id v6 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  id v7 = (id)[v3 appendObject:self->_source withName:@"source"];
  id v8 = (id)[v3 appendBool:self->_didClearDateSpecifiers withName:@"didClearDateSpecifiers"];
  id v9 = (id)[v3 appendBool:self->_wasReset withName:@"wasReset"];
  id v10 = (id)[v3 appendObject:self->_invalidatedFramesHistogram withName:@"histogram"];
  [v3 appendArraySection:self->_environmentIdentifiers withName:@"environments" skipIfEmpty:1];
  v11 = [v3 build];

  return v11;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)source
{
  return self->_source;
}

- (BOOL)didClearDateSpecifiers
{
  return self->_didClearDateSpecifiers;
}

- (BOOL)wasReset
{
  return self->_wasReset;
}

- (BLSHFlipbookFramesHistogram)invalidatedFramesHistogram
{
  return self->_invalidatedFramesHistogram;
}

- (NSArray)environmentIdentifiers
{
  return self->_environmentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_invalidatedFramesHistogram, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end