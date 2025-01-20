@interface VNWarningRecorder
- (BOOL)hasWarnings;
- (VNWarningRecorder)init;
- (id)valueForWarning:(id)a3;
- (id)warnings;
- (void)recordWarning:(id)a3 value:(id)a4;
- (void)recordWarnings:(id)a3;
- (void)setWarnings:(id)a3;
@end

@implementation VNWarningRecorder

- (void).cxx_destruct
{
}

- (void)recordWarnings:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__VNWarningRecorder_recordWarnings___block_invoke;
  v3[3] = &unk_1E5B1FD68;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __36__VNWarningRecorder_recordWarnings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) recordWarning:a2 value:a3];
}

- (void)setWarnings:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_warnings removeAllObjects];
  if (v4) {
    [(NSMutableDictionary *)self->_warnings addEntriesFromDictionary:v4];
  }
}

- (BOOL)hasWarnings
{
  return [(NSMutableDictionary *)self->_warnings count] != 0;
}

- (id)warnings
{
  v2 = (void *)[(NSMutableDictionary *)self->_warnings copy];

  return v2;
}

- (id)valueForWarning:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_warnings objectForKeyedSubscript:a3];

  return v3;
}

- (void)recordWarning:(id)a3 value:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (([v15 isEqualToString:@"VNRequestWarningImageTooSmallForFaceObservations"] & 1) != 0
    || [v15 isEqualToString:@"VNRequestWarningBlinkDetectionFailure"])
  {
    uint64_t v7 = objc_opt_class();
    v8 = (void *)[[NSString alloc] initWithFormat:@"Wrong type for warning value - %@, should be %@", objc_opt_class(), v7];
    +[VNError VNAssert:objc_opt_isKindOfClass() & 1 log:v8];
    v9 = [(NSMutableDictionary *)self->_warnings objectForKeyedSubscript:v15];
    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v9];
      [v10 addObjectsFromArray:v6];
      v11 = [v10 array];
      v12 = (void *)[v11 copy];
      [(NSMutableDictionary *)self->_warnings setObject:v12 forKeyedSubscript:v15];
    }
    else
    {
      v10 = (void *)[v6 copy];
      [(NSMutableDictionary *)self->_warnings setObject:v10 forKeyedSubscript:v15];
    }

    if ([v15 isEqualToString:@"VNRequestWarningImageTooSmallForFaceObservations"]) {
      [(NSMutableDictionary *)self->_warnings setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNRequestWarningImageTooSmall"];
    }
LABEL_13:

    goto LABEL_14;
  }
  if (([v15 isEqualToString:@"VNRequestWarningImageMinimumLongDimension"] & 1) != 0
    || [v15 isEqualToString:@"VNRequestWarningImageMinimumShortDimension"])
  {
    uint64_t v13 = objc_opt_class();
    v8 = (void *)[[NSString alloc] initWithFormat:@"Wrong type for warning value - %@, should be %@", objc_opt_class(), v13];
    +[VNError VNAssert:objc_opt_isKindOfClass() & 1 log:v8];
    v14 = [(NSMutableDictionary *)self->_warnings objectForKeyedSubscript:v15];
    v9 = v14;
    if (!v14 || [v14 compare:v6] == -1)
    {
      [(NSMutableDictionary *)self->_warnings setObject:v6 forKeyedSubscript:v15];
      [(NSMutableDictionary *)self->_warnings setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNRequestWarningImageTooSmall"];
    }
    goto LABEL_13;
  }
  [(NSMutableDictionary *)self->_warnings setObject:v6 forKeyedSubscript:v15];
LABEL_14:
}

- (VNWarningRecorder)init
{
  v7.receiver = self;
  v7.super_class = (Class)VNWarningRecorder;
  v2 = [(VNWarningRecorder *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    warnings = v2->_warnings;
    v2->_warnings = v3;

    v5 = v2;
  }

  return v2;
}

@end