@interface MapsSuggestionsNotificationSender
- (MapsSuggestionsNotificationSender)initWithDarwinNotification:(const char *)a3;
- (id).cxx_construct;
- (void)notify;
- (void)notifyWithPayloadString:(id)a3;
- (void)notifyWithState:(unint64_t)a3;
@end

@implementation MapsSuggestionsNotificationSender

- (MapsSuggestionsNotificationSender)initWithDarwinNotification:(const char *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsNotificationSender;
  if ([(MapsSuggestionsNotificationSender *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)notify
{
}

- (void)notifyWithState:(unint64_t)a3
{
}

- (void)notifyWithPayloadString:(id)a3
{
  value = self->_sender.__ptr_.__value_;
  id v5 = a3;
  uint64_t v4 = MapsSuggestionsIPCPayloadForNSString(v5);
  MSg::NotificationSender::notify((MSg::NotificationSender *)value, v4);
}

- (void).cxx_destruct
{
  value = self->_sender.__ptr_.__value_;
  self->_sender.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<MSg::NotificationSender>::operator()[abi:ne180100]((uint64_t)value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end