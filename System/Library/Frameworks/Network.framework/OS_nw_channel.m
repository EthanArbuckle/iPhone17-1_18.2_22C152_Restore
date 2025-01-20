@interface OS_nw_channel
- (void)dealloc;
@end

@implementation OS_nw_channel

- (void)dealloc
{
  while (1)
  {
    Class isa = self[36].super.super.isa;
    if (!isa) {
      break;
    }
    uint64_t v4 = *((void *)isa + 2);
    v5 = (objc_class *)*((void *)isa + 3);
    if (v4)
    {
      *(void *)(v4 + 24) = v5;
      v5 = (objc_class *)*((void *)isa + 3);
    }
    else
    {
      self[37].super.super.Class isa = v5;
    }
    *(void *)v5 = v4;
    *((void *)isa + 2) = 0;
    *((void *)isa + 3) = 0;
    os_release(isa);
  }
  nw_channel_release_frame_array((uint64_t)self, (uint64_t *)&self[40]);
  nw_channel_release_frame_array((uint64_t)self, (uint64_t *)&self[38]);
  v6 = (os_unfair_lock_s *)self[35].super.super.isa;
  if (v6)
  {
    _nw_hash_table_release(v6);
    self[35].super.super.Class isa = 0;
  }
  nw_channel_close((uint64_t)self);
  v7 = self[26].super.super.isa;
  if (v7)
  {
    dispatch_release(v7);
    self[26].super.super.Class isa = 0;
  }
  Class v8 = self[19].super.super.isa;
  if (v8)
  {
    os_release(v8);
    self[19].super.super.Class isa = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)OS_nw_channel;
  [(OS_nw_channel *)&v9 dealloc];
}

@end