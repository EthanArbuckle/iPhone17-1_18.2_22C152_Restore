@interface _CNDonationToolLogger
- (OS_os_log)log_t;
- (_CNDonationToolLogger)init;
- (void)commandArgs:(id)a3;
@end

@implementation _CNDonationToolLogger

- (_CNDonationToolLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNDonationToolLogger;
  v2 = [(_CNDonationToolLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.donation", "tool");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)commandArgs:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_5);
  v5 = [v4 componentsJoinedByString:@", "];

  v6 = [(_CNDonationToolLogger *)self log_t];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_214267000, v6, OS_LOG_TYPE_INFO, "Command invoked with args: [ %{public}@ ]", (uint8_t *)&v7, 0xCu);
  }
}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
}

@end