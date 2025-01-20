@interface _GEOTileDBMarkCurrentOperation
- (void)performWithDB:(id)a3;
@end

@implementation _GEOTileDBMarkCurrentOperation

- (void)performWithDB:(id)a3
{
  id v4 = a3;
  if (([v4 _markExistingTileDataAsCurrentOnDBQueue:&self->super._key reason:self->super._reason subscriptionIdentifier:self->super._subscriptionIdentifier] & 1) == 0)
  {
    v5 = GEOGetTileDBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Tried to update existing tile entry to 'current', but it doesn't exist. Falling back to a full 'add'", buf, 2u);
    }

    v6.receiver = self;
    v6.super_class = (Class)_GEOTileDBMarkCurrentOperation;
    [(_GEOTileDBAddTileOperation *)&v6 performWithDB:v4];
  }
}

@end