@interface HSUpdateResponse
- (unsigned)databaseRevision;
- (void)setDatabaseRevision:(unsigned int)a3;
@end

@implementation HSUpdateResponse

- (void)setDatabaseRevision:(unsigned int)a3
{
  self->_databaseRevision = a3;
}

- (unsigned)databaseRevision
{
  return self->_databaseRevision;
}

@end