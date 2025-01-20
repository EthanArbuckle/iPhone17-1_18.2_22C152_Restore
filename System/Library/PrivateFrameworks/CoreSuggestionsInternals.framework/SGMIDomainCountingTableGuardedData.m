@interface SGMIDomainCountingTableGuardedData
- (NSArray)currentColumns;
- (SGMIDomainCountingTableGuardedData)init;
- (int64_t)schemaVersion;
- (void)setCurrentColumns:(id)a3;
- (void)setSchemaVersion:(int64_t)a3;
@end

@implementation SGMIDomainCountingTableGuardedData

- (void).cxx_destruct
{
}

- (void)setCurrentColumns:(id)a3
{
}

- (NSArray)currentColumns
{
  return self->_currentColumns;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(int64_t)a3
{
  if (self->_schemaVersion != a3)
  {
    currentColumns = self->_currentColumns;
    self->_currentColumns = 0;

    self->_schemaVersion = a3;
  }
}

- (SGMIDomainCountingTableGuardedData)init
{
  v3.receiver = self;
  v3.super_class = (Class)SGMIDomainCountingTableGuardedData;
  result = [(SGMIDomainCountingTableGuardedData *)&v3 init];
  if (result) {
    result->_schemaVersion = -1;
  }
  return result;
}

@end