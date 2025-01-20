@interface DNDSMutableIDSRecordMetadata
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setLastModified:(id)a3;
- (void)setRecordID:(id)a3;
@end

@implementation DNDSMutableIDSRecordMetadata

- (void)setRecordID:(id)a3
{
  v4 = (DNDSIDSRecordID *)[a3 copy];
  recordID = self->super._recordID;
  self->super._recordID = v4;
  MEMORY[0x1F41817F8](v4, recordID);
}

- (void)setLastModified:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  lastModified = self->super._lastModified;
  self->super._lastModified = v4;
  MEMORY[0x1F41817F8](v4, lastModified);
}

- (void)setDeleted:(BOOL)a3
{
  self->super._deleted = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSIDSRecordMetadata alloc];
  return [(DNDSIDSRecordMetadata *)v4 _initWithRecordMetadata:self];
}

@end