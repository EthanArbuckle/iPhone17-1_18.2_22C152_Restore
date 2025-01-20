@interface CTBIMDispositionNotificationWrapper
- (CTBIMDispositionNotificationWrapper)initWithWrapped:(optional<ctb::IMDispositionNotification> *)a3;
- (id).cxx_construct;
- (optional<ctb::IMDispositionNotification>)wrapped;
@end

@implementation CTBIMDispositionNotificationWrapper

- (CTBIMDispositionNotificationWrapper)initWithWrapped:(optional<ctb::IMDispositionNotification> *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CTBIMDispositionNotificationWrapper;
  v4 = [(CTBIMDispositionNotificationWrapper *)&v7 init];
  v5 = v4;
  if (v4) {
    std::__optional_storage_base<ctb::IMDispositionNotification,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::IMDispositionNotification,false>>((uint64_t)&v4->_wrapped, (__n128 *)a3);
  }
  return v5;
}

- (optional<ctb::IMDispositionNotification>)wrapped
{
  return (optional<ctb::IMDispositionNotification> *)std::__optional_copy_base<ctb::IMDispositionNotification,false>::__optional_copy_base[abi:ne180100](retstr, v1 + 8);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 64) = 0;
  return self;
}

@end