@interface MKBlockBasedSnapshotRequester
+ (id)snapshotRequesterWitHandler:(id)a3;
- (id)handler;
- (void)mapSnapshotCreator:(id)a3 didCreateSnapshot:(id)a4 attributionString:(id)a5 context:(id)a6;
- (void)setHandler:(id)a3;
@end

@implementation MKBlockBasedSnapshotRequester

+ (id)snapshotRequesterWitHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MKBlockBasedSnapshotRequester);
  [(MKBlockBasedSnapshotRequester *)v4 setHandler:v3];

  return v4;
}

- (void)mapSnapshotCreator:(id)a3 didCreateSnapshot:(id)a4 attributionString:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(MKBlockBasedSnapshotRequester *)self handler];
  v10[2](v10, v9, v8);
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end