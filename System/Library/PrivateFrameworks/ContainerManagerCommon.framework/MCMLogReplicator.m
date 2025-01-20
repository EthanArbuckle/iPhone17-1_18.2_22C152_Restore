@interface MCMLogReplicator
- (MCMLogReplicator)initWithWorkloop:(id)a3;
- (OS_dispatch_queue)queue;
- (id)volumeChangedDispatchQueue;
- (void)volumeChangedWithEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4;
@end

@implementation MCMLogReplicator

- (void).cxx_destruct
{
  p_queue = &self->_queue;

  objc_storeStrong((id *)p_queue, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)volumeChangedWithEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4
{
  if ((a4 & 3) != 0)
  {
    container_internal_get_first_boot_uuid();
    id v4 = containermanager_copy_global_configuration();
    v5 = objc_msgSend(v4, "defaultUser", 0);
    [v5 UID];
    container_log_replication_enable_to_uid_relative_path();
  }
  else
  {
    MEMORY[0x1F40CB6A8](self, a2, a3);
  }
}

- (id)volumeChangedDispatchQueue
{
  return [(MCMLogReplicator *)self queue];
}

- (MCMLogReplicator)initWithWorkloop:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMLogReplicator;
  v5 = [(MCMLogReplicator *)&v11 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.log_diverter", v7, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

@end